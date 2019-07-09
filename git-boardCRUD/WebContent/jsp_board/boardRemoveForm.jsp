<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<title>BOARD REMOVE FORM</title>
</head>
<body>
<%
    // boardNo���� �Ѿ���� ������ boardList.jsp�� �̵�
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
%>
	<div class="container">
        <form action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post">
            <!-- boardPw�� �Բ� boardNo���� ���ܼ�(hidden������) �ѱ� -->
            <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/><br>
            <h4>��й�ȣȮ�� :</h4><br>
            <input name="boardPw" type="password" class="form-control" placeholder="������ ���� ��й�ȣ�� �Է����ּ���."><br>
            <div>
                <input type="submit" value="����" class="btn btn-primary"/>
                <input type="reset" value="�ʱ�ȭ" class="btn btn-primary"/>
                <a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?" class="btn btn-primary">���</a>
            </div>
     
        </form>
   </div>
<%
    }
%>
</body>
</html>


