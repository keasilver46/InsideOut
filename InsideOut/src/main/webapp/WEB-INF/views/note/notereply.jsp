<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 1 }">
	<script>
		alert("쪽지 보내기 성공");
		location.href="notereplyform.do";
	</script>
</c:if>

<c:if test="${result != 1 }">
	<script>
		alert("쪽지 보내기 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>