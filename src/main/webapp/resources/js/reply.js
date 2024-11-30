/**
 * reply module
 */
 
//  console.log("Reply Module.......");
 
//  let replyService = (function(){
//     function add(reply, callback, error){
//       const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');
// 	  const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute('content') || 'X-CSRF-TOKEN';
//       $.ajax({
//          type: 'post',
//          url: '/replies/new',
//          data: JSON.stringify(reply),
//          contentType: "application/json; charset=utf-8",
//          beforeSend: function(xhr) {
//             // CSRF 토큰 추가
//             xhr.setRequestHeader(csrfHeader, csrfToken);
//          },
//          success: function(result, status, xhr){
//             if(callback){
//                callback(result);
//             }
//          },
//          error: function(xhr, status, er) {
//             if(error){
//                error(er);
//             }
//          }
//       })
//    }
//    function getList(param, callback, error){
//     let board_no = param.board_no;
//     let page = param.page || 1;
    
//     $.getJSON("/replies/pages/" + boardNo + "/" + page + ".json",
//     	function(data) {
//     	  if (callback) {
//     	    callback(data);
//     	  }
//     	}).fail(function(xhr, status, err) {
//       if (error) {
//         error();
//       }
//     });
//   }
//   function remove(replyNo, callback, error) {
//     $.ajax({
//       type : 'delete',
//       url  : '/replies/' + replyNo,
//       success : function(deleteResult, status, xhr) {
//         if (callback) {
//           callback(deleteResult);
//          }
//        },
//        error : function(xhr, status, er) {
//          if (error) {
//            error(er);
//          }
//        }
//     });
//   }
//   function update(reply, callback, error) {
//     console.log("replyNo: " + reply.replyNo);
//     $.ajax({
//      type : 'put',
//      url  : '/replies/' + reply.replyNo,
//      data : JSON.stringify(reply),
//      contentType : "application/json; charset=utf-8",
//      success : function(result, status, xhr) {
//        if (callback) {
//           callback(result);
//         }
//       },
//       error : function(xhr, status, er) {
//         if (error) {
//           error(er);
//         }
//       }
//    });
//  }
 
//  function get(replyNo, callback, error) {
//  $.get("/replies/" + replyNo + ".json", function(result) {
//    if (callback) {
//      callback(result);
//    }
//  }).fail(function(xhr, status, err) {
//    if (error) {
//      error();
//      }
//    });
//  }
                                         	    
//    return {
//       add:add,
//       getList:getList,
//       remove:remove,
//       update:update,
//       get:get
//    };
//  })();
// console.log("Reply Module......");

let replyService=(function() {
	function add(reply, callback, error){
		console.log("add reply.....");
		
		$.ajax({
			type:'post',
			url: '/replies/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error:function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error) {
		let boardNo=param.boardNo;
		let page=param.page || 1;
		
		$.getJSON("/replies/pages/" + boardNo +"/"+page+".json",
				function(data){
					if(callback) {
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
			type:'delete',
			url: '/replies/'+replyNo,
			success: function(deleteResult, status, xhr){
				if(callback) {	
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error) {
		console.log("ReplyNo: "+reply.replyNo);
		
		$.ajax({
			type: 'put',
			url: '/replies/'+reply.replyNo,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(replyNo, callback, error) {
		$.get("/replies/"+replyNo+".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue){
	 let today=new Date();
	 let gap=today.getTime() - timeValue;
	 
	 let dateObj=new Date(timeValue);
	 let str="";
	 
	 if(gap<(1000*60*60*24)) {
	 	let hh =dateObj.getHours();
	 	let mi =dateObj.getMinutes();
	 	let ss=dateObj.getSeconds();
	 	
	 	return[(hh>9?'':'0')+hh, ':',(mi >9?'':'0') +mi,
	 		':', (ss>9?'':'0')+ss].join('');
	 } else {
	 	let yy=dateObj.getFullYear();
	 	let mm=dateObj.getMonth()+1; //getMonth() is zero-based
	 	let dd=dateObj.getDate();
	 	
	 	return [yy, '/',(mm>9?'':'0')+mm, '/',
	 		(dd>9?'':'0')+dd].join('');
	 }
	};
		
	
	return {
		add:add,
		getList:getList,
		remove: remove,
		update: update,
		get: get,
		displayTime: displayTime
	};
	
})();
