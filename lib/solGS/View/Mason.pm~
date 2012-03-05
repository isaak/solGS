package solGS::View::solGS;

use Moose;
extends 'Catalyst::View::HTML::Mason';


__PACKAGE__->config(
    globals => ['$c'],
    template_extension => '.mas',
);



sub interp_args {
    my $self = shift;
    return {
        comp_root => [
            [ main => solGS->path_to('templates') ],
           ],
    };
}

sub component_exists {
    my ( $self, $component ) = @_;
    return $self->interp->comp_exists( $component ) ? 1 : 0;
}


=head1 NAME

solGS::View::solGS - Mason View Component for solGS

=head1 AUTHOR

Isaak Y Tecle - iyt2@cornell.edu

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=cut


__PACKAGE__->meta->make_immutable;
1;
