describe 'QueryString', ->

  describe 'parse', ->
    it 'should parse querystring to hash object', ->
      value = 'key1=value1&key2=value2'
      result = {"key1": "value1", "key2": "value2"}
      console.log(QueryString.parse(value))
      console.log(result)
      expect(QueryString.parse(value)).toEqual(result)

  describe 'stringify', ->
    it 'should stringify hash object to querystring', ->
      value = {"key1": "value1", "key2": "value2"}
      result = 'key1=value1&key2=value2'
      expect(QueryString.stringify(value)).toEqual(result)

