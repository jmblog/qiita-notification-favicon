gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
watch      = require 'gulp-watch'
coffeelint = require 'gulp-coffeelint'
zip        = require 'gulp-zip'

gulp.task 'default', ['build']

gulp.task 'coffeelint', ->
  gulp.src 'app/scripts/**/*.coffee'
    .pipe coffeelint()
    .pipe coffeelint.reporter()

gulp.task 'coffee', ->
  gulp.src 'app/scripts/**/*.coffee'
    .pipe coffee({bare:true})
    .pipe gulp.dest 'dist/scripts'

gulp.task 'watch', ['coffeelint', 'coffee'], ->
  gulp.src 'app/scripts/**/*.coffee'
    .pipe watch()

gulp.task 'copy', ->
  gulp.src 'app/bower_components/favico.js/favico-0.3.4.min.js'
    .pipe gulp.dest 'dist/scripts/vendor'
  gulp.src 'app/images/*.png'
    .pipe gulp.dest 'dist/images'
  gulp.src 'app/manifest.json'
    .pipe gulp.dest 'dist'

gulp.task 'build', ['coffeelint', 'coffee', 'copy']

gulp.task 'zip', ['build'], ->
  gulp.src 'app/**/*'
    .pipe zip 'app.zip'
    .pipe gulp.dest '.'
