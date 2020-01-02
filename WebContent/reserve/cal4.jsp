<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.time.LocalDate" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
 function cal()
 { // 년도, 월을 선택하면 해당 달력 보여주기
	 var a=document.all.yea.value; //form 태그 없을 때는 id나 class를 이용
	 var b=document.all.mon.value;
	 // 년도, 월을 가지고 문서를 호출
	 location="cal4.jsp?yy="+a+"&mm="+b;
	 
 }
</script>
</head>
<body>
<%  // cal4.jsp
                 // LocalDate.now(); // 현재시간 기준
   int y,m; // 년,월저장할 변수
   if(request.getParameter("yy")==null) // 값이 없다면
   {
      LocalDate xday=LocalDate.now(); // 현재시간
      y=xday.getYear();  // 현재시간의 년도
      m=xday.getMonthValue();  // 현재시간의 월
   }
   else // request값이 있어서 받은값은 정수로 변환
   {
	  y=Integer.parseInt(request.getParameter("yy"));
	  m=Integer.parseInt(request.getParameter("mm"));
   }
   
   // 0월이 들어올때
   if(m==0)  // 2019년 1월에서 클릭하면  2019, 0
   {
	   y=y-1;
	   m=12;    // 2018,12
   }
   
   // 13월이 들어올때
   if(m==13)  // 2019년 12월에서 다음달 2019, 13
   {
	   y=y+1;
	   m=1;      // 2020, 1
   }
   
   LocalDate today=LocalDate.of(y,m,1); // 괄호내에있는 년월일
   int yoil=today.getDayOfWeek().getValue(); // 1일의 요일
   if(yoil==7) 
	   yoil=0;  // 일요일경우 이전소스가 대부분 일요일이 0이라서 
	   
   double chong=today.lengthOfMonth(); // 월의 총일수
   
   int ju=(int)Math.ceil((chong+yoil)/7); // 현재월의 주의 수 
                       // 올림(X.xxxx) =>  X정수보다 1큰 정수로
   int max_day=(int)chong;  
   
   //double a=100; // double과 int로 바꾸어서 출력을 확인해보세요
   //int b=6;
   //out.print(a/b);

%>

 <table width=400 border=1 cellspacing=0>
  <caption>
     <a href="cal4.jsp?yy=<%=y%>&mm=<%=m-1%>"> 이전달 </a>
     <select id=yea onchange=cal()>
       <%
       String sel1="";
       for(int i=y+3;i>=y-3;i--)
       {
    	   if(i==y)
    		   sel1="selected";
    	   else
    		   sel1="";
       %>
       <option value=<%=i%> <%=sel1 %>><%=i %></option>
       <%
       }
       %>
     </select>
     <select id=mon onchange=cal()>
     <%
     String sel2="";
      for(int i=1;i<=12;i++)
      {
    	  if(i==m)
    		  sel2="selected";
    	  else
    		  sel2="";
     %>
     <option value=<%=i%> <%=sel2%>><%=i%> </option>
      <%
      }
      %>
     </select>
     <a href="cal4.jsp?yy=<%=y%>&mm=<%=m+1%>"> 다음달 </a> 
  </caption>
  <tr align=center>
    <td> 일 </td>
    <td> 월 </td>
    <td> 화 </td>
    <td> 수 </td>
    <td> 목 </td>
    <td> 금 </td>
    <td> 토 </td>
  </tr>
  <%
    int day=1;
    for(int i=1;i<=5;i++) // i의 값이 행의 값과 일치
    {
  %>
  <tr align=center> <!-- 주 -->
    <%
      for(int j=0;j<7;j++)
      {
       if( (yoil>j && i==1) || max_day < day)	// 빈칸을 출력할 경우가 맞다면
       {     // 앞쪽빈칸        // 뒤쪽빈간(총일수 뒷부분)
    %> 
        <td> &nbsp; </td> <!-- 빈칸을 출력하는 부분 -->
    <%
       }
       else  // 날짜를 출력할 경우라면
       {
    %>
        <td> <%=day%> </td>
    <%
          day=day+1; 
       }
       
      }
    %>
  </tr>
  <%
    }
  %>
  
 </table>




