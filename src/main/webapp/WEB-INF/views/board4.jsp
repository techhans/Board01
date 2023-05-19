<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>turtlecoding</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    
  <style>

  
  /*
* {
    border : 0;
    padding : 0;
}

ul {
    border:  1px solid rgb(235,236,239);
    border-bottom : 0;
}

li {
    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
}
*/
  
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }

    .container {
      width : 50%;
      margin : auto;
    }

    .writing-header {
      position: relative;
      margin: 20px 0 0 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #323232;
    }

    input {
      width: 100%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      background: #f8f8f8;
      outline-color: #e6e6e6;
    }

    textarea {
      width: 100%;
      background: #f8f8f8;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }

    .frm {
      width:100%;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }

    .btn:hover {
      text-decoration: underline;
    }


#commentList {
    width : auto;
    margin : auto;
    padding : 50px 50px 50px 50px;
}

#commentList2 {
/*
    width : 100%;  
    margin : auto;  
    border:  1px solid rgb(235,236,239);


    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
*/ 
    width : 100%;  
    margin : auto; 
	padding : 18px 18px 118px 18px;
	
	list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
}

.comment-content {
    overflow-wrap: break-word;
}

.comment-bottom {
    font-size:9pt;
    color : rgb(97,97,97);
    padding: 8px 0 8px 0;
}

.comment-bottom > a {
    color : rgb(97,97,97);
    text-decoration: none;
    margin : 0 6px 0 0;
}

.comment-area {
    padding : 0 0 0 46px;

}

.comment-area4 {
    padding : 0 0 0 60px;
    background-color: #f9f9fa;

}

.commenter {
    font-size:12pt;
    font-weight:bold;
}

.commenter-writebox {
    padding : 15px 20px 20px 20px;
}

.comment-img {
    font-size:36px;
    position: absolute;
}

.comment-item {
    position:relative;
}

.comment-item2 {
    position:relative;
}

.up_date {
    margin : 0 8px 0 0;
}

#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
}

#comment-style{
	
}
/*
textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}
*/
#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 50px;
}

.btn {
    font-size:10pt;
    color : black;
    background-color: #eff0f2;
    text-decoration: none;
    padding : 9px 10px 9px 10px;
    border-radius: 5px;
    float : right;
}

#btn-write-comment, #btn-write-reply, #replyForm { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-reply { 
    background-color: #eff0f2;
    margin-right : 10px;
}

#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-modify { 
    margin-right : 10px;
}

#reply-writebox {
    display : none;
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#reply-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 50px;
}

#modify-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#modify-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 50px;
}

.reply-list{


}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
    
    
  </style>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">turtlecoding</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fa fa-search"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
  <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
  <form id="form" class="frm" action="" method="post">
    <input type="hidden" name="bno" value="${boardDto.bno}">
    <input type="hidden" name="writer" value="${boardDto.writer}">
 	<input type="hidden" name="sessionid" value="${sessionScope.id}">
 	<input type="hidden" name="replyCnt" value="${replyCnt}">  
    
    <input name="title" type="text" value="${boardDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.content}</textarea><br>

    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${mode ne 'new'}">
      <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
    </c:if>
    <c:if test="${boardDto.writer eq loginId}">
      <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
    <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
  </form>
  
  <!-- comment3.jsp start -->
    <div id="commentList">
        <div id="comment-writebox">
            <div class="commenter commenter-writebox">${sessionScope.id}</div>
            <div class="comment-writebox-content">
                <textarea name="comment-area" id="comment-area" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
            </div>
            <div id="comment-writebox-bottom">
                <div class="register-box">
                     <a href="#" class="btn" id="btn-write-comment">등록</a>
                   <!--  <button id="sendBtn" type="button">등록</button> -->
                </div>
            </div>
        </div>
    </div>
    <div id="commentList3">댓글 : ${replyCnt}</div>
    <div id="commentList2"></div>
    <div id="replyForm" style="display: none" >
 		 <input type="text" name="replyComment">
 		 <button id="wrtRepBtn" type="button">등록</button>
	</div>
    <div id="reply-writebox">
        <div class="commenter commenter-writebox">${sessionScope.id}</div>
        <div class="reply-writebox-content">
            <textarea name="comment-area2" id="comment-area2" cols="30" rows="5" placeholder="답글을 남겨보세요"></textarea>
        </div>
        <div id="reply-writebox-bottom">
            <div class="register-box">
                <a href="#" class="btn" id="btn-write-reply">등록</a>
                <a href="#" class="btn" id="btn-cancel-reply">취소</a> 
            </div>
        </div>
    </div>
    <div id="modalWin" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>
            <h2> | 댓글 수정</h2>
            <div id="modify-writebox">
                <div class="commenter commenter-writebox"></div>
                <div class="modify-writebox-content">
                    <textarea name="comment-area3" id="comment-area3" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
                </div>
                <div id="modify-writebox-bottom">
                    <div class="register-box">
                        <a href="#" class="btn" id="btn-write-modify">등록</a>
                    </div>
                </div>
            </div>
            </p>
        </div>
    </div>
    
    
    
    <!-- comment3.jsp end -->
  
