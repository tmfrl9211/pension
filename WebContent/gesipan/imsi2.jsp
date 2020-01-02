<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function check()
  {
	  var hh="2,4,6,";
	  var hob=hh.split(","); //hh 문자열을 ,기호로 나눠서 배열로 만듬
	  //alert(gob.length);
	  
	  for(i=0;i<hob.length-1;i++)
		  document.pkc1.hobby[hob[i]].checked=true;
	  //document.pkc1.hobby[hob[0]].checked=true;
	  //document.pkc1.hobby[hob[1]].checked=true;
	  //document.pkc1.hobby[hob[2]].checked=true;
  }
</script>
</head>
<body onload=check()>
  <form name=pkc1>
   <input type=checkbox name=hobby>낚시<br>
   <input type=checkbox name=hobby>여행<br>
   <input type=checkbox name=hobby>독서<br>
   <input type=checkbox name=hobby>음주<br>
   <input type=checkbox name=hobby>먹방<br>
   <input type=checkbox name=hobby>그림<br>
   <input type=checkbox name=hobby>공부<br>
  </form>
  <p><hr>
  <form name=pkc2>
   <input type=checkbox name=hobby checked>낚시<br>
   <input type=checkbox name=hobby>여행<br>
   <input type=checkbox name=hobby checked>독서<br>
   <input type=checkbox name=hobby>음주<br>
   <input type=checkbox name=hobby>먹방<br>
   <input type=checkbox name=hobby>그림<br>
   <input type=checkbox name=hobby>공부<br>
  </form>
</body>
</html>