// Include gulp
var gulp = require('gulp');

// Plugins
const shell = require('gulp-shell');

//load json
const secretJson = require('../../../t3settings/secret.json');
const localJson = require('../../../t3settings/local.json');

// Settings
process.chdir('../../../');

gulp.task('Check', shell.task([
    'sh vendor/bo/t3toolbox/bin/check.sh'
]));

gulp.task('Console:ClearCache', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_clear_cache.sh'
]));

gulp.task('Console:DumpLocal', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_dump_local.sh'
]));

gulp.task('Console:UpdateSchema', shell.task([
    'sh vendor/bo/t3toolbox/bin/console_updateschema.sh'
]));

if (secretJson.develop.php) {
    gulp.task('Develop:Sync:Database', shell.task([
        'php typo3cms database:export > t3settings/.tmp/' + localJson.database.name + '_backup.sql',
        'ssh ' + secretJson.develop.host.user + '@' + secretJson.develop.host.url + ' ' + secretJson.develop.php + ' ' + secretJson.develop.host.path + '/current/typo3cms database:export | php typo3cms database:import'
    ]));
} else {
    gulp.task('Develop:Sync:Database', shell.task([
        'sh vendor/bo/t3toolbox/bin/sync_develop_database.sh'
    ]));
}

gulp.task('Develop:Sync:Files', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_develop_files.sh'
]));

gulp.task('Develop:Sync:Files&Database', ['Develop:Sync:Files', 'Develop:Sync:Database']);

if (secretJson.master.php) {
    gulp.task('Master:Sync:Database', shell.task([
        'php typo3cms database:export > t3settings/.tmp/' + localJson.database.name + '_backup.sql',
        'ssh ' + secretJson.master.host.user + '@' + secretJson.master.host.url + ' ' + secretJson.master.php + ' ' + secretJson.master.host.path + '/current/typo3cms database:export | php typo3cms database:import'
    ]));
} else {
    gulp.task('Master:Sync:Database', shell.task([
        'sh vendor/bo/t3toolbox/bin/sync_master_database.sh'
    ]));
}

gulp.task('Master:Sync:Files', shell.task([
    'sh vendor/bo/t3toolbox/bin/sync_master_files.sh'
]));

gulp.task('Master:Sync:Files&Database', ['Master:Sync:Files', 'Master:Sync:Database']);

gulp.task('Local:SetLocalDomain', shell.task([
    'mysql -u' + localJson.database.user + ' -p' + localJson.database.password + ' -h' + localJson.database.host + ' -e "UPDATE ' + localJson.database.name + '.sys_domain SET hidden = 1"',
    'mysql -u' + localJson.database.user + ' -p' + localJson.database.password + ' -h' + localJson.database.host + ' -e "INSERT INTO ' + localJson.database.name + '.sys_domain (pid, hidden, domainName) VALUES (\'1\',\'0\',\'' + localJson.general.localdomain + '\')"'
]));

gulp.task('default', ['Check']);

