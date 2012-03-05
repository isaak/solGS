package solGS;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple       
     +SGN::Role::Site::Config
     +SGN::Role::Site::DBConnector
     +SGN::Role::Site::DBIC
     +SGN::Role::Site::Exceptions
     +SGN::Role::Site::Files
     +SGN::Role::Site::Mason    
/;

extends 'Catalyst';

our $VERSION = '0.01';
$VERSION = eval $VERSION;

# Configure the application.
#
# Note that settings in solgs.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    'Plugin::ConfigLoader' => {
        substitutions => {
            UID       => sub { $> },
            USERNAME  => sub { (getpwuid($>))[0] },
            GID       => sub { $) },
            GROUPNAME => sub { (getgrgid($)))[0] },
           },
       }

);


__PACKAGE__->setup;


=head1 NAME

solGS - Catalyst based application

=head1 SYNOPSIS

    script/solgs_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<solGS::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Isaak Tecle,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
