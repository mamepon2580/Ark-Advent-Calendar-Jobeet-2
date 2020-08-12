package Jobeet::Schema::Types;
use v5.20.3;
use parent 'Exporter';
our @EXPORT = qw/PK_INTEGER INTEGER VARCHAR TINYINT DATETIME/;

sub PK_INTEGER {
    +{
        data_type         => 'INTEGER',
        is_nullable       => 0,
        is_auto_increment => 1,
        extra => {
            unsigned => 1,
        },
        @_,
    };
}

sub INTEGER {
    +{
        data_type         => 'INTEGER',
        is_nullable       => 0,
        extra => {
            unsigned => 1,
        },
        @_,
    };
}

sub TINYINT {
    +{
        data_type         => 'TINYINT',
        is_nullable       => 0,
        default_value     => 0,
        extra => {
            unsigned => 1,
        },
        @_,
    };
}

sub VARCHAR {
    +{
        data_type   => 'VARCHAR',
        size        => 255,
        is_nullable => 0,
        @_,
    };
}

sub DATETIME {
    +{
        data_type   => 'DATETIME',
        is_nullable => 0,
        timezone    => Jobeet::Schema->TZ,
        @_,
    };
}
1;
このように定義しuse Jobeet::Schema::Types して使う事で､こんな風にすっきり書くことができます。

package Jobeet::Schema::Result::Affiliate;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_affiliate');

__PACKAGE__->add_columns(
    id          => PK_INTEGER,
    url         => VARCHAR,
    email       => VARCHAR,
    token       => VARCHAR(
        size => 80,
    ),
    is_active   => TINYINT,
    created_at  => DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['email']);

1;
