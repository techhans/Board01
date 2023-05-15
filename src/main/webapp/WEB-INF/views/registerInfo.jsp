<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>turtlecoding</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    	<style>
		* { box-sizing:border-box; }
		a { text-decoration: none; }
		form {
			width:400px;
			height:500px;
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
		input[type='text'], input[type='password'] {
			width: 300px;
			height: 40px;
			border : 1px solid rgb(89,117,196);
			border-radius:5px;
			padding: 0 10px;
			margin-bottom: 10px;
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
		#title {
			font-size : 50px;
			margin: 40px 0 30px 0;
		}
		#msg {
			height: 30px;
			text-align:center;
			font-size:16px;
			color:red;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
   <form:form modelAttribute="user">
    <div class="title">Register</div>
	<h1>id=${user.id}</h1>
	<h1>pwd=${user.pwd}</h1>
	<h1>name=${user.name}</h1>
	<h1>email=${user.email}</h1>
	<h1>birth=${user.birth}</h1>
	<h1>sns=${user.sns}</h1>
 	<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
   </form:form> 
	       
<script>
$(document).ready(function(){
    $("#listBtn").on("click", function(){
        location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
    });
});	

</script>
</body>
</html>
