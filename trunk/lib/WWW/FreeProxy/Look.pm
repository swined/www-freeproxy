package WWW::FreeProxy::Look;

use LWP::Simple;

sub fetch {
	my ($self, $callback) = @_;
	my @lines = split /\n/, get('http://www.loo-k.info/plist.txt');
	shift @lines for 1..2;
	&$callback($_) for @lines;
}

1;

=head1 COPYRIGHT & LICENSE

Copyright 2008 Alexey Alexandrov, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
