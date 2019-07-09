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
<title>BOARD ADD</title>
</head>
<body>
<div class="container">
<h1>BOARD ADD</h1>
<form action="<%=request.getContextPath()%>/jsp_board/boardAddAction.jsp" method="post">
    <div><h5>boardPw : </h5></div>
    <div><input name="boardPw" id="boardPw" type="password"/></div>
    <div><h5>boardTitle : </h5></div>
    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
    <div><h5>boardContent : </h5></div>
    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
    <div><h5>boardName : </h5></div>
    <div><input name="boardUser" id="boardUser" type="text"/></div><br>
    <div>
        <input type="submit" value="글입력" class="btn btn-primary"/>
        <input type="reset" value="초기화" class="btn btn-primary"/>
        <a href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?" class="btn btn-primary">취소</a>
    </div>
</div>
</form>
</body>
</html>


