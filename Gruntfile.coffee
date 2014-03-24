module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
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

  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.registerTask('build', [
    'coffeelint',
    'coffee',
    'jshint',
    'uglify'
  ])
  grunt.registerTask('default', ['build'])

