<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <script> // select태그 
          // 1. 선택된 option태그의 값을 가져오기
          // 2. 수정관련 => 이전에 선택된 option태그를 보이게 하기
   function sel_view() // 1번
   {
      // document.pkc.food[document.pkc.food.selectedIndex].value;
      //document.pkc.food[document.pkc.food.selectedIndex].text
      alert(document.pkc.food.value);  	  
   }
   function move_site()
   {
	   // 이동할 사이트의 주소를 가져오기 => location에 주소를 넘기기
	   location=document.pkc.site.value;
	   // 브라우저 주소창에 value에 해당되는 주소를 입력하고 엔터와 동일
   }
   function check() // 사용자가 선택한 메뉴가 문서를 읽을때 나타나게하기
   {
	   var ch=3;
	   //document.pkc.food.selectedIndex=ch;
	   document.pkc.food.value=ch;
   }
 </script>
</head>
<body onload=check()> 
  <form name=pkc> <!-- onchange : 현재 선택된 값이 바뀔때 -->
   <select name=food onchange=sel_view()>
     <option> 선택 </option>
     <option value=1> 짜장면 </option>
     <option value=2> 우동 </option>
     <option value=3> 짬뽕 </option>
     <option value=4> 탕수육 </option>
     <option value=5> 라조기 </option>
   </select>
   <!-- <input type=button onclick=sel_view() value=확인> -->
   <select name=site onchange=move_site()>
     <option> 패밀리사이트 </option>
     <option value="http://www.naver.com"> 네이버 </option>
     <option value="http://www.daum.net"> 다음 </option>
     <option value="http://www.coopang.com"> 쿠팡 </option>
   </select>
  </form>
</body>
</html>









