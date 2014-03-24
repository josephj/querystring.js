QueryString =

  parse: (qs) ->
    dict = {}
    qs = qs.substring(1) if qs.charAt(0) is '?'
    re = /([^=&]+)(=([^&]*))?/g # Pattern for matching parameter name and value.
    while (m = re.exec(qs))
      key = decodeURIComponent(m[1].replace(/\+/g, ' '))
      value = if m[3] then @.decode(m[3]) else ''
      dict[key] = value
    dict
  decode: (s) ->
    s = s.replace /\+/g, ' '
    s = s.replace /%([EF][0-9A-F])%([89AB][0-9A-F])%([89AB][0-9A-F])/g, (code, hex1, hex2, hex3) ->
      n1 = parseInt(hex1, 16) - 0xE0
      n2 = parseInt(hex2, 16) - 0x80
      return code if (n1 == 0 and n2 < 32)
      n3 = parseInt(hex3, 16) - 0x80
      n = (n1 << 12) + (n2 << 6) + n3
      return code if n > 0xFFFF
      String.fromCharCode(n)
    s = s.replace /%([CD][0-9A-F])%([89AB][0-9A-F])/g, (code, hex1, hex2) ->
      n1 = parseInt(hex1, 16) - 0xC0
      return code if n1 < 2
      n2 = parseInt(hex2, 16) - 0x80
      return String.fromCharCode((n1<<6) + n2)
    s = s.replace /%([0-7][0-9A-F])/g, (code, hex) ->
      return String.fromCharCode(parseInt(hex,16))
    s
  stringify: (hash) ->
    s = []
    for key of hash
      s[s.length] = encodeURIComponent(key) + '=' + encodeURIComponent(hash[key])
    s.join('&').replace(/%20/g, '+')

# NodeJS module
if typeof exports != 'undefined'
  if typeof module != 'undefined' && module.exports
    exports = module.exports = QueryString
# AMD (RequireJS)
else if (typeof define == 'function' && define.amd)
  define [], ->
    QueryString
# General Situation
else
  @.QueryString = QueryString

