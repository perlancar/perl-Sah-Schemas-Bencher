package Sah::Schema::bencher::scenario;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['defhash', {
    summary => 'Bencher scenario structure',
    'merge.add.keys' => {
        defhash_v => ['int', {req=>1, is=>1}],
        v => ['int', {req=>1, is=>1}],

        test => ['bool', {req=>1, default=>1}],
        module_startup => ['bool', {req=>1, default=>0}],
        code_startup => ['bool', {req=>1, default=>0}],
        precision => ['float', {req=>1}],
        module_startup_precision => ['float', {req=>1}],
        # default_precision is deprecated
        result => ['any'],
        with_arg_size => ['bool', {req=>1, default=>0}],
        with_result_size => ['bool', {req=>1, default=>0}],
        with_process_size => ['bool', {req=>1, default=>0}],
        capture_stdout => ['bool', {req=>1, default=>0}],
        capture_stderr => ['bool', {req=>1, default=>0}],
        extra_modules => ['array', {req=>1, of=>['perl::modname', {req=>1}]}],
        env_hashes => ['array', {req=>1, of=>['bencher::env_hash', {req=>1}]}],
        runner => ['str', {req=>1, default=>'Benchmark::Dumb', examples=>[qw/Benchmark::Dumb Benchmark Benchmark::Dumb::SimpleTime/]}],
        on_failure => ['str', {req=>1, in=>['skip','die'], default=>'die'}],
        on_result_failure => ['str', {req=>1, in=>['skip','die','warn']}], # TODO: the default is the value of on_failure

        before_parse_scenario => ['code', {req=>1}],
        before_parse_participants => ['code', {req=>1}],
        before_parse_datasets => ['code', {req=>1}],
        after_parse_scenario => ['code', {req=>1}],
        before_gen_items => ['code', {req=>1}],
        before_bench => ['code', {req=>1}],
        before_test_item => ['code', {req=>1}],
        after_test_item => ['code', {req=>1}],
        after_bench => ['code', {req=>1}],
        before_return => ['code', {req=>1}],

        participants => ['array*', {of=>['bencher::participant', {req=>1}]}],
        datasets => ['array*', {of=>['bencher::dataset', {req=>1}]}],
    },
    'req_keys' => [qw/participants/],
    'keys.restrict' => 1,

    examples => [
        {value=>{summary=>'Compare startup overhead of Foo vs Bar', participants=>[{module=>'Foo'}, {module=>'Bar'}], module_startup=>1}, valid=>1},
    ],
}];

1;
# ABSTRACT:
