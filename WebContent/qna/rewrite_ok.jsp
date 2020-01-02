<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>      
 
<%
   // rewrite_ok.jsp => 답글 등록하기
   // DB연결 => Connection(연결), Statement(쿼리실행)
   String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
   String bb="root";
   String cc="1234";
   Connection conn = DriverManager.getConnection(aa,bb,cc);
   Statement stmt=conn.createStatement();

   // request되는 값의 한글코드처리
   request.setCharacterEncoding("utf-8");
   
   // 입력할 값을 write.jsp에서 가져오기 => request.getParameter()
   // 변수에 저장 => 계산을 하지 않는다면 String에 넣어도 된다.
   // 숫자계산이 있을경우는 숫자로 변형후에 사용해야된다..
   String title=request.getParameter("title");
   String content=request.getParameter("content");
   String name=request.getParameter("name");
   String pwd=request.getParameter("pwd");
   String ref=request.getParameter("ref");
   String depth=Integer.parseInt(request.getParameter("depth"))+1+"";
   String seq=Integer.parseInt(request.getParameter("seq"))+1+"";
   String Page=request.getParameter("page");
   //String seq=temp+""; // sql 쿼리에 들어갈 값
   
   // 지금 들어갈 레코드의 seq보다 크거나 같은 레코드의 seq값을 전부 +1
   String sql="update qna set seq=seq+1 where seq>="+seq+" and ref="+ref;
   stmt.executeUpdate(sql); // update가 수행되어 seq값이 바뀐다..
   
   // 실행할 쿼리를 생성
   // ex) insert into 테이블명(필드명,필드명) values('값',값);
   sql="insert into qna(title,content,name,pwd,ref,depth,seq,writeday) ";
   sql=sql+" values(?,?,?,?,?,?,?,now())";
   // board의 write_ok 보다 3개의 필드가 추가
   
   
   // ref, depth, seq
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,title);
   pstmt.setString(2,content);
   pstmt.setString(3,name);
   pstmt.setString(4,pwd);
   pstmt.setString(5,ref);  // ref => 질문글의 ref가져온다.
   pstmt.setString(6,depth);  // depth => 질문글 +1
   pstmt.setString(7,seq);  // seq => 질문글 +1
   
   // 쿼리를 실행
   pstmt.executeUpdate();
   
   // Connection,Statement 객체의 해제
   stmt.close();
   pstmt.close();
   conn.close();
   // list.jsp로 이동
   // response.sendRedirect("list.jsp"); // 문서이동  1번을 사용
%>    
<script>
  location="list.jsp?page=<%=Page%>";
</script>