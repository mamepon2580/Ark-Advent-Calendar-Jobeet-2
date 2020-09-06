package Jobeet::Controller::Job;
use Ark 'Controller';

use Jobeet::Models;
use DateTime::Format::W3CDTF;

__PACKAGE__->meta->make_immutable;

has '+namespace' => default => 'job';

sub auto :Private {
    1;
}

sub index :Path :Args(0) {
    my ($self, $c) = @_;
}

sub atom :Local {
    my ($self, $c) = @_;
    $c->res->content_type('application/atom+xml; charset=utf-8');

    $c->stash->{w3c_date} = DateTime::Format::W3CDTF->new;
    $c->stash->{latest_post} = models('Schema::Job')->latest_post;

    $c->forward('index');
}
