module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt);
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    clean:
      build:
        src: ['./build']
      tmp:
        src: ['./tmp']
    copy:
      compile:
        src: 'bower_components/**'
        dest: 'tmp/'
      build:
        files: [
          expand: true
          cwd: 'tmp/'
          src: ['index.html']
          dest: 'build/'
          ext: '.html'
        ]
    jade:
      compile:
        options:
          data:
            debug: false
        files: [
          expand: true
          cwd: './'
          src: ['**/*.jade']
          dest: 'tmp/'
          ext: '.html'
        ]
    coffee:
      compile:
        options:
          sourceMap: true
          bare: true
        files: [
          expand: true
          cwd: 'js/'
          src: ['**/*.coffee']
          dest: 'tmp/js'
          ext: '.js'
        ]
    html2js:
      prepare:
        src: ['tmp/templates/**/*.html']
        dest: 'tmp/js/templates.js'
        options:
          base: './tmp/'
          singleModule: true
    ngAnnotate:
      compile:
        files: [
          expand: true
          cwd: 'tmp/js/'
          src: ['**/*.js']
          dest: 'tmp/js'
          ext: '.js'
        ]
    browserify:
      compile:
        files:
          'build/build.js': ['tmp/js/app.js']
        options:
          bundleOptions:
            debug: true
          transform: ['browserify-ngannotate', 'uglifyify']
    concurrent:
      compile: ['jade', 'coffee']
      prepare: ['ngAnnotate', 'html2js']
      build: ['browserify']
  grunt.registerTask 'default', ['clean:build', 'copy:compile', 'concurrent:compile', 'concurrent:prepare', 'concurrent:build', 'copy:build', 'clean:tmp']
