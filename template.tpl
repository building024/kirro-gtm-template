___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-platform/tag-manager/templates/gallery-tos
(or such other URL as Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Kirro A/B Testing",
  "categories": ["EXPERIMENTATION", "ANALYTICS"],
  "brand": {
    "id": "brand_kirro",
    "displayName": "Kirro",
    "thumbnail": ""
  },
  "description": "Load the Kirro A/B testing SDK on your website. Kirro analyzes your site, suggests what to test, and tracks results via GA4.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Kirro API key. Starts with kr_live_. Find it in your \u003ca href\u003d\"https://app.kirro.io\"\u003eKirro dashboard\u003c/a\u003e under Setup."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const log = require('logToConsole');

var apiKey = data.apiKey;
var scriptUrl = 'https://app.kirro.io/sdk/kirro.js';

if (!apiKey) {
  log('Kirro: No API key provided');
  data.gtmOnFailure();
  return;
}

setInWindow('__KIRRO_API_KEY__', apiKey, true);

if (queryPermission('inject_script', scriptUrl)) {
  injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'kirroSdk');
} else {
  log('Kirro: Script injection not permitted for ' + scriptUrl);
  data.gtmOnFailure();
}


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
                "string": "https://app.kirro.io/"
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
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__KIRRO_API_KEY__"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
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
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
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

scenarios: []


___NOTES___

Created on 2026-03-25.
