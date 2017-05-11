// Include gulp
var gulp = require('gulp');

// Plugins
const shell = require('gulp-shell');


// Settings
process.chdir('../../../');

gulp.task('Console - Clear Cache', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_clear_cache.sh'
]));

gulp.task('Console - Dump Local Database', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_dump_local.sh'
]));

gulp.task('Console - Update database schema', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_updateschema.sh'
]));


gulp.task('Develop - Sync < Database', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_develop_database.sh'
]));

gulp.task('Develop - Sync < Fileadmin/Uploads', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_develop_files.sh'
]));

gulp.task('Develop - Sync < All (Database and Files)', ['Develop - Sync < Fileadmin/Uploads', 'Develop - Sync < Database']);


gulp.task('Master - Sync < Database', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_master_database.sh'
]));

gulp.task('Master - Sync < Fileadmin/Uploads', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_master_files.sh'
]));

gulp.task('Master - Sync < All (Database and Files)', ['Master - Sync < Fileadmin/Uploads', 'Master - Sync < Database']);