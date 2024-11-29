<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Logout Page</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method='post' action="/user/fiveleavesLogout">
                            <fieldset>
                            
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="/club/list" class="btn btn-lg btn-success btn-block">Logout</a>
                                
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

	<script>
	
		$(".btn-success").on("click", function(e){
			
			e.preventDefault();
			$("form").submit();
			alert("로그아웃하였습니다.");
			
		});
	
	</script>
	
<%-- 	<c:if test="${param.logout != null}">
	
		<script>
			$(document).ready(function(){
				alert("로그아웃하였습니다.");
			})
		</script>
		
	</c:if> --%>

</body>
</html>