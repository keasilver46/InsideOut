<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록 수정</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
table, td, th {
	border: 1px solid black;
}

.active {
	font-weight: bold;
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}
</style>
<body>
	<c:import url="../staffHeader.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="/api/v1/staff/StaffList">상담 내역</a></li>
					<li><a href="/api/v1/staff/surveyList">만족도 조사</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${staff_no}">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${staff_no}">쪽지작성</a></li>
					<li><a href="/api/v1/staff/staffUpdateForm">회원정보 수정</a></li>
					<li><a href="/api/v1/user/PasswordUpdateForm">비밀번호 수정</a></li>
				</ul>
				<br>
			</div>
			<form method="post" action="counselRecordUpdateOk">

				<input type="hidden" id="booking_no" name="booking_no"
					value="${record.booking_no}"> <input type="hidden"
					name="page" value="${page}"> <input type="hidden"
					id="staff_no" name="staff_no" value="${staff_no}">

				<div class="form-group">
					<label for="exampleFormControlTextarea1">상담기록</label>
					<textarea class="form-control" id="counsel_content"
						name="counsel_content" placeholder="상담내용을 입력해주세요." rows="20">${record.counsel_content}</textarea>
				</div>

				<button type="reset" class="btn btn-success">취소</button>
				<button type="submit" class="btn btn-success">수정</button>
			</form>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
		</div>
	</div>
</body>
</html>