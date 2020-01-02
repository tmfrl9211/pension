<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
 function sung_in()
 {
	document.pkc1.sung[0].checked="true"; 
 }
</script>
</head>
<body onload=sung_in()> <!-- 자바스크립트에 실행, 태그내에 실행 / 공통점 : checked 속성 -->
 <form name=pkc1>
   성별 : <input type=radio name=sung> 남자
       <input type=radio name=sung> 여자
 </form>
 <p>
 <hr>
 <form name=pkc2>
 성별 : <input type=radio name=sung checked> 남자
       <input type=radio name=sung> 여자
       <!-- jsp에서 if문을 통해 체크된 radio내에 checked 속성주면 됨 -->
 </form>
</body>
</html>