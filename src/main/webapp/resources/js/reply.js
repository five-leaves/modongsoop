/**
 * reply module
 */
 
 console.log("Reply Module.......");
 
 let replyService = (function(){
    function add(reply, callback, error){
      console.log("add reply................");
      
      $.ajax({
         type: 'post',
         url: '/replies/new',
         data: JSON.stringify(reply),
         contentType: "application/json; charset=utf-8",
         beforeSend: function(xhr) {
            // CSRF 토큰 추가
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
         },
         success: function(result, status, xhr){
            if(callback){
               callback(result);
            }
         },
         error: function(xhr, status, er) {
            if(error){
               error(er);
            }
         }
      })
   }
   function getList(param, callback, error){
    let board_no = param.board_no;
    let page = param.page || 1;
    
    $.getJSON("/replies/pages/" + boardNo + "/" + page + ".json",
    	function(data) {
    	  if (callback) {
    	    callback(data);
    	  }
    	}).fail(function(xhr, status, err) {
      if (error) {
        error();
      }
    });
  }
  function remove(replyNo, callback, error) {
    $.ajax({
      type : 'delete',
      url  : '/replies/' + replyNo,
      success : function(deleteResult, status, xhr) {
        if (callback) {
          callback(deleteResult);
         }
       },
       error : function(xhr, status, er) {
         if (error) {
           error(er);
         }
       }
    });
  }
  function update(reply, callback, error) {
    console.log("replyNo: " + reply.replyNo);
    $.ajax({
     type : 'put',
     url  : '/replies/' + reply.replyNo,
     data : JSON.stringify(reply),
     contentType : "application/json; charset=utf-8",
     success : function(result, status, xhr) {
       if (callback) {
          callback(result);
        }
      },
      error : function(xhr, status, er) {
        if (error) {
          error(er);
        }
      }
   });
 }
 
 function get(replyNo, callback, error) {
 $.get("/replies/" + replyNo + ".json", function(result) {
   if (callback) {
     callback(result);
   }
 }).fail(function(xhr, status, err) {
   if (error) {
     error();
     }
   });
 }
                                         	    
   return {
      add:add,
      getList:getList,
      remove:remove,
      update:update,
      get:get
   };
 })();