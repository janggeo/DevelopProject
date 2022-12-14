<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
CTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content-Type" content = "text/html; charset= UTF-8">
<title>Veggie Meal</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>