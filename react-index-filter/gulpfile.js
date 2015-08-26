'use strict';

var gulp = require('gulp'),
      react = require('gulp-react'),
      concat = require('gulp-concat'),
      sass = require('gulp-sass'),
      plumber = require('gulp-plumber');

gulp.task('compile:scss', function() {
  gulp.src('./css/*.scss')
         .pipe(plumber())
         .pipe(sass())
         .pipe(concat('bundle.css'))
         .pipe(gulp.dest('./css'))
});

gulp.task('default', function () {
    return gulp.src('./index-filter.jsx')
        .pipe(react({
            harmony: true
        }))
        .pipe(concat('index.js'))
        .pipe(gulp.dest('./lib'));
});
