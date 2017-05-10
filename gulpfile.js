// Include gulp
var gulp = require('gulp');

// Plugins
const shell = require('gulp-shell');
var exec = require('gulp-exec');
var run = require('gulp-run');
var clean = require('gulp-clean');

// Settings
process.chdir('../../');

gulp.task('Console - Clear Cache', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_clear_cache.sh'
]));

gulp.task('Console - Dump Local Database', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_dump_local.sh'
]));

gulp.task('Console - Update database schema', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_updateschema.sh'
]));

gulp.task('Sync - Develop Database', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_develop_database.sh'
]));

gulp.task('Sync - Develop Fileadmin/Uploads', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_develop_files.sh'
]));
