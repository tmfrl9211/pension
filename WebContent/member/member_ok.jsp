<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//입력양식의 값을 가져오기
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");
String name=request.getParameter("name");
String pwd=request.getParameter("pwd1");
String email=request.getParameter("email");

// 입력 쿼리 만들기
String sql="insert into member(userid,name,pwd,email)";
sql=sql+" values('"+userid+"','"+name+"','"+pwd+"','"+email+"')";

stmt.executeUpdate(sql);
%>
<%@ include file="../main/top.jsp" %>
<style>
  #image {
    width:1200px;
    height:305px;
    margin:auto;
  }
  #section {
    width:1200px;
    height:200px;
    margin:auto;
    text-align:center;
  }
</style>
<script>
 function move()
 {
	 location="../main/index.jsp";
 }
</script>
<div id=image> <img src=../img/main3.PNG width=1200px height=305px> </div>
<div id=section> <br>
  <%=name %>님 회원가입 해주셔서 감사합니다.. <p>
  자주 놀러와 주세요!!! <p>
  <input type=button onclick=move() value=메인으로>
</div>
<%@ include file="../main/bottom.jsp" %>

