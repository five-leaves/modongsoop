<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/head.jsp"%>
<body>
	<div class="container forest-container">
		<%@include file="../includes/header.jsp"%>
		<!-- 검색 결과 -->
		<c:if test="${not empty searchedClub}">
			<h2>검색 결과:</h2>
			<table cellpadding="10">
				<thead>
					<tr>
						<th>동호회 이름</th>
						<th>동호회 소개</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<tbody>
					<!-- 결과 데이터 출력 -->
					<c:forEach var="result" items="${searchedClub}">
						<tr>
							<td>${result.clubName}</td>
							<td>${result.clubContent}</td>
							<td>${result.categoryNo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<!-- 검색 결과가 없는 경우 -->
		<c:if test="${empty searchedClub}">
			<p>동호회가 존재하지 않습니다.</p>
		</c:if>
	</div>
</body>
<%@include file="../includes/foot.jsp" %>