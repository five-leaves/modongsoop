<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Search Club</title>
</head>
<body>

<h1>검색 페이지</h1>
<form action="/search" method="get">
	<label for="id">카테고리 번호:</label>
	<input type="number" id="id" name="id" required>
	<button type="submit">검색</button>
</form>

<!-- 검색 결과 -->
<c:if test="${not empty search}">
<h2>동호회 목록:</h2>
<table border="1">
<thead>
<tr>
<th>clubNo</th>
<th>clubName</th>
<th>clubContent</th>
<th>categoryNo</th>
</tr>
</thead>
<tbody>

<!-- 결과 데이터 출력 -->
<c:forEach var="result" items="${search}">
<tr>
<td>${result.clubNo}</td>
<td>${result.clubName}</td>
<td>${result.clubContent}</td>
<td>${result.categoryNo}</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>

<!-- 검색 결과가 없는 경우 -->
<c:if test="${empty search}">
<p>해당하는 동호회가 존재하지 않습니다.</p>
</c:if>
</body>
</html>