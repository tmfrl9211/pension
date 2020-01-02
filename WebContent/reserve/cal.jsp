<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.time.LocalDate" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
   LocalDate today=LocalDate.of(2020,2,1); 
   int yoil=today.getDayOfWeek().getValue(); // 요일 : 1~7 
   if(yoil==7) // 요일이 일요일이라면 0으로 변경
	   yoil=0;  
   //out.print(yoil+"<br>");
   boolean leap=today.isLeapYear(); // 윤년인지 아닌지
   //out.print(leap+"<br>");
   double chong=today.lengthOfMonth(); // 월의 일수
   //out.print(chong+"<br>");
  
   // 몇주인지를 계산
   int ju=(int)Math.ceil((chong+yoil)/7);
   //out.print(ju+"<br>");
   
   // chong(총일수)를 정수형
   int max_day=(int)chong;
   //max_day(총일수), yoil(1일의 시작요일), ju(몇주)
%>
<style>
td {
font-size:20px;
}
</style>
<table width=500 border=1 cellspacing=0 align=center>
 <tr>
  <td> 일 </td>
  <td> 월 </td>
  <td> 화 </td>
  <td> 수 </td>
  <td> 목 </td>
  <td> 금 </td>
  <td> 토 </td>
 </tr>
   <%
    // 1~max_day값을 출력
    int dd=1;
   String col="";
    for(int i=1;i<=ju;i++)
    {
   %>
    <tr height=50 align=center> <!-- <%=i%>주 -->
     <%
     for(int j=1;j<=7;j++) // td를 7번 출력
     {
       if(dd > max_day || (j <= yoil)&&(i==1) )
       {//출력값 > 총일수
     %>
       <td> &nbsp; </td>
     <%
       }
       else  
       {
    	   switch(j)
    	   {
    	   case 1:col="red"; break;
    	   case 7:col="blue"; break;
    	   default: col="black";
    	   }
     %>
       <td> <span style="color:<%=col%>"><%=dd%></span> </td>
     <%
         dd=dd+1;
       }
      
     } // td의 끝
     %>
    </tr>
   <%
    }
   %>
</table>

</body>
</html>




