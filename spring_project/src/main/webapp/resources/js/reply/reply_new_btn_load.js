console.log("Reply New Button -> Modal window Load.......");

$(function(){
   

   var div1 = $(".div_reply");

   var inputReply = div1.find("textarea[name='reply']");
   var inputReplyer = div1.find("input[name='replyer']");
   var inputNickName = div1.find("input[name='replyer_nickname']");
   
   var bnoValue = $("#operForm").find("#bno").val();
   var replyUL = $(".chat");
   var pageUI = $(".panel-footer");
   
   $("#addReplyBtn").on("click",function(e){
      
      var reply = {
                  reply:inputReply.val(),
                  replyer:inputReplyer.val(),
                  nickname:inputNickName.val(),
                  bno:bnoValue
               };
               
      replyService.add(reply, function(result){
         
         alert(result);
         
         replyList.showList(1, bnoValue, replyUL, pageUI);
         
      });
   });
   
});