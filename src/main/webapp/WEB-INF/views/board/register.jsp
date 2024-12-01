<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/head.jsp"%>

<body>
<div class="forest-container">
	<%@include file="../includes/header.jsp"%>
	<div class="row">
	    <h1 class="mb-4">게시글 등록</h1>
		<div class="row p-0">
		  <div class="col-lg-12">
		    <div class="panel panel-default">
		      <div class="panel-body">
		        <form role="form" action="/board/register" method="post">
		    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        
		            <div class="form-group mb-4">
		              <label class="h3">제목</label> <input class="form-control" name='boardTitle' />
		            </div>
		          
		            <div class="form-group mb-4">
		              <label class="h3">내용</label>
		              <textarea class="form-control" rows="5" name='boardContent'></textarea>
		            </div>
		            
				    <input type="hidden" class="form-control" name='userNo' value=<c:out value="${userNo}" /> readonly />
		            
		            <input type="hidden" class="form-control" name='clubNo' value="${param.clubNo}" />
		          
			        <input type="hidden" id="csrfToken" name="_csrf" value="${_csrf.token}" />
			        
			        <button id="regBtn" type="submit" class="btn btn-forest w-30">등록</button>
			        <button type="reset" class="btn btn-forest w-30">취소</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
<%@include file="../includes/foot.jsp"%>