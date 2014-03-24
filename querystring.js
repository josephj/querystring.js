(function() {
  var QueryString, exports;

  QueryString = {
    parse: function(qs) {
      var dict, key, m, re, value;
      dict = {};
      if (qs.charAt(0) === '?') {
        qs = qs.substring(1);
      }
      re = /([^=&]+)(=([^&]*))?/g;
      while ((m = re.exec(qs))) {
        key = decodeURIComponent(m[1].replace(/\+/g, ' '));
        value = m[3] ? this.decode(m[3]) : '';
        dict[key] = value;
      }
      return dict;
    },
    decode: function(s) {
      s = s.replace(/\+/g, ' ');
      s = s.replace(/%([EF][0-9A-F])%([89AB][0-9A-F])%([89AB][0-9A-F])/g, function(code, hex1, hex2, hex3) {
        var n, n1, n2, n3;
        n1 = parseInt(hex1, 16) - 0xE0;
        n2 = parseInt(hex2, 16) - 0x80;
        if (n1 === 0 && n2 < 32) {
          return code;
        }
        n3 = parseInt(hex3, 16) - 0x80;
        n = (n1 << 12) + (n2 << 6) + n3;
        if (n > 0xFFFF) {
          return code;
        }
        return String.fromCharCode(n);
      });
      s = s.replace(/%([CD][0-9A-F])%([89AB][0-9A-F])/g, function(code, hex1, hex2) {
        var n1, n2;
        n1 = parseInt(hex1, 16) - 0xC0;
        if (n1 < 2) {
          return code;
        }
        n2 = parseInt(hex2, 16) - 0x80;
        return String.fromCharCode((n1 << 6) + n2);
      });
      s = s.replace(/%([0-7][0-9A-F])/g, function(code, hex) {
        return String.fromCharCode(parseInt(hex, 16));
      });
      return s;
    },
    stringify: function(hash) {
      var key, s;
      s = [];
      for (key in hash) {
        s[s.length] = encodeURIComponent(key) + '=' + encodeURIComponent(hash[key]);
      }
      return s.join('&').replace(/%20/g, '+');
    }
  };

  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = QueryString;
    }
  } else if (typeof define === 'function' && define.amd) {
    define([], function() {
      return QueryString;
    });
  } else {
    this.QueryString = QueryString;
  }

}).call(this);
