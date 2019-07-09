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
<title>BOARD LIST</title>
</head>
<body>
<h1>BOARD LIST</h1>
<%
    // boardList.jsp���������� currentPage��� �Ű������� �Ѿ�;� �ϴµ�
    // �Ű������� �� �Ѿ���� ��� currentPage�� 1�� ���Եȴ�.
    int currentPage = 1;
    if(request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    System.out.println("currentPage : "+currentPage); 
    // ��ü �Խñ��� ���� ���ϴ� �ڵ�
    int totalRowCount = 0; 
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
    String dbUser = "root";
    String dbPw = "java0000";
    Connection connection = null;
    PreparedStatement totalStatement = null;
    PreparedStatement listStatement = null;
    ResultSet totalResultSet = null;
    ResultSet listResultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
        
        String totalSql = "SELECT COUNT(*) FROM board"; // board���̺��� ��ü���� ���� ��ȯ
        totalStatement = connection.prepareStatement(totalSql);
        totalResultSet = totalStatement.executeQuery();
        if(totalResultSet.next()) {
            totalRowCount = totalResultSet.getInt(1);
        }
%>
    <div class="d-flex text-white"><h6 class="p-2 bg-primary">�Խñ� ��� : <%=totalRowCount%>��</h6></div>
<%    
    int pagePerRow = 10; // �������� ������ ���� ����� 10���� ����
    String listSql = "SELECT board_no, board_title, board_user, board_date FROM board ORDER BY board_no DESC LIMIT ?, ?";
    listStatement = connection.prepareStatement(listSql);
    listStatement.setInt(1, (currentPage-1)*pagePerRow); // ������������ 1�������� 0�����, 2�������� 10�����, 3�������� 20�����...
    listStatement.setInt(2, pagePerRow); 
    listResultSet = listStatement.executeQuery();
%>
	<div class="container">
    <table class="table">
        <thead>
            <tr>
                <th>boardTitle</th>
                <th>boardUser</th>
                <th>boardDate</th>
            </tr>
        </thead>
 		
        <tbody>
<%
            while(listResultSet.next()) {
%>	
                <tr class="table-light">
                    <td><a href="<%=request.getContextPath()%>/jsp_board/boardView.jsp?boardNo=<%=listResultSet.getInt("board_no")%>"><%=listResultSet.getString("board_title")%></a></td>
                    <td><%=listResultSet.getString("board_user")%></td>
                    <td><%=listResultSet.getString("board_date")%></td>
                </tr>
<%        
            }
%>
        </tbody>
        
    </table>
    <a href="<%=request.getContextPath()%>/jsp_board/boardAddForm.jsp" class="btn btn-primary">�Խñ� �Է�</a><br><br>
    
   
<%
    // ������ �������� ��ü���Ǽ��� pagePerRow�� ���������� ������ �������� ���� ������ ������ 
    // ex) ��ü���� 50�� / 10���� -> ������ �������� 5������
    // ������ �������� ������
    // ex) ��ü���� 51�� / 10���� -> ������ �������� 6������
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount % pagePerRow != 0) {
        lastPage++;
    }
%>
    
<%
        if(currentPage>1) { // ���� �������� 1���������� ũ�� ���������� ��ũ�� �߰�
%>
            <a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-light">����</a>
<%
        }
        if(currentPage < lastPage) { // ���� �������� ������ ���������� ������ ���������� ��ũ�� �߰�
%>
            <a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-light">����</a>
<%
        }
%>
    
<%
    } catch(Exception e) {
        e.printStackTrace();
        out.print("�Խ��� ��� �������� ����!");
    } finally {
        try {totalResultSet.close();} catch(Exception e){}
        try {listResultSet.close();} catch(Exception e){}
        try {totalStatement.close();} catch(Exception e){}
        try {listStatement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
%>
</div>
</body>
</html>


