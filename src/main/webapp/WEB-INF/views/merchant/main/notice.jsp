<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공지사항 페이지 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/merchant/css/styleMain.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/merchant/css/noticeStyle.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="mainTop.jsp"%>
<div class="main-notice">
	<div class="search-container">
		<form action="${pageContext.request.contextPath}/merchant/home/notices/search"
			method="get" class="search-form">
			<input type="text" placeholder="검색" name="search"
				class="search-input">
		</form>
	</div>
	<h1>공지사항</h1>
	<div class="info-box">파트너센터의 정보 업데이트, 개선 안내, 서비스 공지 등 유익한 정보를 확인
		하실 수 있습니다.</div>
	<ul class="notice-list">
		<c:forEach var="dto" items="${noticeList}">
			<li class="notice-item"><span class="notice-title"> <a
					href="${pageContext.request.contextPath}/merchant/home/notice-title/${dto.noticeNum }">
						${dto.noticeTitle} </a></span> <span class="notice-date">${dto.noticeDate}</span>
			</li>
		</c:forEach>
	</ul>
</div>
<%@ include file="../../client/main/bottom.jsp"%>