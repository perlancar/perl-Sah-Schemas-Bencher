package Sah::Schema::bencher::dataset;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['defhash', {
    summary => 'A benchmark dataset',
    'merge.add.keys' => {
        defhash_v => ['int', {req=>1, is=>1}],
        v => ['int', {req=>1, is=>1}],

        args => ['hash', {req=>1}],
        argv => ['aos', {req=>1}],

        include_by_default => ['bool', {req=>1, default=>1}],
        include_participant_tags => ['aos', {req=>1}],
        exclude_participant_tags => ['aos', {req=>1}],
    },
    'keys.restrict' => 1,

    choose_one => ['args', 'argv'],

}];

1;
# ABSTRACT:
