<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script>
	
 	  $(".btn-logout").on("click", function(e){
	
	    e.preventDefault();
	    $("form").submit();
	
	  });
	
	  document.getElementById("logoutButton").addEventListener("click", function (e) {
	        e.preventDefault(); // 기본 링크 동작 방지
	        confirm("로그아웃 되었습니다.")
	    });
	  
	</script>

</body>
</html>