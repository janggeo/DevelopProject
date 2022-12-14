<%--
  Created by IntelliJ IDEA.
  User: jo-eunji
  Date: 2022/11/06
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
      <meta name="viewport" content="width=device-width",intial-scale="1">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">

      <title>
        Project 01
      </title>
      <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>


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
          <li><a href='data.jsp'>제품소개</a></li>
        </ul>
      </li></ul>

    <ul id="main-menu">
      <li><a href='restaurant.jsp'>비건식당</a></li>
    </ul>

    <ul id="main-menu">
      <li><a href="VeganWebSite.jsp">게시판</a></ul>

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
      <div align="center" style="border: 1px dotted white; height: content-box; width: 1300px; background-size: cover; padding: 30px; opacity: 0.9">
        <td style='letter-spacing: normal'>
      <h4>Why Vegan?<hr style="width: border-box"><a style="color:black; font-size: 0.5em">Animals? Planet? Health?</a></h4>


      <h3><div align="center">
        최근 '비건'이라는 단어가 대두되고 있다.<br>
        그러나 그 인지도에 비해 비건에 대해 정확히 아는 사람은 드물다.<br>
        만약 안다 하더라도 ‘채식주의자’ 그 정도 일 것이다.<br>
        나름 전세계적으로 가장 많이 성장하고 있는 시장 중 하나가 비건 시장인만큼<br>
        미래소비자인 우리가 비건에 대해 알아둬야 한다고 생각한다.<br>
        우리는 Veggie Meal(베지밀),비건 웹 사이트를 통해 미래소비자들에게 생활 속의 비건 상품들을 알려주는 것이 목표이다.<br>
        이를 통해 미래소비자들이 현명하고 주체적으로 소비를 하길 바란다.<br><br><br><br></div></h3>


    <hr width = "border-box" color = "black">
        <h4>VEGANISM?
          <hr>
        </h4>
        <h3>채식주의는 동물성 식품을 제한하고 과일·채소·곡물 등 식물성 식품을 섭취하는 식습관을 지향하는 생활 양식이다.<br>
          비건이란 채식주의 단계 중 하나로 동물에게 제공받는 식품, 의류, 의약품, 화장품 등을 거부하는 사람들을 뜻합니다.<br><br>
          채식주의에도 단계가 있다.<br>

          <img style="height: 500px; width: 600px" src="https://cdn.imweb.me/upload/S20210826c6fa6a96dcb7a/05dc87d3ab7ee.png">
          <br><br><br><br>
          1. 플렉시테리언(Flexitarian)<br>
          : 말 그대로 ‘유연한 채식'을 하는 사람들을 칭한다.<br>
          평소에는 채식 식단을 유지하지만 상황에 따라 가끔 육류나 해산물을 먹는다.<br>
          주로 모임, 회식 등 본인의 식단을 지키기 어려운 상황에 육류를 허용한다.<br>
          <br><br>
          2. 폴로 베지테리언(Pollo-Vegetarian)<br>
          : 붉은 살코기는 먹지 않지만 조류, 해산물, 동물의 알, 유제품은 섭취하는 준채식주의자다.<br>
          이들은 닭고기나 오리고기 등 조류도 먹는다. 일부 육식을 하는 셈이다.<br>
          <br><br>
          3. 페스코 베지테리언(Pesco-Vegetarian)<br>
          : 육식은 하지 않지만 해산물과 동물의 알, 유제품은 먹는 채식주의자다.<br>
          <br><br>
          4. 락토 오보 베지테리언(Lacto Ovo-Vegetarian)<br>
          직접적인살생이나 도축을 통해 생산되는 육류, 생선, 해물은 먹지 않지만 동물의 알, 유제품은 먹는 채식주의자.<br>
          <br><br>
          5. 오보 베지테리언(Ovo-Vegetarian)<br>
          : 육류와 생선, 유제품은 먹지 않지만 동물의 알(예 달걀)은 먹는 채식주의자를 말한다.<br>
          <br><br>
          6. 락토 베지테리언(Lacto-Vegetarian)<br>
          육류, 생선, 동물의 알을 먹지 않으며 우유와 유제품, 꿀 등은 섭취하는 채식주의자다.<br>
          치즈, 요거트, 버터, 크림 등 동물의 생명을 뺏지 않는 유제품은 섭취한다.<br>
          <br><br>
          7. 비건 (Vegan)<br>
          우리가 채식주의자 하면 흔히 떠올리는 부류다. 육류는 물론 생선, 알, 유제품, 꿀 등 동물로부터 유래한 식품은 손을 대지 않는다.<br>
          <br><br>


          <br><br><br><br><br><br>
          <hr width = "border-box" color = "black">
        </h3></td></div>
        <br><br><br><br><br><br>
  </body>
</html>
