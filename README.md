QueryString.js
--------------

Adds support for serializing JavaScript objects into query strings and parsing JavaScript objects from query strings format.

[![Travis CI Build Status](https://travis-ci.org/josephj/querystring.js.svg)](https://travis-ci.org/josephj/querystring.js)


## How to Use

1. Add QueryString.js utility to your web page.

    ```html
    <script type="text/javascript" src="querystring.min.js"></script>
    ````
1. Parse query string to hash. 

    ```javascript
    var hash = QueryString.parse('key1=val1&key2=val2');
    console.log(hash); // {"key1": "val1", "key2": "val2"}
    ```
1. Stringify hash to query tring.

    ```javascript
    var hash = {"key1": "val1", "key2": "val2"};
    var qs = QueryString.stringify(hash);
    console.log(qs); // 'key1=val1&key2=val2'
    ```