</div>




<script>


  $(document).ready(function(){
    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }

      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }

    $("#writeNewBtn").on("click", function(){
      location.href="<c:url value='/board/write'/>";
    });

    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/write'/>");
      form.attr("method", "post");

      if(formCheck())
        form.submit();
    });

    $("#modifyBtn").on("click", function(){
      let form = $("#form");
      let isReadonly = $("input[name=title]").attr('readonly');

      // 1. 읽기 상태이면, 수정 상태로 변경
      if(isReadonly=='readonly') {
        $(".writing-header").html("게시판 수정");
        $("input[name=title]").attr('readonly', false);
        $("textarea").attr('readonly', false);
        $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
      }

      // 2. 수정 상태이면, 수정된 내용을 서버로 전송
      form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });

    $("#removeBtn").on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;

      let form = $("#form");
      form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
      form.attr("method", "post");
      form.submit();
    });

    $("#listBtn").on("click", function(){
      location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
    });
    
//////////////////////////////////////////////comment3.jsp end
	let bno = $('input[name=bno]').val(); 
    let id = $('input[name=writer]').val(); 
	let sessionid = $('input[name=sessionid]').val();
	
//    alert(bno);
//    alert(id);
    
	 // 댓글목록보기
	   var showList = function(bno){
	     $.ajax({
	       type:'GET',  //요청 메서드
	       url:'/my/comments?bno='+bno,                // 요청 URI
	       // header: {"content-type":"application/json"},  //요청헤더          // 현재는 보낼데이터 없어 생략
	       // dataType: 'text',                             // 전송받을 데이터 타입  // 생략시 기본이 JSON
	       // data:JSON.stringify(person),                   // 서버로 전솔할 데이터
	       
	       success : function (data){
				$("#comment-area").val(""); 	
		    	
//		     	alert(data);
		        $("#commentList2").html(toHtml2(data)); // 서버로 응답이 도착하면 호출될 함수


	       },
	       error : function(){ alert("error")}
	     })
	     
	     
	   }
	   showList(bno);       
 
     let addZero = function(value=1){
         return value > 9 ? value : "0"+value;
     }

     let dateToString = function(ms=0) {
         let date = new Date(ms);

         let yyyy = date.getFullYear();
         let mm = addZero(date.getMonth() + 1);
         let dd = addZero(date.getDate());

         let HH = addZero(date.getHours());
         let MM = addZero(date.getMinutes());
         let ss = addZero(date.getSeconds());          

         return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;            
     }

