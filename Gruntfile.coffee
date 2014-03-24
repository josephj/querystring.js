module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    connect:
      server:
        options:
          base: ''
          port: 9999
    watch:
      tasks: 'coffee'
    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app: ['Gruntfile.coffee', 'querystring.coffee']
    coffee:
      compile:
        files:
          'tests/unit/spec/querystring-spec.js': 'tests/unit/spec/querystring-spec.coffee'
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
  for key, version of deps
    if (key isnt 'grunt' and key isnt 'grunt-cli' and key.indexOf('grunt') == 0)
      grunt.loadNpmTasks(key)

  grunt.registerTask('dev', ['connect', 'watch'])
  grunt.registerTask('build', [
    'coffeelint',
    'coffee',
    'jshint',
    'uglify'
  ])

  grunt.registerTask('default', ['build'])

