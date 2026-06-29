___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "CookieKita Consent Banner",
  "brand": {
    "id": "brand_dummy",
    "displayName": "CookieKita"
  },
  "description": "Loads the CookieKita GDPR/ePrivacy consent banner, which blocks trackers before consent, forwards Google Consent Mode v2 signals and logs consent. Enter your Site Key from the CookieKita dashboard.",
  "categories": ["ANALYTICS", "ADVERTISING", "UTILITY"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteKey",
    "displayName": "Site Key",
    "simpleValueType": true,
    "help": "Your 32-character Site Key from the CookieKita dashboard (Site → Integration). Looks like a1b2c3d4e5f6…",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": ["^[a-fA-F0-9]{32}$"],
        "errorMessage": "Site Key must be 32 hexadecimal characters."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const makeString = require('makeString');

const siteKey = makeString(data.siteKey);
const url = 'https://cookiekita.com/banner.js?k=' + encodeUriComponent(siteKey);

injectScript(url, data.gtmOnSuccess, data.gtmOnFailure, url);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cookiekita.com/banner.js?k=*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Injects the banner with the configured site key
  code: |-
    const mockData = { siteKey: 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4' };
    let injectedUrl;
    mock('injectScript', (url, onSuccess) => {
      injectedUrl = url;
      onSuccess();
    });

    runCode(mockData);

    assertThat(injectedUrl).isEqualTo('https://cookiekita.com/banner.js?k=a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4');
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

CookieKita Consent Banner — loads https://cookiekita.com/banner.js with the
site's public Site Key. The banner handles consent UI, pre-consent tracker
blocking, Google Consent Mode v2 / Microsoft UET signals and consent logging.

Recommended setup:
  • Trigger: Consent Initialization - All Pages (so the banner loads before
    other tags and Consent Mode defaults are set early).
  • Field: Site Key — copy it from your CookieKita dashboard.

Only the public Site Key is used; no secret credentials are stored in the
container. Privacy policy: https://cookiekita.com/privacy
