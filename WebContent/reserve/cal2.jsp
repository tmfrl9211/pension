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
           //LocalDate.now(); // 현재시간 기준
   LocalDate xday=LocalDate.now(); //현재시간
   int y=xday.getYear();
   int m=xday.getMonthValue();
   LocalDate today=LocalDate.of(y,m,1); //괄호내에 있는 연월일의 정보
   int yoil=today.getDayOfWeek().getValue(); //1일의 요일
   
   if(yoil==7)
	     yoil=0; // 일요일의 경우 이전소스가 대부분 일요일이 0이라서 
   double chong=today.lengthOfMonth(); // 월의 총 일수
   int ju=(int)Math.ceil((chong+yoil)/7);
                    // 올림(X.xxxx) => X정수보다 1큰 정수로
   int max_day=(int)chong;
   
   //double a=100; // double과 int로 바꾸어서 출력을 확인해보세요.
   //int b=6;
   //out.print(a/b);
%>
<table width=700 border=1 cellspacing=0>
<tr align=center>
  <td>일</td>
  <td>월</td>
  <td>화</td>
  <td>수</td>
  <td>목</td>
  <td>금</td>
  <td>토</td>
</tr>
<%
int day=1;
 for(int i=1;i<=5;i++) // i의 값이 행의 값과 일치
 {
%>
 <tr align=center> <!-- 1주 -->
 <%
 for(int j=0;j<7;j++)
 {
	 if((yoil>j && i==1) || max_day < day)
	 {//앞쪽빈칸                         //뒤쪽빈칸
 %>
  <td> &nbsp; </td> <!--  빈칸을 출력하는 부분 -->
  <%
  }
	 else
	 {
  %>
  <td><%=day %></td>
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