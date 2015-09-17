$(function() {
  $("form").submit(function(){
  //エラーの初期化
      $("p.error").remove();
      $("dl dd").removeClass("error");
      var flag = 0;
      
      $(":text,textarea").filter(".validate").each(function(){
          
          //必須項目のチェック
          $(this).filter(".required").each(function(){
              if($(this).val()==""){
                  $(this).parent().prepend("<p class='error'>必須項目です</p>")
                  $(this).css("border","3px solid red")
                  flag = 1;
                  return false; 
              }
          })  
      })

      if (flag) {
            return false; // return
      }
      
      
　})

});