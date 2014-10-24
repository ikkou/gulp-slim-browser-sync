gulp            = require 'gulp'
browserSync     = require 'browser-sync'

$ = require('gulp-load-plugins')()

# browser-sync
gulp.task "bs", ->
  console.log '---------- server task ----------'
  browserSync.init null,
    server:
      baseDir: './dist/'
    port:
      3333
    notify:
      true

# browser-sync reload
gulp.task 'reload', ->
  browserSync.reload()

# slim
gulp.task 'slim', ->
  console.log '---------- slim task ----------'
  gulp.src './src/**/*.slim'
    .pipe $.slim pretty: true
    .pipe gulp.dest './dist/'

# watch
gulp.task 'watch', ['bs'],->
  console.log '---------- watch task ----------'
  gulp.watch './src/**/*.slim', ['slim']
  gulp.watch './dist/**/*.html', ['reload']

# default
gulp.task 'default', ['slim']