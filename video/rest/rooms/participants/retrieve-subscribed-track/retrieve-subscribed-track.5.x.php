<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$subscription = $client->video->rooms('RMXXXX')->participants('PAXXXX')
      ->subscribedTracks('MTXXXX')->fetch();

echo "Read track subscription with sid = " . $subscription->sid;
