use strict;
use Test::More;
use Test::Double;
use JSON qw/encode_json decode_json/;

use WebService::Mackerel;

subtest 'post_service_metrics' => sub { 
    my $fake_res = encode_json({ "success" => "true" });
    my $mackerel = WebService::Mackerel->new( api_key  => 'testapikey', service_name => 'test' );
    mock($mackerel)->expects('post_service_metrics')->times(1)->returns($fake_res);

    my $res = $mackerel->post_service_metrics([ {"name" => "custom.name_metrics", "time" => "1415609260", "value" => 200} ]);

    is_deeply $res, $fake_res, 'response success';

    Test::Double->verify;
    Test::Double->reset;
};

done_testing;
