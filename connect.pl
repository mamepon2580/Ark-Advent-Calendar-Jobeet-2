use strict;
use warnings;
use lib 'lib';

use Jobeet::Schema;

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');

my $category_rs = $schema->resultset('Category');
print $category_rs->count;

my $category = $category_rs->create({
    name => 'new category',
});
print $category_rs->count
