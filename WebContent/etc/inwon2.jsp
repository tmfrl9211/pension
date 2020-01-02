<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   window.onload=function() // 문서를 읽을때 function(){} 실행
   {
	   // 숙박은 첫번재 option태그이므로 추가해줄 필요X
	   document.pkc.sung.selectedIndex=1;
	   document.getElementById("tot").innerText="150,000";
   }
   function cal() // 숙박과 인원을 계산하여 합계금액 전달
   {
	   var s=document.pkc.suk.value;// 숙박일수
	   var s_price=s*150000; // 숙박일수에 따른 금액 a
	   //alert(s_price);
	   var n1=parseInt(document.pkc.sung.value); // 성인인원
	   var n2=eval(document.pkc.child.value);  // 아동인원
	   var inwon=n1+n2; // 총인원
	   if(inwon>6) // 총인원이 6명 초과될때
	   {   // 인원수는 성인2명, 아동0명 초기화
		   document.pkc.sung.selectedIndex=1;
		   document.pkc.child.selectedIndex=0;
		   var tot_price=comma(s_price);
		   document.getElementById("tot").innerText=tot_price;
	   }
	   else
	   {
	   //alert(inwon);
	   var chuga=inwon-2; // 총인원-기준인원
	   if(chuga > 0)// 총인원에 대한 금액 b
	     var in_price=chuga*10000; // 3명이상일때 
	   else
		 var in_price=0;  // 1~2명일 경우
	   //alert(in_price);
	   // tot인 곳에 a+b금액을 전달 
	   var tot_price=comma(s_price+in_price);
	   
	   document.getElementById("tot").innerText=tot_price;
	   }
   }
   function comma(price)
   {  
	   price=price+"";
	   price=price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	   return price;
   }
 </script>
</head>
<body>
 <form name=pkc>
   101호  기준2/최대6  
  
  <select name=suk onchange=cal()>
    <option value=1> 1박 </option>
    <option value=2> 2박 </option>
    <option value=3> 3박 </option>
    <option value=4> 4박 </option>
  </select>
  
  성인 
  <select name=sung onchange=cal()>
    <option value=1> 1명 </option> <!-- selectedIndex 0 -->
    <option value=2> 2명 </option> <!-- selectedIndex 1 -->
    <option value=3> 3명 </option> <!-- selectedIndex 2 -->
    <option value=4> 4명 </option> <!-- selectedIndex 3 -->
    <option value=5> 5명 </option> <!-- selectedIndex 4 -->
    <option value=6> 6명 </option> <!-- selectedIndex 5 -->
  </select>
 아동
  <select name=child onchange=cal()>
    <option value=0> 0명 </option>
    <option value=1> 1명 </option>
    <option value=2> 2명 </option>
    <option value=3> 3명 </option>
    <option value=4> 4명 </option>
    <option value=5> 5명 </option>
    <option value=6> 6명 </option>
  </select>
 합계금액 : <span id=tot></span>원
 </form>
</body>








</html>