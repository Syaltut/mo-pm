package Mo::is;$M="Mo::";use Carp();
$VERSION=0.35;
*{$M.'is::e'}=sub{my($P,$e,$o)=@_;$o->{is}=sub{my($m,$n,%a)=@_;$a{is}or return$m;sub{$#_&&$a{is}eq'ro'&&caller ne'Mo::coerce'?Carp::croak($n.' is ro'):$m->(@_)}}};
