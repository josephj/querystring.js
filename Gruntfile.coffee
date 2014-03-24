module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    connect:
      server:
        options:
          base: ''
          port: 9999
    watch: {}
    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app: ['Gruntfile.coffee', 'querystring.coffee']
    coffee:
      compile:
        files:
          'querystring.js': 'querystring.coffee'
    jshint:
      all: ['querystring.js']
      options:
        jshintrc: '.jshintrc'
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: '<%= pkg.name %>.js'
        dest: '<%= pkg.name %>.min.js'

  # Loads dependencies
  deps = grunt.file.readJSON('package.json').devDependencies
  grunt.loadNpmTasks(key) for key, version of deps when (key isnt 'grunt' and key.indexOf('grunt') == 0)

  grunt.registerTask('dev', ['connect', 'watch'])
  grunt.registerTask('build', [
    'coffeelint',
    'coffee',
    'jshint',
    'uglify'
  ])

  grunt.registerTask('default', ['build'])

