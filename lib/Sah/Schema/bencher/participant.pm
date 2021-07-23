package Sah::Schema::bencher::participant;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['defhash', {
    summary => 'A benchmark participant',
    'merge.add.keys' => {
        defhash_v => ['int', {req=>1, is=>1}],
        v => ['int', {req=>1, is=>1}],

        module => ['perl::modname', {req=>1}],
        modules => ['perl::modnames', {req=>1}],
        helper_modules => ['perl::modnames', {req=>1}],

        function => ['str', {req=>1}], # XXX: funcname
        fcall_template => ['str', {req=>1}], # XXX: funcname
        code_template => ['str', {req=>1}], # XXX: funcname
        code => ['str', {req=>1}], # XXX: funcname
        cmdline => ['str_or_aos1', {req=>1}],
        cmdline_template => ['str_or_aos1', {req=>1}],
        perl_cmdline => ['str_or_aos1', {req=>1}],
        perl_cmdline_template => ['str_or_aos1', {req=>1}],

        result_is_list => ['bool', {req=>1, default=>0}],
        include_by_default => ['bool', {req=>1, default=>1}],
    },
    'keys.restrict' => 1,

    # TODO: function depends on module

    # TODO: either module+function or fcall_template or code_template or code or
    # or cmdline or cmdline_template or perl_cmdline or perl_cmdline_template

}];

1;
# ABSTRACT:
