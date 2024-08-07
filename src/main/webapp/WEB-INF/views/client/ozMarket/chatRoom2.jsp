<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ozMarket/chattingRoom.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>채팅</title>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
</head>
<body>
	<div class="container-list">
		<div class="chat-container">
			<div class="user-info">
				<div class="user-avatar">
					<c:choose>
						<c:when test="${empty member.memberImage}">
							<img
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&w=144&h=144&c=c&webp=1"
								alt="User Avatar">
						</c:when>
						<c:otherwise>
							<img src="${member.memberImage}" alt="User Avatar">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="memberNickname">${nickname}</div>
			</div>
			<div class="chat-list">

				<c:forEach var="room" items="${roomList}">
					<div class="chat-room-entry">
						<a
							href="${pageContext.request.contextPath}/ozMarket/chattRoom/${room.roomNum}">
							대화 상대: ${room.partner} </a>
						<div class="latest-message">마지막 메시지: ${room.lastMessage}</div>
						<form
							action="${pageContext.request.contextPath}/ozMarket/deleteChatRoom/${room.roomNum}"
							method="post">
							<button type="submit">채팅방 삭제</button>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
