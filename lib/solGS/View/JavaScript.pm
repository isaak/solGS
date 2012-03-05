package solGS::View::JavaScript;
use strict;
use warnings;

use parent 'Catalyst::View::JavaScript::Minifier::XS';

__PACKAGE__->config(
    js_dir => solGS->path_to('js'),
);

1;
