<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        * { box-sizing:border-box; }

        form {
            width:400px;
            height:600px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }

        .input-field {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        
        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }

        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }

        .title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }

        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        
        .sns-chk {
            margin-top : 5px; 
        }
    </style>
    <title>Register</title>
</head>
<body>
   <!-- form action="<c:url value="/register/save"/>" method="POST" onsubmit="return formCheck(this)"-->

    <div id="msg" class="msg"><h2>등록이 완료되었습니다.</h2></div>
	<div id="msg" class="msg"><label for="">아이디 : </label>${user.id}</div> 
	<div id="msg" class="msg"><label for="">비밀번호 : </label>${user.pwd}</div> 
	<div id="msg" class="msg"><label for="">이름 : </label>${user.name}</div> 
	<div id="msg" class="msg"><label for="">이메일 : </label>${user.email}</div> 
	<div id="msg" class="msg"><label for="">생년월일 : </label>${user.birth}</div> 
	<div id="msg" class="msg"><label for="">SNS : </label>${user.sns}</div> 
    <div id="msg" class="msg"><button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board/list"/>'"><i class="fa fa-pencil"></i>게시판</button></div>
 
</body>
</html>
