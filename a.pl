package Foo;

use Moose;

sub bar { print @_ }

before bar => sub {
   $_[1] = 'yay';
};


print Foo->new->bar('oH?');
