QueryString.js
--------------

Adds support for serializing JavaScript objects into query strings and parsing JavaScript objects from query strings format. This utility is compatible with Node.JS, RequireJS, and JavaScript in browsers.

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

## How to Test

You need to make sure you have Node.JS installed in your environment.
You also need to have a [SauceLabs](https://saucelabs.com/) (for different browser environments testing) account.

1. Fork this repository.
2. Clone the forked repository.
3. Install `travis` gem.

   ```
   gem install travis
   ```
4. Install Node.JS dependencies.
   
   ```
   npm install
   ```
5. You need to update the encrypt keys in .travis.yml. You can remove them and use the following commands to generate it. It will write to your .travis.yml automatically. 

   ```
   $ travis encrypt SAUCE_USERNAME=<Your SauceLabs User Name> -r <Your Github User Name>/querystring.js --add
   $ travis encrypt SAUCE_ACCESS_KEY=<Your SauceLabs Access Key> -r <Your Github User Name>/querystring.js --add
   ```
6. You can do test with following approaches.
   * Manual testing: Execute `grunt dev` and open the URL `http://localhost:9999/tests/unit/SpecRunner.html`
   * Local CLI Testing: 
   
      ```
      grunt jasmine
      ```
   * Connecting to SauceLabs for testing in different browser environments.
    
     ```
     grunt saucelabs-jasmine
     ```
   * If you enabled the forked repository in [Travis CI](https://travis-ci.org/profile), it will test both CLI and SauceLabs automatically whenever you push.
