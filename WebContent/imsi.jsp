<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Date" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%
   Date today=new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
   String writeday= sdf.format(today); 
   
   out.print(writeday);
%> 