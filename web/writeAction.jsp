<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "veganwebsite" class="com.example.new2.veganwebsite.Veganwebsite" scope="page" />
<jsp:setProperty name = "veganwebsite" property = "boardTitle" />
<jsp:setProperty name = "veganwebsite" property = "boardContent" />

<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content-Type" content = "text/html; charset= UTF-8">
<title>Veggie Meal</title>
</head>
<body>
	<%
	String userID = null;
	
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	
	else{
		if(veganwebsite.getBoardTitle() == null || veganwebsite.getBoardContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
		}

		else{
			VeganwebsiteDAO veganwebsiteDAO = new VeganwebsiteDAO();
			int result = veganwebsiteDAO.write(veganwebsite.getBoardTitle(),userID, veganwebsite.getBoardContent());
			
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
				
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'VeganWebSite.jsp'");
				script.println("</script>");
			}
		}		
	}
		
	%>
</body>
</html>