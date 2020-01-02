<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
session.invalidate(); // 세션변수 종료 -> top에서 else 실행

response.sendRedirect("../main/index.jsp");
%>