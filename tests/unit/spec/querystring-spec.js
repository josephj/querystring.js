(function() {
  describe('QueryString', function() {
    describe('parse', function() {
      return it('should parse querystring to hash object', function() {
        var result, value;
        value = 'key1=value1&key2=value2';
        result = {
          "key1": "value1",
          "key2": "value2"
        };
        return expect(QueryString.parse(value)).toEqual(result);
      });
    });
    return describe('stringify', function() {
      return it('should stringify hash object to querystring', function() {
        var result, value;
        value = {
          "key1": "value1",
          "key2": "value2"
        };
        result = 'key1=value1&key2=value2';
        return expect(QueryString.stringify(value)).toEqual(result);
      });
    });
  });

}).call(this);
