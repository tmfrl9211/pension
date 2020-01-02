<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script>
   var first=150000;
   var second=0;
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
	   if(inwon>6)
		   {
		   alert("최대인원을 초과합니다.");
		   document.pkc.sung.selectedIndex=1;
		   document.pkc.child.selectedIndex=0;
		   inwon=2;
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
	   first=s_price+in_price; // 숙박 합계금액 변수에 저장
	   var tot_price=comma(s_price+in_price);
	   document.getElementById("chong").innerText=comma(first+second);
	   document.getElementById("tot").innerText=tot_price;
		   
   }
   }
   function comma(price)
   {  
	   price=price+"";
	   price=price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	   return price;
   }
   function chuga_cal()  //추가금액 계산 함수
   {
	   if(document.pkc.ch[0].checked)
		   var p1=parseInt(document.pkc.ch[0].value);
	   else
		   var p1=0;
	   
	   if(document.pkc.ch[1].checked)
		   var p2=parseInt(document.pkc.ch[1].value);
	   else
		   var p2=0;
	   
	   if(document.pkc.ch[2].checked)
		   var p3=parseInt(document.pkc.ch[2].value);
	   else
		   var p3=0;

	   second=p1+p2+p3; // 추가요금 합계 변수에 저장
	   document.getElementById("chong").innerText=comma(first+second);
	   document.getElementById("chu").innerText=comma(p1+p2+p3);
   }

</script>
</head>


<body>
<form name=pkc>
   101호 기준2/최대6
   
   <select name=suk>
     <option value=1 onchange=cal()> 1박 </option>
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
 <p style="margin-left:400px">  숙박 합계금액 : <span id=tot></span>원
 <hr>
  
  <p>
  <input type=checkbox name=ch onclick=chuga_cal() value=50000> 스파추가 50,000원 <p>
  <input type=checkbox name=ch onclick=chuga_cal() value=30000> 숯불세트 30,000원 <p>
  <input type=checkbox name=ch onclick=chuga_cal() value=50000> 바베큐세트 50,000원 <p>
  <p style="margin-left:400px"> 추가금액 : <span id=chu>0</span>원
  <hr>
  <p style="margin-left:400px"> 총합계금액 : <span id=chong></span>원 </p>
  
  
 
  </form>
</body>
</html>