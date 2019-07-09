<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<div class="container">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
<%
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        System.out.println("boardNo :"+boardNo);
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
        String dbUser = "root";
        String dbPw = "java0000";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String sql = "SELECT board_title, board_content, board_user, board_date FROM board WHERE board_no=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
%>	
                <div class="p-2 bg-active"><h4>board_no</h4></div>
                <div class="p-2 bg-light"><h6><%=boardNo%></h6></div>
                <div class="p-2 bg-active"><h4>board_title</h4></div>
                <div class="p-2 bg-light"><h6><%=resultSet.getString("board_title")%></h6></div>
                <div class="p-2 bg-active"><h4>board_content</h4></div>
                <div class="p-2 bg-light"><h6><%=resultSet.getString("board_content")%></h6></div>
                <div class="p-2 bg-active"><h4>board_user</h4></div>
                <div class="p-2 bg-light"><h6><%=resultSet.getString("board_user")%></h6></div>
                <div class="p-2 bg-active"><h4>board_date</h4></div>
                <div class="p-2 bg-light"><h6><%=resultSet.getString("board_date")%></h6></div>
                <div>
                    <a href="<%=request.getContextPath()%>/jsp_board/boardModifyForm.jsp?boardNo=<%=boardNo%>" class="btn btn-primary">수정</a>
                    <a href="<%=request.getContextPath()%>/jsp_board/boardRemoveForm.jsp?boardNo=<%=boardNo%>" class="btn btn-primary">삭제</a>
                    <a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?" class="btn btn-primary">취소</a>
                </div>
            
</div>                
<%          }
        } catch(Exception e) {
            e.printStackTrace();
            out.println("BOARD VIEW ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
    }
%>
</body>
</html>


