<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<script>
	
  $("#btn-logout").on("click", function(e){

    e.preventDefault();
    $("form").submit();
    alert("로그아웃 되습니다.");

<<<<<<< HEAD
	<script>
	
 	  $(".btn-logout").on("click", function(e){
	
	    e.preventDefault();
	    $("form").submit();
	
	  });
=======
>>>>>>> b04f9e54832aa98c21fb236dd435c6b7ba16e949
	
	  document.getElementById("logoutButton").addEventListener("click", function (e) {
	        e.preventDefault(); // 기본 링크 동작 방지
	        confirm("로그아웃 되었습니다.")
	    });
	  
	</script>

</body>
</html>