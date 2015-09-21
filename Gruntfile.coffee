module.exports = (grunt) ->

  require('load-grunt-tasks') grunt
  require("time-grunt") grunt

  grunt.initConfig
    yeoman:
      app: 'app'
      dist: 'dist'
      wrapper: 'assets/templates/{,*/}*.html'

    concurrent:
      dist: [
        'imagemin'
      ]

    autoprefixer:
      dist:
        src: '<%= yeoman.app %>/_tmp/stylesheets/styles.css'

    sass:
      dist:
        options:
          outputStyle: 'compressed'
        files:
          '<%= yeoman.app %>/_tmp/stylesheets/styles.css': '<%= yeoman.app %>/assets/stylesheets/styles.sass'
      dev:
        options:
          outputStyle: 'expanded'
          sourceComments: 'normal'
        files:
          '<%= yeoman.app %>/_tmp/stylesheets/styles.css': '<%= yeoman.app %>/assets/stylesheets/styles.sass'

    coffee:
      dist:
        expand: true
        cwd: '<%= yeoman.app %>/assets/javascripts'
        src: '{,*/}*.coffee'
        dest: '<%= yeoman.app %>/_tmp/javascripts'
        ext: '.js'

    watch:
      sass:
        options:
          spawn: false
        files: ['<%= yeoman.app %>/assets/stylesheets/{,*/}*.sass']
        tasks: ['sass:dev', 'autoprefixer', 'notify:sass']

      coffee:
        options:
            spawn: false
          files: ['<%= yeoman.app %>/assets/javascripts/{,*/}*.coffee']
          tasks: [
            'coffee:dist'
            'notify:coffee'
          ]

      js:
        files: ['<%= yeoman.app %>/assets/javascripts/{,*/}*.js']
        tasks: ['copy:js']

      handlebars:
        options:
          spawn: false
        files: ['<%= yeoman.app %>/assets/javascripts/templates/{,*/}*.hbs']
        tasks: [
          'handlebars'
          'notify:handlebars'
        ]

      livereload:
        options:
          livereload: true
          spawn: false
        files: [
          '<%= yeoman.app %>/_tmp/stylesheets/{,*/}*.css'
          '<%= yeoman.app %>/_tmp/javascripts/{,*/}*.js'
          '<%= yeoman.app %>/assets/templates/{,*/}*.html'
          '<%= yeoman.app %>/assets/images/{,*/}*.{gif,jpeg,jpg,png,svg,webp}'
        ]

    useminPrepare:
      html: '<%= yeoman.app %>/<%= yeoman.wrapper %>'
      options:
        dest: '<%= yeoman.dist %>'
        root: '<%= yeoman.app %>'

    copy:
      dist:
        expand: true
        dot: true
        cwd: '<%= yeoman.app %>'
        dest: '<%= yeoman.dist %>'
        src: [
          '**'
          '!**/assets/stylesheets/**'
          '!**/assets/javascripts/**'
          '!**/bower_components/**'
          '!**/_tmp/**'
        ]

      js:
        expand: true
        cwd: '<%= yeoman.app %>/assets/javascripts/'
        src: ['**/*.js']
        dest: '<%= yeoman.app %>/_tmp/javascripts/'

      requirejs:
        expand: true
        cwd: '<%= yeoman.app %>/bower_components'
        src: ['requirejs/require.js']
        dest: '<%= yeoman.dist %>/bower_components'

    usemin:
      html: ['<%= yeoman.dist %>/<%= yeoman.wrapper %>']
      css: ['<%= yeoman.dist %>/assets/stylesheets/{,*/}*.css']
      options:
        assetsDirs: '<%= yeoman.dist %>'

    requirejs:
      compile:
        options:
          baseUrl: "<%= yeoman.app %>/_tmp/javascripts"
          mainConfigFile: "<%= yeoman.app %>/_tmp/javascripts/main.js"
          dir: '<%= yeoman.dist %>/assets/javascripts'
          modules: [{ name: 'main' }]
          removeCombined: true

    rev:
      dist:
        files:
          src: [
            '<%= yeoman.dist %>/assets/stylesheets/{,*/}*.css'
            '<%= yeoman.dist %>/assets/javascripts/{,*/}*.js'
          ]

    clean:
      dist:
        dot: true
        src: [
          '_tmp'
          '<%= yeoman.dist %>/*'
        ]

      dev:
        dot: true
        src: [
          '<%= yeoman.app %>/_tmp'
        ]

    imagemin:
      dist:
        expand: true
        cwd: '<%= yeoman.dist %>/assets/images'
        src: '{,*/}*.{gif,jpeg,jpg,png}'
        dest: '<%= yeoman.dist %>/assets/images'

    uglify:
      requirejs:
        files:
          '<%= yeoman.dist %>/bower_components/requirejs/require.js': ['<%= yeoman.dist %>/bower_components/requirejs/require.js']

    handlebars:
      compile:
        options:
          namespace: 'Templates'
          amd: true
        files:
          '<%= yeoman.app %>/_tmp/javascripts/templates/templates.js': ['<%= yeoman.app %>/assets/javascripts/templates/{,*/}*.hbs']

    modernizr:
      dist:
        devFile: '<%= yeoman.app %>/bower_components/modernizr/modernizr.js'
        outputFile: '<%= yeoman.dist %>/bower_components/modernizr/modernizr.js'
        files:
          src: [
            '<%= yeoman.dist %>/assets/stylesheets/{,*/}*.css'
            '<%= yeoman.dist %>/assets/javascripts/{,*/}*.js'
            '<%= yeoman.dist %>/assets/javascripts/{,*/}*.coffee'
          ]
        uglify: true

    replace:
      dist:
        options:
          patterns: [
            match: '/\/_tmp\/javascripts\//g'
            replacement: '/assets/javascripts/'
            expression: true
          ]
        files: [
          expand: true
          src: '<%= yeoman.dist %>/<%= yeoman.wrapper %>'
          dest: '.'
        ]

    casperjs:
      files: 'test/{,*/}*.{coffee,js}'

    notify:
      sass:
        options:
          title: 'Sass compiled'
          message: 'Grunt successfully compiled your Sass files'
      coffee:
        options:
          title: 'CoffeeScript compiled'
          message: 'Grunt successfully compiled your CoffeeScript files'
      handlebars:
        options:
          title: 'Handlebars compiled'
          message: 'Grunt successfully compiled your Handlebars files'
      dist:
        options:
          title: "Build complete"
          message: "Grunt successfully compiled your build in /<%= yeoman.dist %>/"

  grunt.registerTask "default", [
    "clean:dev"
    "copy:js"
    "sass:dev"
    "autoprefixer"
    "coffee"
    "handlebars"
    "watch"
  ]

  grunt.registerTask "build", [
    "clean:dist"
    "sass:dist"
    "autoprefixer"
    "coffee:dist"
    "handlebars"
    "useminPrepare"
    "concat"
    "cssmin"
    "copy:dist"
    "requirejs"
    "copy:requirejs"
    "uglify"
    "replace:dist"
    "concurrent:dist"
    "modernizr"
    "rev"
    "usemin"
    "notify:dist"
  ]

  grunt.registerTask "test", [
    "casperjs"
  ]