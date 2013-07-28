package Mo::required;use Carp();my$M="Mo::";
$VERSION=0.35;
*{$M.'required::e'}=sub{my($P,$e,$o)=@_;$o->{required}=sub{my($m,$n,%a)=@_;if($a{required}){my$C=*{$P."new"}{CODE}||*{$M.Object::new}{CODE};no warnings 'redefine';*{$P."new"}=sub{my$s=$C->(@_);my%a=@_[1..$#_];Carp::croak($n." required")if!exists$a{$n};$s}}$m}};
