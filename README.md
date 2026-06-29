# CookieKita Consent Banner — Google Tag Manager template

A Google Tag Manager **custom tag template** that loads the
[CookieKita](https://cookiekita.com) GDPR / ePrivacy consent banner on any site
managed through GTM — no CMS plugin required.

The banner:

- Shows a consent banner / preference modal, localized to the visitor's language.
- **Blocks trackers before consent** (Google Analytics, Meta Pixel, GTM-loaded
  tags, and 30+ services) and unblocks them only after the matching consent.
- Forwards **Google Consent Mode v2** and **Microsoft UET** consent signals.
- Honors **GPC / DNT** and supports GDPR + US (CCPA/CPRA) modes.
- Logs consent to your CookieKita dashboard for audit/proof.

Only your **public Site Key** is used — no secret credentials are stored in the
container.

## Install

1. In Google Tag Manager open **Templates → Tag Templates → Search Gallery**,
   search for **CookieKita Consent Banner**, and add it. *(Or import
   `template.tpl` via **New → ⋮ → Import**.)*
2. Create a new tag using the template.
3. Paste your **Site Key** (Dashboard → your site → Integration). It is 32
   hexadecimal characters.
4. Set the trigger to **Consent Initialization - All Pages** so the banner loads
   first and Consent Mode defaults are set early.
5. Submit / publish the container.

## How the Site Key is passed

The template injects `https://cookiekita.com/banner.js?k=YOUR_SITE_KEY`.
`banner.js` reads the key from the `k` URL parameter (it also supports the
`data-site-key` attribute and a `window.COOKIEKITA_SITE_KEY` global for non-GTM
embeds).

## External service

This template loads `banner.js` from **cookiekita.com**, the consent-management
service it is a client for. See the
[Terms of Service](https://cookiekita.com/terms) and
[Privacy Policy](https://cookiekita.com/privacy).

## License

[Apache-2.0](./LICENSE)
