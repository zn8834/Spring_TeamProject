<?php
    // 요청한 URL을 받아옵니다.
    $url = $_GET['url'];
    
    // URL이 비어있는지 확인합니다.
    if (empty($url)) {
        die('URL이 지정되지 않았습니다.');
    }
    
    // cURL을 사용하여 외부 URL로 요청을 보냅니다.
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);
    
    // 가져온 데이터를 클라이언트로 반환합니다.
    echo $response;

?>
