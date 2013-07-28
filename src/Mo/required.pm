package Mo::required;
use Carp ();
my $MoPKG = "Mo::";
$VERSION = 0.35;

*{$MoPKG.'required::e'} = sub {
    my ($caller_pkg, $exports, $options) = @_;
    $options->{required} = sub {
        my ($method, $name, %args) = @_;

        if ($args{required}) {
            my $old_constructor = *{$caller_pkg."new"}{CODE} || *{$MoPKG.Object::new}{CODE};
            no warnings 'redefine';
            *{$caller_pkg."new"} = sub {
                my $self = $old_constructor->(@_);
                my %args = @_[1..$#_];
                Carp::croak($name." required") if !exists $args{$name};
                $self;
            };
        }

        $method;
    };
};
