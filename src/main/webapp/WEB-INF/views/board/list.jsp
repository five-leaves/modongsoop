<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/head.jsp" %>

<body>
<div class="forest-container">
	<%@ include file="../includes/header.jsp" %>
	<!-- Layout -->
	<div class="row">
		<%@ include file="../includes/sidebar.jsp" %>
		<div class="col-md-9 p-0">
		<!-- Main Content -->
			<div class="main-content">
				<div>
					<input type="text" class="form-control mb-3" placeholder="글 내용 검색">
					<div class="mb-3">
						<div class="form-control p-3" >
							<div class="h3 mb-3">동호회 소개 및 정보</div>
							<div class="mb-2">나이제한: 
								<c:if test="${clubDto.ageMin != 0}"><span id="ageMin"><c:out value="${clubDto.ageMin}"/></span></c:if>
								~ <c:if test="${clubDto.ageMax != 0}"><span id="ageMax"><c:out value="${clubDto.ageMax}"/></span></c:if>
							</div>
							<div><c:out value="${clubDto.clubContent}"/></div>
						</div>
						
					</div>
				</div>
	
				<!-- Post Cards -->
				<div class="row">
					<c:forEach items="${list}" var="boardDto">
						<a class='move board-link' href='<c:out value="${boardDto.boardNo}"/>'>
							<div class="post-card">
								<input type="hidden" value='<c:out value="${boardDto.boardNo}" />'/>
								<input type="hidden" value='<c:out value="${boardDto.clubNo}" />'/>
								<h3><c:out value="${boardDto.boardTitle}" /></h5>
								<p class="text-ellipsis"><c:out value="${boardDto.boardContent}" /></p>
								<div class="text-right">작성자 <c:out value="${boardDto.nickname}" /></div>
								<div class="post-footer">
									<!-- 왼쪽: 좋아요 -->
									<span> <i class="fa fa-heart"></i> 좋아요
									</span>
									<!-- 오른쪽: 생성일 -->
									<span>생성일 <fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.regdate}" /></span>
								</div>
							</div>
						</a>
					</c:forEach>
					
					<div class='pull-right'>
						<ul class="pagnation">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":""}"><a href="${num}">${num}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- end Pagination -->
	
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        처리가 완료되었습니다.
      </div>
      <div class="modal-footer">
<!--          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>-->
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<form id='actionForm' action="/board/list" method='get'>
	<input type="hidden" name="clubNo" value="${param.clubNo}" />
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
</form>

<script type="text/javascript">
	$(document).ready(function() {
		let actionForm=$("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='boardNo' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
			
	});
	</script>
<%@ include file="../includes/sidebar_script.jsp" %>
<%@ include file="../includes/foot.jsp" %>
