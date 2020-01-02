<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function sel()
 {
	 //var y="2018";
	 
	 document.pkc1.year.selectedIndex=4;
 }
</script>
</head>
<body onload=sel()>
  <!-- select 태그에 원하는 option 태그값 나타내기 -->
  <form name=pkc1>
  태어난 해
  <select name=year>
   <option>선택</option>
   <option>2019</option>
   <option>2018</option>
   <option>2017</option>
   <option>2016</option>
   <option>2015</option>
   <option>2014</option>
  </select>
  </form>
  <form name=pkc2>
  태어난 해
  <select name=year>
   <option>선택</option>
   <option>2019</option>
   <option>2018</option>
   <option selected>2017</option>
   <option>2016</option>
   <option>2015</option>
   <option>2014</option>
  </select>
  </form>
</body>
</html>