<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>      
<%
   // write_ok.jsp => 질문의 글을 등록하기
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
   // 사용자가 입력하지 않은값이지만 테이블에 저장할 데이터
 
   // ref의 값을 구하기 
   // ref는 그룹의 값을 나타낸다 => 새로운 그룹이 발생되면
   // 기존의 가장 높은 값에다 +1을 해서 부여한다..
   String sql="select max(ref) as num from qna";
   ResultSet rs=stmt.executeQuery(sql);
   rs.next();
   String ref=""+(rs.getInt("num")+1);
   // out.print(rs.getInt("num"));
   // null값을 getInt()로 부르면 0으로 된다.
   
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
   pstmt.setString(5,ref);  // ref
   pstmt.setString(6,"1");  // depth
   pstmt.setString(7,"1");  //seq
 
   
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
  location="list.jsp";
</script>