<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.time.LocalDate" %>    
<%@ include file="../main/top.jsp" %>
<%@page import="java.sql.*" %>   
<% // content.jsp
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  %>
<style>
#image {
  width:1200px;
  height:350px;
  margin:auto;
  }
  #section {
  margin:auto;
  height:1300px;
  width:1200px;
  }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
 function cal()
 { // 년도, 월을 선택하면 해당 달력 보여주기
	 var y=document.all.yea.value; //form 태그 없을 때는 id나 class를 이용
	 var m=document.all.mon.value;
	 // 년도, 월을 가지고 문서를 호출
	 location="reserve.jsp?yy="+y+"&mm="+m;
	 
 }
</script>
</head>
<body>
<div id=section>
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

 <div id=image> <img src=../img/main3.PNG width=1200px height=305px> </div>
 <table width=1000 height=500 align=center border=1 cellspacing=0>
  <caption>
     <a href="reserve.jsp?yy=<%=y%>&mm=<%=m-1%>"> 이전달 </a>
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
     <a href="reserve.jsp?yy=<%=y%>&mm=<%=m+1%>"> 다음달 </a> 
  </caption>
  <tr align=center height=50>
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
    	   //방이 예약되어있는지를 확인하는 부분 시작 !!
    	   String sql;
    	   ResultSet rs;
    	   String nowday; // 1일부터 31일까지의 '년-월-일'
    %>
        <td valign=top align=left> <!-- 날짜 출력되는 td -->
         <span><%=day%> </span>
         <%
         nowday=y+"-"+m+"-"+day; // 
         sql="select * from reserve where in_date <='"+nowday+"' and out_date>'"+nowday+"' and bang='high'";
         rs=stmt.executeQuery(sql);
         if(rs.next()) // 방이 현재 날짜에 예약되어 있을 때
         {
        	 %>
         <p align=center> 하이1호(불가) </p>
         <%
         }
         else
         {
         %>
         <p align=center> <a href="input.jsp?bang=high&y=<%=y%>&m=<%=m%>&d=<%=day%>"> 하이1호(가능)</a> <br> <sup>최대가능인원-2인</sup></p>
          
         <%
         }
         %>
         <%
         sql="select * from reserve where in_date <='"+nowday+"' and out_date>'"+nowday+"' and bang='ray'";
         rs=stmt.executeQuery(sql);
         if(rs.next()) // 방이 현재 날짜에 예약되어 있을 때
         {
        	 %>
         <p align=center> 레이1호(불가) </p>
         <%
         }
         else
         {
         %>
         <p align=center> <a href="input.jsp?bang=ray&y=<%=y%>&m=<%=m%>&d=<%=day%>"> 레이1호(가능) </a> <br> <sup>최대가능인원-3인</sup></p>
         <%
         }
         %>
        </td>
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
</div>

<%@ include file="../main/bottom.jsp" %>

