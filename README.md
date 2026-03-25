# Kirro A/B Testing - GTM Template

Official Google Tag Manager template for [Kirro](https://kirro.io), the A/B testing tool.

## What it does

Loads the Kirro SDK on your website so you can run A/B tests. The SDK is 9KB and handles visitor assignment, DOM changes, impression tracking, and GA4 conversion tracking.

## Setup

1. In GTM, go to Tags > New > Choose tag type > Search "Kirro"
2. Enter your Kirro API key (find it in your [Kirro dashboard](https://app.kirro.io) under Setup)
3. Set the trigger to "All Pages"
4. Publish

Your API key starts with `kr_live_`. You can find it in your Kirro dashboard under Setup.

## How it works

The template sets your API key as a window variable and loads the Kirro SDK script from `app.kirro.io`. The SDK then fetches your active tests, assigns visitors to versions, applies changes, and tracks results.

## Links

- [Kirro website](https://kirro.io)
- [Setup guide](https://kirro.io/blog/google-tag-manager)
- [Privacy policy](https://kirro.io/privacy-policy)
