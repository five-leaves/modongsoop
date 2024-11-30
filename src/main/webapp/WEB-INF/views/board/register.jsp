<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/head.jsp"%>

<body>
<%@include file="../includes/header.jsp"%>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
		
        <form role="form" action="/board/register" method="post">
        
    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='boardTitle'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="3" name='boardContent'></textarea>
          </div>

          <div class="form-group">
            <label>작성자</label> <input class="form-control" name='userNo'>
          </div>
          
          <div class="form-group">
            <label>동호회</label> <input class="form-control" name='clubNo'>
          </div>
          
          <input type="hidden" id="csrfToken" name="_csrf" value="${_csrf.token}" />
          <button type="submit" class="btn btn-default">등록</button>
          <button type="reset" class="btn btn-default">취소</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/footer.jsp"%>