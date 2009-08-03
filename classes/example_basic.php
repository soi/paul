<?php
require('class.roundrobin.php');

// Provide opponents in an array format
$teams = array ('John Barnett', 
                'Phillip Carmichael', 
                'Daniel Carroll', 
                'Robert Craig', 
                'Thomas Griffin', 
                'John Hickey');

$roundrobin = new roundrobin($teams);

// Generating matches with matchdays
$roundrobin->create_matches();
// The result is a 3-dimension array: matchday->match->opponents
if ($roundrobin->finished) {
    print_r($roundrobin->matches);    
}

echo "<br /><br />";


// Generating matches without matchdays
$roundrobin->create_raw_matches();
// The result is a 2-dimension array: match->opponents
if ($roundrobin->finished) {
    print_r($roundrobin->matches);
}

// See 'example_full.php' for the other features
?>