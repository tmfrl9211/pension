<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="../main/top.jsp" %>
 
   <!--  질문 글 쓰기 -->
<jsp:include page="comm_menu.jsp"></jsp:include>
  <!-- 이름, 제목, 내용, 조회수, 작성일, 나이, 성별 -->
 <div id=right> 
 <h3> 질문 하기</h3>
 <form method=post action=write_ok.jsp> 
   제목 <input type=text name=title size=50> <p>
   내용 <textarea cols=50 rows=6 name=content></textarea> <p>
   작성자 <input type=text name=name size=8> <p>
    비밀번호 <input type=password name=pwd> <p>
      <input type=submit value=글작성>
     </form>
 </div>
<%@ include file="../main/bottom.jsp" %>






