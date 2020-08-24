$(function displayResults(results, status, pagination) {
  let map 
  let geocoder
  // const display = document.getElementById('display')
  if(status == google.maps.places.PlacesServiceStatus.OK) {
  
    //検索結果をplacesList配列に連結
    placesList = placesList.concat(results);
    
    //pagination.hasNextPage==trueの場合、
    //続きの検索結果あり
    if (pagination.hasNextPage) {
      
      //pagination.nextPageで次の検索結果を表示する
      //※連続実行すると取得に失敗するので、
      //1秒くらい間隔をおく
      setTimeout(pagination.nextPage(), 1000);
    
    //pagination.hasNextPage==falseになったら
    //全ての情報が取得できているので、
    //結果を表示する
    } else {
      
      //placesList配列をループして、
      //結果表示のHTMLタグを組み立てる
      var resultHTML = "<ol>";
      
      for (var i = 0; i < placesList.length; i++) {
        place = placesList[i];
        
        //ratingがないのものは「---」に表示変更
        var rating = place.rating;
        if(rating == undefined) rating = "---";
        
        //表示内容（評価＋名称）
        var content = "【" + rating + "】 " + place.name;
        
        resultHTML += "<li>";
        resultHTML += content;
        resultHTML += "</li>";
      }
      
      resultHTML += "</ol>";
      
      //結果表示
      document.getElementById("results").innerHTML = resultHTML;
    }
  
  } else {
    //エラー表示
    var results = document.getElementById("results");
    if(status == google.maps.places.PlacesServiceStatus.ZERO_RESULTS) {
      results.innerHTML = "検索結果が0件です。";
    } else if(status == google.maps.places.PlacesServiceStatus.ERROR) {
      results.innerHTML = "サーバ接続に失敗しました。";
    } else if(status == google.maps.places.PlacesServiceStatus.INVALID_REQUEST) {
      results.innerHTML = "リクエストが無効でした。";
    } else if(status == google.maps.places.PlacesServiceStatus.OVER_QUERY_LIMIT) {
      results.innerHTML = "リクエストの利用制限回数を超えました。";
    } else if(status == google.maps.places.PlacesServiceStatus.REQUEST_DENIED) {
      results.innerHTML = "サービスが使えない状態でした。";
    } else if(status == google.maps.places.PlacesServiceStatus.UNKNOWN_ERROR) {
      results.innerHTML = "原因不明のエラーが発生しました。";
    }

  }
});




  