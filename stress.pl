use Term::Caca;

$_->refresh_delay(1) for map { Term::Caca->new } 1..5;
