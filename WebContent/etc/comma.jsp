<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- comma.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function comma(price)
   {
	   price=price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	   return price;
   }
   var tt=comma(1000000+"");
   alert(tt);
   
   function imsi(price)
   {
     n=price.length; // 변경할 값의 길이를 구하기
     var num="";
     for(i=0;i<n;i++)
    {
       if(i%3==0&&i!=0)
         num=","+num;
       
  	   num=price.substr(price.length-1,1)+num;
       price=price.substring(0,price.length-1);
    }
     return num;
   }
 </script>
</head>
<body>

</body>
</html>