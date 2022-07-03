<?php //echo "here"; exit();
/*      function fetch_data($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 20);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    $count = 10; // the number of photos you want to fetch
    $access_token = "IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD";
    $display_size = "thumbnail"; // you can choose between "low_resolution", "thumbnail" and "standard_resolution"
    $result = fetch_data("https://api.instagram.com/v1/users/self/feed?count=10&access_token=IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD");
    $result = fetch_data($url);
    $result = json_decode($result);
	
	echo "<pre/>"; print_r($result);  */
    



/*    function fetchData($url){
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($ch, CURLOPT_TIMEOUT, 20);
  $result = curl_exec($ch);
  curl_close($ch); 
  return $result;
  }

  $result = fetchData("https://api.instagram.com/v1/users/vishruthi_jewel_emporium/media/recent/?access_token=IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD");
  $result = json_decode($result);
  foreach ($result->data as $post) {
	  echo "here";
    // Do something with this data.
  }  */
  function rudr_instagram_api_curl_connect( $api_url ){
	$connection_c = curl_init(); // initializing
	curl_setopt( $connection_c, CURLOPT_URL, $api_url ); // API URL to connect
	curl_setopt( $connection_c, CURLOPT_RETURNTRANSFER, 1 ); // return the result, do not print
	curl_setopt( $connection_c, CURLOPT_TIMEOUT, 20 );
	$json_return = curl_exec( $connection_c ); // connect and get json data
	curl_close( $connection_c ); // close connection
	return json_decode( $json_return ); // decode and return
}
$access_token = 'IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD';
$username = 'vishruthi_jewel_emporium';
$user_search = rudr_instagram_api_curl_connect("https://api.instagram.com/v1/users/search?q=" . $username . "&access_token=" . $access_token);
// $user_search is an array of objects of all found users
// we need only the object of the most relevant user - $user_search->data[0]
// $user_search->data[0]->id - User ID
// $user_search->data[0]->first_name - User First name
// $user_search->data[0]->last_name - User Last name
// $user_search->data[0]->profile_picture - User Profile Picture URL
// $user_search->data[0]->username - Username
 
/* $user_id = $user_search->data[0]->id; // or use string 'self' to get your own media
$return = rudr_instagram_api_curl_connect("https://api.instagram.com/v1/users/" . $user_id . "/media/recent?access_token=" . $access_token);
 
//var_dump( $return ); // if you want to display everything the function returns
 
foreach ($return->data as $post) {
	echo '<a href="' . $post->images->standard_resolution->url . '"><img src="' . $post->images->thumbnail->url . '" /></a>';
}  


$user_search = rudr_instagram_api_curl_connect("https://api.instagram.com/v1/users/search?q=" . $username . "&access_token=" . $access_token);

echo '<img src="' . $user_search->data[0]->profile_picture . '" />'; */



function dd_instagram( $AccessToken , $feed = null ){
    $timestamp = mktime(date('H'), date('i'), 0, date('n'), date('j') - 1, date('Y'));
    $AccessToken = 'IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD';
    $instagram_user_id = '4992666810766440';
    $url = 'https://graph.instagram.com/'.$instagram_user_id.'/media?access_token=' . $AccessToken;
    $counter = 0;
 
    $ch = curl_init();
 
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Instagram Gallery');
 
    $result = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
 
    $result = json_decode($result);
    echo "<pre/>"; print_r($result); 
    foreach ($result->data as $media_id){
        $id = $media_id->id;;
        echo $id; 
        $counter++;
        if( $counter <= $feed ){
         
            if( $id ) {
                $url = 'https://graph.instagram.com/'.$id.'?fields=id,media_type,media_url,username,timestamp,permalink&access_token=' . $AccessToken;
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_HEADER, false);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
                curl_setopt($ch, CURLOPT_USERAGENT, 'Instagram Gallery');
 
                $result_image = curl_exec($ch);
                //$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                curl_close($ch);
                $result_image = json_decode($result_image);
				//echo "here"; print_r($result_image); exit();
                echo '<span class="instagram-image"><a href="' .$result_image->permalink. '" target="_blank"><img src="' .$result_image->media_url. '"/></a></span>';
            }
        }
    }
}

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
curl_setopt($ch, CURLOPT_USERAGENT, 'Instagram Gallery');

$result_image = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);
$result_image = json_decode($result_image);


?>
<div id="instagram-feed"><?php dd_instagram('instagram',4); ?></div>
