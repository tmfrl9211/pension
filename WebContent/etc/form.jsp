<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form method=post action=request2.jsp>
     이름 <input type=text name=name><p>
     주소 <input type=text name=juso> <p>
     취미 <input type=checkbox value=낚시 name=hobby>낚시
     <input type=checkbox value=헬스 name=hobby>헬스
     <input type=checkbox value=소주 name=hobby>소주
     <input type=checkbox value=여행 name=hobby>여행 <p>
     <input type=submit value=전송>
   </form>
</body>
</html>