//////////////////////////////////////////////comment3.jsp end
///////////// comment3.jsp start ////////////////////////////////////////////////////////////////////////
    
            //========================================================================================================
            // 댓글 등록
            $("#btn-write-comment").click(function (e) {
//   			  $("#sendBtn").click(function () {
                //let comment = $("input[name=comment]").val();
                let comment = $("textarea[name=comment-area]").val();

                if (comment.trim() == '') {
                  alert("댓글을 입력해주세요.");
                  $("textarea[name=comment-area]").focus();
                  return;
                }

                $.ajax({
                  type: 'POST',       // 요청 메서드
                  url: '/my/comments?bno=' + bno,  // 요청 URI.    ex. comments?bno=1000
                  headers: {"content-type": "application/json"}, // 요청 헤더
                  data: JSON.stringify({bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                  success: function (result) {
                    alert(result);
                    showList(bno);
                  },
                  error: function () {
                    alert("error")
                  } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
			      e.preventDefault();   
              });
              
            //========================================================================================================


              // 댓글삭제버튼
              // $(".delBTN").click(function(){  // 이렇게 걸면안됨. 비동기에 들어있는 버튼이라, 클릭이벤트 발생불가.
              $("#commentList2").on("click", ".delBtn", function (e) {  // commentList클래스의 delBtn에 click이벤트를 넣어줌
                // alert("delBTN clicked")
		        //let cno = $("#reply-writebox").closest(".comment-area-zzz").attr("data-cno");
		        //let bno = $("#reply-writebox").closest(".comment-area-zzz").attr("data-bno");
		        //let pcno = $("#reply-writebox").closest(".comment-area-zzz").attr("data-pcno");
                //cno 얻기
                let cno = $(this).closest(".comment-area-org").attr("data-cno");
                let bno = $(this).closest(".comment-area-org").attr("data-bno");

                alert(cno);
                alert(bno);
                
                $.ajax({
                  type: 'DELETE',  //요청 메서드
                  url: '/my/comments/' + cno + '?bno=' + bno,                // 요청 URI
                  // header: {"content-type":"application/json"},  //요청헤더          // 현재는 보낼데이터 없어 생략
                  // dataType: 'text',                             // 전송받을 데이터 타입  // 생략시 기본이 JSON
                  // data:JSON.stringify(person),                   // 서버로 전솔할 데이터
                  success: function (result) {
                    alert(result);
                    showList(bno);
                  },
                  error: function () {
                    alert("error")
                  }
                }); // ajax
			      e.preventDefault();   
              });

          //========================================================================================================              
              
		//========================================================================================================
		// 댓글 수정하기			
//            $("a.btn-modify").click(function(e){
		    $("#commentList2").on("click", ".modBtn", function (e) {  // commentList2 클래스의 btn-modify에 click이벤트를 넣어줌	
                //alert('수정팝업');
		        //$(".modal").html(""); // clear html 
		        //$(".modal-content").html(""); // clear html 
		        //$("#modify-writebox").html(""); // clear html 
			     // $("#modalWin textarea").val(''); 
		         // $("textarea[name=comment-area3]").val('');
		        alert('댓글수정하기1');
                //$("#modalWin textarea").text('');
			    //$("#modalWin textarea").val(''); 
			     
			    e.preventDefault();   
	            let cno2 = $(this).closest(".comment-area-org").attr("data-cno");
	            let bno2 = $(this).closest(".comment-area-org").attr("data-bno");
	            let pcno2 = $(this).closest(".comment-area-org").attr("data-pcno");
			    alert(cno2);
			    alert(bno2); 
			    alert(pcno2); 
/*			      
            	let target = e.target;
                let cno = target.getAttribute("data-cno");
                let bno = target.getAttribute("data-bno");
                let pcno = target.getAttribute("data-pcno");
*/                
                let li = $("div[data-cno="+cno2+"]");
			    alert(li);  
                let commenter = $(".commenter", li).first().text();
                let comment = $(".comment-content", li).first().text();

			    alert(commenter);
			    alert(comment);              
                
//                $("#modalWin .commenter").text(commenter);
//                $("#modalWin textarea").text(comment);
				$("#modalWin .commenter").val(commenter);
//				$("#modalWin textarea").val(comment);
				$("textarea[name=comment-area3]").val(comment);
				
                $("#btn-write-modify").attr("data-cno", cno2);
                $("#btn-write-modify").attr("data-pcno", pcno2);
                $("#btn-write-modify").attr("data-bno", bno2);

                // 팝업창을 열고 내용을 보여준다.
                $("#modalWin").css("display","block");
                

            });
		
		// 댓글 수정하기
//		    $("#commentList2").on("click", ".modBtn", function () {  // commentList클래스의 delBtn에 click이벤트를 넣어줌
			$("#btn-write-modify").click(function (e) {
			    e.preventDefault();  

				
			  alert("btn-write-modify clicked");
		
		      
		      let comment = $("textarea[name=comment-area3]").val();
		      let cno = $("#btn-write-modify").attr("data-cno");
		      let bno = $("#btn-write-modify").attr("data-bno");
		      let pcno = $("#btn-write-modify").attr("data-pcno");
		      
		      let commenter = $("#modalWin .commenter").text();
		      //let commenter2 = $("#modalWin textarea").text();
		      let comment2 = $("#modalWin textarea").val();
		      
		      alert(comment);
		      alert(cno);
		      alert(bno);
		      alert(pcno);
		      alert(commenter);
		      alert(comment2);	
	
		      if (comment.trim() == '') {
		        alert("댓글을 입력해주세요.");
		        $("textarea[name=comment-area3]").focus()
		        //return;
		      }
		      $.ajax({
			        type: 'PATCH',       // 요청 메서드
			        url: '/my/comments/' + cno,                    // 요청 URI.    ex. comments/70
			        headers: {"content-type": "application/json"}, // 요청 헤더
			        data: JSON.stringify({cno: cno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
			        success: function (result) {
			          alert(result);
			          showList(bno);
					    //$("#modalWin textarea").val(''); 

			        },
			        error: function () {
			          alert("error")
			        } // 에러가 발생했을 때, 호출될 함수
			      }); // $.ajax()
				  //$("#modalWin textarea").val(""); 
		          //$("textarea[name=comment-area3]").val("");
			      
			      /*
		          $("#modalWin").css("display","none"); 
		          $("#modalWin").appendTo("body");       // replyForm을 원래위치로
		          
		          $("#modify-writebox").css("display","none");
		          $("textarea[name=comment-area3]").val(''); // 비우기?
		          $("#modify-writebox").appendTo("body");       // replyForm을 원래위치로
			      
		          
		          $("#modalWin").css("display","none");
			      $("#modalWin textarea").val(''); 
			      $("#modalWin textarea").appendTo("body");
		          */
		          /*
			      // clears modal
		            $('#modalWin').on('hidden.bs.modal', function (e) {
		                $(this)
		                  .find("input,textarea,select")
		                     .val('')
		                     .end()
		            })
		            */
		            ///////////////////////////////////////////////////////////////
		      //alert(commenter2);
/*
		      let cno4 = $("#btn-write-modify").closest(".comment-area-org").attr("data-cno");
		      let bno4 = $("#btn-write-modify").closest(".comment-area-org").attr("data-bno");
		      let pcno4 = $("#btn-write-modify").closest(".comment-area-org").attr("data-pcno");
		      alert(comment4);
		      alert(cno4);
		      alert(bno4);
		      alert(pcno4);
		      
		      
		      let comment3 = $("textarea[name=comment-area3]").val();
		      let cno3 = $("#reply-writebox").closest(".comment-area-org").attr("data-cno");
		      let bno3 = $("#reply-writebox").closest(".comment-area-org").attr("data-bno");
		      let pcno3 = $("#reply-writebox").closest(".comment-area-org").attr("data-pcno");
		      alert(comment3);
		      alert(cno3);
		      alert(bno3);
		      alert(pcno3);
	      
		      //cno 얻기
		      let cno = $(this).parent().attr("data-cno");
		      let comment = $('span.comment', $(this).parent()).text();
		
		      alert(cno);
		      alert(comment);  
		      
              let cno2 = $(this).closest(".comment-area-org").attr("data-cno");
              let bno2 = $(this).closest(".comment-area-org").attr("data-bno");
		      
		      alert(cno2);
		      alert(bno2);  
		      */	  

//		      let commenter = $('span.commenter', $(this).closest()).text();
//		      alert(commenter);  
		      
		      // 1. comment의 내용을 inpout에 뿌려주기
//		      $("input[name=comment]").val(comment);
		      // 2. cno 전달하기
//		      $("#modBtn").attr("data-cno", cno);
		    })
		
		    $("#modBtn2").click(function () {
		      let cno = $(this).attr("data-cno");
		      let comment = $("input[name=comment]").val();
		
		      if (comment.trim() == '') {
		        alert("댓글을 입력해주세요.");
		        $("input[name=commet]").focus()
		        return;
		      }
		      $.ajax({
		        type: 'PATCH',       // 요청 메서드
		        url: '/my/comments/' + cno,                    // 요청 URI.    ex. comments/70
		        headers: {"content-type": "application/json"}, // 요청 헤더
		        data: JSON.stringify({cno: cno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
		        success: function (result) {
		              alert('모달처리 후처리');
		              $("#modalWin textarea").val(''); 
			          $("textarea[name=comment-area3]").val('');
		        	alert(result);
//		          showList(bno);

		        },
		        error: function () {
		          alert("error")
		        } // 에러가 발생했을 때, 호출될 함수
		      }); // $.ajax()
		      
		      e.preventDefault();   
              //this.showList(bno);


		    });
		
		
		//========================================================================================================  
              
              
          //========================================================================================================
        	
        	    // 대댓글 버튼
		    // $(".delBTN").click(function(){  // 이렇게 걸면안됨. 비동기에 들어있는 버튼이라, 클릭이벤트 발생불가.
		    $("#commentList2").on("click", ".replyBtn", function (e) {  // commentList2 클래스의 delBtn에 click이벤트를 넣어줌
		      // 1. 답글을 입력할 replyForm폼을 이동
		      $("#reply-writebox").appendTo($(this).parent());
		      //  $("#replyForm").appendTo($(this).parent());

		      // 2.답글을 입력할 폼을 보여줌
		      $("#reply-writebox").css("display","block");
		      //  $("#replyForm").css("display","block");
		      e.preventDefault();   
		      
		      $("textarea[name=comment-area2]").focus();
		      $("#reply-writebox").focus();
		      $("#reply-writebox").blur();
		      
		    });  

		    $("#btn-write-reply").click(function (e) {
		        // pcno 구하기
		        //let comment = $("input[name=replyComment]").val();
		        let comment = $("textarea[name=comment-area2]").val();
		        let cno = $("#reply-writebox").closest(".comment-area-org").attr("data-cno");
		        let bno = $("#reply-writebox").closest(".comment-area-org").attr("data-bno");
		        let pcno = $("#reply-writebox").closest(".comment-area-org").attr("data-pcno");

                if (comment.trim() == '') {
                    alert("댓글을 입력해주세요.");
                    $("textarea[name=comment-area2]").focus();
                    return;
                } 
		        
		        alert(comment);
		        alert(cno);
		        alert(bno);
		        alert(pcno);
		        
		        
		        $.ajax({
		            type: 'POST',       // 요청 메서드
		            url: '/my/comments?bno=' + bno,  // 요청 URI.    ex. comments?bno=1000
		            headers: {"content-type": "application/json"}, // 요청 헤더
		            data: JSON.stringify({pcno:pcno ,bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
		            success: function (result) {
		              alert(result);
		              showList(bno);
		            },
		            error: function () {alert("error")
		            } // 에러가 발생했을 때, 호출될 함수
		          }); // $.ajax()

			      e.preventDefault();   
		          
		          $("#reply-writebox").css("display","none");
		          $("textarea[name=comment-area2]").val(''); // 비우기?
		          $("#reply-writebox").appendTo("body");       // replyForm을 원래위치로
		        
		        
		    }); 
            // 답글 등록
        	//$(".btn-write").click(function(e){
        	$("#btn-write-reply2").click(function(e){	
                alert('답글등록');
                
                let comment = $("textarea[name=comment-area2]").val();
                //let cno = $("#reply-writebox").parent().attr("data-cno");
               // let pcno = $("#reply-writebox").parent().attr("data-pcno");
                let pcno = $("#replyForm").parent().attr("data-pcno");

               // let cno2 = $("#reply-writebox").parent(".comment-item2").attr("data-cno");
               // let pcno2 = $("#reply-writebox").parent(".comment-item2").attr("data-pcno");         
                //let bno = $("#reply-writebox").parent(".comment-item2").attr("data-bno");
                
                
                alert(comment);
                //alert(cno);
                alert(pcno);
              //  alert(cno2);
              //  alert(pcno2);          
                //alert(bno);
                
                if (comment.trim() == '') {
                  alert("답글을 입력해주세요.");
                  $("textarea[name=comment-area2]").focus();
                  return;
                }                
               
                
        		let target = e.target;

                alert(target);        		
        		
                let cno = target.getAttribute("data-cno")
                let bno = target.getAttribute("data-bno")

                alert(cno);
                alert(bno);
                
                
                let repForm = $("#reply-writebox");
                repForm.appendTo($("div[data-cno="+cno+"]"));
                repForm.css("display", "block");
                repForm.attr("data-pcno", pcno);
                repForm.attr("data-bno",  bno);
            });
          
          
            
            $("#btn-cancel-reply").click(function(e){
                $("#reply-writebox").css("display", "none");
			    e.preventDefault();  
            });



            $("a.btn-delete").click(function(e){
                alert("delete");
            });

            $("#btn-write-modify").click(function(){
                // 1. 변경된 내용을 서버로 전송
                // 2. 모달 창을 닫는다. 
                $(".close").trigger("click");
            });

            $(".close").click(function(){
                $("#modalWin").css("display","none");
            });
    
    
            //========================================================================================================

            // 결과값을 배열로 받아서 forEach를통하여 <li> 태그 사용하여 출력에 필요한 함수
                let toHtml = function (comments) {
                  let tmp = "<ul>";

                  comments.forEach(function (comment) {
                    tmp += '<li data-cno=' + comment.cno
                    tmp += ' data-pcno=' + comment.pcno
                    tmp += ' data-bno=' + comment.bno + '>'
            if(comment.cno != comment.pcno){
                    tmp += 'ㄴ'
            }        
                    tmp += ' commenter= <span class="commenter">' + comment.commenter + '</span>'
                    tmp += ' comment= <span class="comment">' + comment.comment + '</span>'
                    tmp += ' up_date =' + comment.up_date
                    tmp += '<button class = "modBtn">수정</button>'
                    tmp += '<button class = "delBtn">삭제</button>'
            if(comment.cno != comment.pcno){
            }else{
                    tmp += '<button class = "replyBtn">답글</button>'
            }        
                    tmp += '</li>'
                  });
                  return tmp + "</ul>";

                };    
                
                //========================================================================================================

                // 결과값을 배열로 받아서 forEach를통하여 <li> 태그 사용하여 출력에 필요한 함수
                    let toHtml2 = function (comments) {
                      let a = '<div class="reply-list">';

                      comments.forEach(function(comment){
       	    		       //var dataList = data[i];
       	                   if(comment.cno != comment.pcno){
       	                       a += '<dd>' 
       	                       a += '<p>' 
       	 //               	   a += '<ul>' 
       	 //               	   a += '<li data-cno="1" data-bno="1070" data-pcno="100">'
       	         a += '<div class="comment-area-org" data-cno=' + comment.cno
                    a += ' data-pcno=' + comment.pcno
                    a += ' data-bno=' + comment.bno + '>'
//                    if(comment.cno != comment.pcno){
                        a += 'ㄴ'
//                }        
                    /*
                        a += ' commenter= <span class="commenter">' + comment.commenter + '</span>'
                        a += ' comment= <span class="comment">' + comment.comment + '</span>'
                        a += ' up_date =' + comment.up_date
                        a += '<button class = "modBtn">수정</button>'
                        a += '<button class = "delBtn">삭제</button>'
                        */
        //        if(comment.cno != comment.pcno){
        //        }else{
        //                tmp += '<button class = "replyBtn">답글</button>'
        //        }   
                    ///////////////////////////////////////////////////////////////////////
                    
       	   	                	   	   a += '<span class="comment-img">'
       	   		                	   a += '<i class="fa fa-user-circle" aria-hidden="true"></i>'
       	   		                	   a += '</span>'
       	   		                       a += '<div class="comment-area4">'
       	   			                       a += '<div class="commenter">'+ comment.commenter + '</div>'

       	   				                   a += '<div class="comment-content">'+comment.comment+'</div>'
       	   			                	   a += '<div class="comment-bottom">'
       	   			                	   a += '<span class="up_date">'+dateToString(comment.up_date)+'</span>'
       	   			                       //a += '<span class="up_date">'+ moment(dataList.up_date).format("YYYY-MM-DD HH:mm") +'</span>'
       	   							       //a += '<a href="#" class="btn-write"  data-cno="1" data-bno="1070" data-pcno="">답글쓰기</a>'

   if(comment.commenter == sessionid){            	   							       
       	   				                   a += '<a href="#" class="modBtn">수정</a>'
       	   								   a += '<a href="#" class="delBtn">삭제</a>'
   }
       	   								   a += '</div>'
       	   			
       	   			//////////////////////////////////////////////////////////////////
       	   	                         a += '</p>'
       	   	                          a += '</dd>' 
       	   			
       	   	                       a += '</div>'
       	   	                    //    a += '</ul>' 

       	                   }else{ 
//       	                	   a += '<ul>' 
       	                	   //a += '<li data-cno="1" data-bno="1070" data-pcno="100">' 
       	         a += '<div class="comment-area-org" data-cno=' + comment.cno
                    a += ' data-pcno=' + comment.pcno
                    a += ' data-bno=' + comment.bno + '>'	               
             //       if(comment.cno != comment.pcno){
             //           a += 'ㄴ'
             //   }        
                    /*
         	  	   a += '<span class="comment-img">'
               	   a += '<i class="fa fa-user-circle" aria-hidden="true"></i>'
               	   a += '</span>'
        //   	        a += '<div class="comment-area-z">'
                        a += ' commenter= <span class="commenter">' + comment.commenter + '</span>'
                        a += ' comment= <span class="comment">' + comment.comment + '</span>'
                        a += ' up_date =' + comment.up_date
                        a += '<button class = "modBtn">수정</button>'
                        a += '<button class = "delBtn">삭제</button>'
            //    if(comment.cno != comment.pcno){
            //    }else{
                        a += '<button class = "replyBtn">답글</button>'
           //     }   
                        */
                   //    	  a += '</div>'
             //       /////////////////////////////////////////////////////////////////////
                    
       		                	  	   a += '<span class="comment-img">'
       			                	   a += '<i class="fa fa-user-circle" aria-hidden="true"></i>'
       			                	   a += '</span>'
       			                       a += '<div class="comment-area">'
       				                       a += '<div class="commenter">'+ comment.commenter + '</div>'

       					                   a += '<div class="comment-content">'+comment.comment+'</div>'
       				                	   a += '<div class="comment-bottom">'
       				                	   a += '<span class="up_date">'+dateToString(comment.up_date)+'</span>'
       				                       //a += '<span class="up_date">'+ moment(dataList.up_date).format("YYYY-MM-DD HH:mm") +'</span>'
       								       a += '<a href="#" class="replyBtn"><b>답글쓰기</b></a>'
       								       //a += '<button class="replyBtn">답글쓰기</button> '
   if(comment.commenter == sessionid){             								       
       					                   a += '<a href="#" class="modBtn">수정</a>'
       									   a += '<a href="#" class="delBtn">삭제</a>'
   }
       									   a += '</div>'
       				                       
       									   
       									   
       		                       /////////////////////////////////////////////////////////////////////////////
       		                       a += '</div>'
       		           //            a += '</ul>' 
       	                	   
       	                   }

       	                	   
       	               //        a += '<hr /><div>'
       	                //       a += '<div><input type="hidden" id="commentId" name="commentId" value="' + dataList.cno + '">'
       	                //       a += '<span id="writer" style="font-weight: bold;">' + dataList.commenter + '</span></div>'
       		    		//   	    alert(dataList.cno);
       	                //        alert(a);
       		    		        //var Fri_list = dataList.cno;
       		    		        //alert(JSON.stringify(Fri_list));
       		    		     });
                      return a + "</div>";

                    };   
    

    
  });
</script>

</body>
</html>
