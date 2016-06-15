<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Search</title>
    
  </head>
  <script src="jquery-1.12.4.js" type="text/javascript"></script>
  <script>
      var q='cat';
      var url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=3&key=AIzaSyCwiaBKKfW6T-4dousuknjKMglL9ES-sxA&q='+q;

    //Can show object in div as text
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'html'
      }).done(function ( data ) {
          $('#content').append(data);
      });
      
      //can put json in to a var result
      var result = $.ajax({
                        url: url,
                        type: 'GET',
                        dataType: 'html',
                        global: false,
                        async:false,
                        success: function ( data ) {
                         return data;
                        }
                      }).responseText;
    console.log(result);
  </script>
  <body>
      <div id="content"></div>
  </body>
</html>