<?xml version="1.0" encoding="UTF-8"?>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.DataDAO" %>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.ServerApi" %>

<%@ page contentType="text/html;charset=utf-8" language="java"
         pageEncoding="utf-8" %>
<%
    ConnectionString connectionString = new ConnectionString("mongodb+srv://jeonghwan:wlsdlstk6%21@vegandata.696tu4w.mongodb.net/?retryWrites=true&w=majority");
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .serverApi(ServerApi.builder()
                    .version(ServerApiVersion.V1)
                    .build())
            .build();
    MongoClient mongoClient = MongoClients.create(settings);
    DataDAO dao = new DataDAO(mongoClient);
%>
<!DOCTYPE html>
<html>
<head>
    <%--휴대폰이든 노트북이든 디바이스 크기에 맞춰 화면을 보여준다.--%>
    <meta name="viewport" content="width=device-width",intial-scale="1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
    <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
    <title>
        Project 01
    </title>



</head>

<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
%>

<h1>
    <i class="fa-solid fa-seedling"></i>
    <a style="color: #23527c" href='index.jsp'>VEGGIE MEAL</a>
    <i class="fa-solid fa-seedling"></i></h1>

<br/>

<nav role="navigation">
    <ul id="main-menu">
        <li><a>비건인증</a>
            <ul id="sub-menu">
                <li><a href='intro.jsp'>인증소개&절차</a></li>
                <li><a style = "color: red" href='data.jsp'>제품소개</a></li>
            </ul>
        </li></ul>

    <ul id="main-menu">
        <li><a href='restaurant.jsp'>비건식당</a></li>
    </ul>

    <ul id="main-menu">
        <li><a href="VeganWebSite.jsp">게시판</a></li>
    </ul>

    <%
        if(userID == null){
    %>
    <ul id="main-menu">
        <li><a href="login.jsp">마이페이지</a>
            <ul id="sub-menu">
                <li><a style = "color: red" href='login.jsp'>로그인</a></li>
                <li><a href='join.jsp'>회원가입</a></li>
            </ul></li>
    </ul>

    <%
    } else{
    %>
    <ul id="main-menu">
        <li><a href="login.jsp">마이페이지</a>
            <ul id="sub-menu">
                <li><a style = "color: red" href='logoutAction.jsp'>로그아웃</a></li>
            </ul></li>
    </ul>

    <%
        }
    %>
</nav>
</br></br></br></br></br></br>
<hr width = "90%" color = "black">

<div class="container">
    <h3>카테고리</h3>
    <hr>
    <form method="post" action="data.jsp">
        <input type="checkbox" name="item" value="화장품">화장품
        <input type="checkbox" name="item" value="의약외품 등">의약외품
        <input type="checkbox" name="item" value="생활용품">생활용품
        <input type="checkbox" name="item" value="식품(건강기능,수입 포함)">식품
        <input type="checkbox" name="item" value="원료">원료
        <br><br>
        <input type="submit" value="확인">
    </form>

    </br></br></br>
    <div class="row" align="center">
    <table style="alignment: center; border: 1.5px solid white; width: 1300px; background-color: white; background-size: cover; padding: 30px">
    <thead>
            <tr>
                <th style="background-color: #eeeeee; ">image</th>
                <th style="background-color: #eeeeee; text-align: center;">id</th>
                <th style="background-color: #eeeeee; text-align: center;">category</th>
                <th style="background-color: #eeeeee; text-align: center;">company</th>
            </tr>
            </thead>

            <%
                String[] value = request.getParameterValues("item");
            %>
            <%List<Data> data = dao.getList(value);%>

                <%
                    System.out.println(data.size());
                    for(int i=0;i<data.size();i++){
                %>
                <tr>
                    <th style="background-color: #eeeeee; width: 290px "><a href = "datainfo.jsp?id=<%=data.get(i).getId()%>"><img width="70" height="70" src=<%=data.get(i).getImg().get(0)%>></a></th>
                    <th style="background-color: #eeeeee; text-align: center;"><%=data.get(i).getId()%></th>
                    <th style="background-color: #eeeeee; text-align: center;"><%=data.get(i).getCategory()%></th>
                    <th style="background-color: #eeeeee; text-align: center;"><%=data.get(i).getName()%></th>
                </tr>
                <%}%>

            </table>
        </tr>
        </tbody>
    </div>
    <br><br><br><br>

    <hr width="90%" color = "black">


    <br><br><br><br><br><br>
    <br><br><br><br><br><br>

    <a href="write.jsp" class="btn btn-primary pull-right"></a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body>
</html>
