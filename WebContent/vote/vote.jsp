<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <form method=post action=vote_ok.jsp>
    <table width=400>
      <caption><h3>당신의 안주를 pick하세요!</h3></caption>
       <tr>
        <td><input type=radio name=anju value=1></td>
        <td>생선회</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=2></td>
        <td>소곱창</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=3></td>
        <td>제육볶음</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=4></td>
        <td>양꼬치</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=5></td>
        <td>해물파전</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=6></td>
        <td>감자탕</td>
       </tr>
       <tr>
        <td><input type=radio name=anju value=7></td>
        <td>족발</td>
       </tr>
       <tr align=center>
        <td colspan=2><input type=submit value=투표></td>
       </tr>
    </table>
  </form>
</body>
</html>