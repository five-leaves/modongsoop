<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>mypage</h1>

	<p>principal : <sec:authentication property="principal"/></p>
	<p>UserDTO : <sec:authentication property="principal.user"/></p>
	
	<p>username : <sec:authentication property="principal.user.username"/></p>
	<p>profile : <sec:authentication property="principal.user.profile"/></p>
	<p>nickname : <sec:authentication property="principal.user.nickname"/></p>
	<p>birth : <sec:authentication property="principal.user.birth"/></p>
	

</body>
</html>