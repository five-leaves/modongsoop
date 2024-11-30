<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/head.jsp"%>


<style>
body {
	font-family: "Nanum Pen Script", cursive;
	background: linear-gradient(to bottom, #e8f5e9, #c8e6c9);
	color: #4d774e;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #8d6e63;
	color: white;
	border-radius: 10px;
	margin-bottom: 20px;
}

.header .logo {
	display: flex;
	align-items: center;
	gap: 10px;
}

.header .logo img {
	height: 40px;
}

.sidebar {
	background: #f3f9f1;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.main-content {
	padding: 20px;
	background: #f9fbe7;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.btn-join {
	background: #81c784;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 30px;
	transition: all 0.3s ease;
}

.btn-join:hover {
	background: #66bb6a;
	transform: scale(1.05);
}

.comment-box {
	margin-top: 20px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.comment-box input {
	flex-grow: 1;
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #a5d6a7;
}

.comment-list {
	margin-top: 10px;
	padding: 10px 0;
	border-top: 1px solid #81c784;
}

.comment-item {
	padding: 10px 0;
	border-bottom: 1px dashed #81c784;
}

.profile {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.profile img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #c8e6c9;
}

.content-content {
	height: 370px;
}
</style>

<body>
	<div class="container">
		<!-- Header -->
		<div class="header">
			<div class="logo">
				<img src="/path/to/logo.png" alt="Logo">
				<h3>FOREST</h3>
			</div>
			<div>
				<a href="#" class="btn btn-light">로그아웃</a> <span>닉네임</span> <a
					href="#" class="btn btn-light">프로필</a>
			</div>
		</div>

		<!-- 게시글 영역 -->
		<div class="forest-container">
			<div class="content-title">
				<h5 class="form-label fw-bold">게시물 제목</h5>
				<p class="form-control-static">
					<c:out value="${boardDto.boardTitle}" />
				</p>
				<!-- Layout -->
				<div class="row">
					<!-- Sidebar -->
					<div class="col-md-3 sidebar">
						<div class="profile">
							<img src="/path/to/profile.jpg" alt="Profile">
							<p>
								동호회명
								<c:out value="${boardDto.clubNo}" />
							</p>
						</div>
						<button class="btn btn-join w-100">동호회 가입</button>
						<p>멤버 수: 10명</p>
						<p>리더: 홍길동</p>
					</div>

					<!-- Main Content -->
					<div class="col-md-9">
						<div class="main-content">
							<h5>
								<c:out value="${boardDto.boardTitle}" />
							</h5>
							<div>
								작성자 닉네임:
								<c:out value="${boardDto.nickname}" /><br>
								로그인한 사람 : <c:out value="${userDto.userNo}" />
							</div>
							<div class="mb-3 cute-border content-content">
								<p class="form-control-static">
									<c:out value="${boardDto.boardContent}" />
								</p>
								<button data-oper='modify' class="btn btn-default"
									onclick="location.href='/board/modify?boardNo=<c:out value="${boardDto.boardNo}"/>'">수정</button>
								<button data-oper='list' class="btn btn-info"
									onclick="location.href='/board/list?clubNo=${boardDto.clubNo}'">목록</button>

								<form id='operForm' action="/board/modify" method="get">
									<input type='hidden' id='boardNo' name='boardNo'
										value='<c:out value="${boardDto.boardNo}"/>'>
										
								</form>

								<!-- 댓글 -->
								<div class="comment-box">
									<!--input type="text" id="replyInput" placeholder="댓글을 작성하세요"-->
									<button class="btn btn-forest" id="replySubmit">댓글달기</button>
								</div>


								<div class="comment-list" id="commentList">
									<!-- 댓글 아이템 -->
										<c:forEach var="item" items="${replyDto}">
										    [<c:out value="${item.nickname}" />] <c:out value="${item.replyContent}" /> (<c:out value="${item.wrDate}" />)
										    
										    
										    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										    <button data-oper='replyDel' class="btn btn-default" onclick="location.href='/board/replyDel?replyNo=<c:out value="${item.replyNo}"/>&boardNo=<c:out value="${item.boardNo}"/>'">삭제</button>
										    
										    
										    <br>
										</c:forEach>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="csrfToken" name="_csrf" value="${_csrf.token}" />
	
	<form id='operForm' action="/board/modify" method="get">
		<input type='hidden' id='boardNo' name='boardNo'
			value='<c:out value="${board.boardNo}"/>'> <input
			type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount'
			value='<c:out value="${cri.amount}"/>'>
	</form>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> <input class="form-control" name='reply'
							value='New Reply!!!!'>
					</div>
					<!-- div class="form-group">
						<label>userNo</label> <input class="form-control" name='user'
							value='<c:out value="${boardDto.userNo}"/>' readOnly>
					</div-->
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name='replyDate' value='2018-01-01 13:13'>
					</div>

				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<script src="/resources/js/reply.js"></script>
	<script>
	$(document).ready(function() {
		let boardNo = '<c:out value="${boardDto.boardNo}"/>';
		let commentList = $("#commentList");

		let operForm=$("#opperForm");
		$("button[data-oper='modify']").on("click",function(e) {
			operForm.attr("action","/board/modify").submit();
		});
		
		let csrfToken = $('#csrfToken').val();
	})
	
	function showList(page){
		console.log("여기여기 " + page);
	  console.log("show list " + page);
    
    replyService.getList({boardNo:boardNoValue,page: page|| 1 }, function(replyCnt, list) {
      
    console.log("replyCnt: "+ replyCnt );
    console.log("list: " + list);
    console.log(list);
    
    if(page == -1){
      pageNum = Math.ceil(replyCnt/10.0);
      showList(pageNum);
      return;
    }
      
     let str="";
     
     if(list == null || list.length == 0){
       return;
     }
     
     for (let i = 0, len = list.length || 0; i < len; i++) {
       str +="<li class='left clearfix' data-replyNo='"+list[i].replyNo+"'>";
       str +="  <div><div class='header'><strong class='primary-font'>["
    	   +list[i].replyNo+"] "+list[i].user+"</strong>"; 
       str +="    <small class='pull-right text-muted'>"
           +replyService.displayTime(list[i].replyDate)+"</small></div>";
       str +="    <p>"+list[i].replyContent+"</p></div></li>";
     }
     
     replyUL.html(str);
     
     showReplyPage(replyCnt);

 
   });
     
 }
	
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      let endNum = Math.ceil(pageNum / 10.0) * 10;  
      let startNum = endNum - 9; 
      
      let prev = startNum != 1;
      let next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      let str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(let i = startNum ; i <= endNum; i++){
        
        let active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       let targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });
	
	console.log("==========");
	console.log("JS TEST");
	
	/*
	let boardNoValue = '<c:out value="${boardDto.boardNo}"/>';
	replyService.add(
			{replyContent:"JS Test", userNo:"tester", boardNo:boardNoValue},
			function(result){
				alert("RESULT: " + result);
			});
	
	replyService.getList({boardNo:boardNoValue, page:1}, function(list){
		for(let i = 0, len = list.length||0; i < len; i++) {
			console.log(list[i]);
		}
	});
	
	replyService.remove(23, function(count){
		console.log(count);
		if (count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert('ERROR...');
	});
	
	replyService.update({
		replyNo : 22,
		boardNo : boardNoValue,
		reply : "Modified Reply..."
	}, function(result){
		alert("수정완료...");
	});
	
	replyService.get(10, function(data){
		console.log(data);
	});
	
	$(document).ready(function (){
		let boardNoValue = '<c:out value="${boardDto.boardNo}"/>';
		let replyUL = $(".chat");
		showList(1);
		function showList(page){
			replyService.getList({boardNo:boardNoValue,page: page||1}, function(list){
				let str="";
			    if(list == null || list.length == 0){
			    	replyUL.html("");
			    	return;
			    }
			    for (let i = 0, len = list.length || 0; i < len; i++){
			    	str +="<li class='left clearfix' data-replyNo='"+list[i].replyNo+"'>";
			    	str +="  <div><div class='header'><strong class='primary-font'>"+list[i].userNo+"</strong>";
			    	str +="  <small class='pull-right text-muted'>"+list[i].replyDate+"</small></div>";
			    	str +="  <p>"+list[i].reply+"</p></div></li>";
			    }
			    replyUL.html(str);
			});
		}
	});*/
	
	let modal = $(".modal");
	let modalInputReply = modal.find("input[name='reply']");
	let modalInputuser = modal.find("input[name='user']");
	
	
	let modalInputReplyDate = modal.find("input[name='replyDate']");
    
	let modalModBtn = $("#modalModBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    $("#replySubmit").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    
    modalRegisterBtn.on("click",function(e){
        //console.log("여기 " + modalInputuser.val());
        let boardNoValue = '<c:out value="${boardDto.boardNo}"/>';
        let userNoValue = '<c:out value="${boardDto.userNo}"/>';
        let reply = {
        	  replyContent: modalInputReply.val(),
              userNo:userNoValue,
              boardNo:boardNoValue
            };
        replyService.add(reply, function(result){
          
          alert("어라?"+result);
          
          modal.find("input").val("");
          modal.modal("hide");
          //console.log("여기2");
          
        });
        
      });
    
    //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      let replyNo = $(this).data("replyNo");
      
      replyService.get(replyNo, function(replyContent){
      
        modalInputReply.val(replyContent.replyContent);
        modalInputuser.val(replyContent.user);
        modalInputReplyDate.val(replyService.displayTime( replyContent.replyDate))
        .attr("readonly","readonly");
        modal.data("replyNo", replyContent.replyNo);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
    
    modalModBtn.on("click", function(e){
  	  
     	  let replyContent = {replyNo:modal.data("replyNo"), replyContent: modalInputReply.val()};
     	  
     	  replyService.update(replyContent, function(result){
     	        
     	    alert(result);
     	    modal.modal("hide");
     	    showList(pageNum);
     	    
     	  });
     	  
     	});
    
    modalRemoveBtn.on("click", function (e){
     	  
     	  let replyNo = modal.data("replyNo");
     	  
     	  replyService.remove(replyNo, function(result){
     	        
     	      alert(result);
     	      modal.modal("hide");
     	      showList(1);
     	      
     	  });
     	  
     	});
	</script>
	<%@include file="../includes/foot.jsp"%>