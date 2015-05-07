#!/usr/bin/perl
#
#

use strict;
use warnings;
use WWW::SwaggerClient::PetApi;
use WWW::SwaggerClient::APIClient;
use WWW::SwaggerClient::Object::Pet;
use WWW::SwaggerClient::Object::Tag;
use WWW::SwaggerClient::Object::Category;
use JSON;
use Data::Dumper;
use DateTime;

my $api = WWW::SwaggerClient::PetApi->new();

#print WWW::SwaggerClient::APIClient::to_form_value('testing 123');

my $pet_id = 5;
my $dt = DateTime->new(
  year      => 1972,
  month     => 12,
  day       => 31,
  hour      => 23,
  minute    => 59,
  second    => 30,
  time_zone => 'UTC'
);

print "dt = $dt\n";
print "dt = ".$dt->datetime()."\n";


my $tag =  WWW::SwaggerClient::Object::Tag->new({'id' => 'tag1', 'name' => 'just kidding', 
    "photoUrls" => ['123', 'oop']});
my $pet =  WWW::SwaggerClient::Object::Pet->new({'id' => 5, 'name' => 'haha', 
    "photoUrls" => ['123', 'oop'], 'tags' => [$tag], 'created' => $dt});

##print Dumper $pet;
print "pet ref=".ref($pet)."\n";
print "tag ref=".ref($tag)."\n";
my $json = JSON->new->convert_blessed;

#print $json->convert_blessed->encode($pet);
#print $json->get_convert_blessed;
print Dumper($pet->to_hash);
#my $pet2 = WWW::SwaggerClient::Model::Pet->from_json($pet->to_hash);
my $pet2 = WWW::SwaggerClient::Object::Pet->new();
$pet2 = $pet2->from_hash($pet->to_hash);
#$pet2->from_json($pet->to_hash);
print Dumper($pet2->to_hash);
#exit;
print "============================\n";
print Dumper  $api->get_pet_by_id({pet_id => $pet_id});
print Dumper  $api->update_pet_with_form({pet_id => $pet_id, name => 'test_name', status => 'test status'});
