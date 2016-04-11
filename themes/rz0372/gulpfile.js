const gulp = require('gulp');
const babel = require('gulp-babel');
const sass = require('gulp-sass');

gulp.task('babel', () => {
  return gulp.src('src-static/js/**/*.js')
    .pipe(babel())
    .pipe(gulp.dest('static/js'));
});

gulp.task('scss', () => {
  return gulp.src('src-static/css/**/*.scss')
    .pipe(sass())
    .on('error', (err) => {
      console.log(err.message);
    })
    .pipe(gulp.dest('static/css/'));
});

gulp.task('default', ['babel', 'scss']);
