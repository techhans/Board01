<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<h2>Comment Test</h2>
comment : <input type="text" name="comment"><br>
<button id="sendBtn" type="button">등록</button>
<button id="modBtn" type="button">수정</button>
<h2>Data From Server :</h2>
<div id="commentList"></div>
<div id="replyForm" style="display: none" >
  <input type="text" name="replyComment">
  <button id="wrtRepBtn" type="button">등록</button>
</div>




<script>
  let bno = 120;

// 댓글목록보기
  let showList = function(bno){
    $.ajax({
      type:'GET',  //요청 메서드
      url:'/my/comments?bno='+bno,                // 요청 URI
      // header: {"content-type":"application/json"},  //요청헤더          // 현재는 보낼데이터 없어 생략
      // dataType: 'text',                             // 전송받을 데이터 타입  // 생략시 기본이 JSON
      // data:JSON.stringify(person),                   // 서버로 전솔할 데이터
      success : function (result){

        $("#commentList").html(toHtml(result)); // 서버로 응답이 도착하면 호출될 함수
      },
      error : function(){ alert("error")}
    })
  }
  showList(bno);   

// ajax 진행흐름
//  jsp에서 ajax으로 버튼눌러 요청 -->>  uri일치하는 컨트롤러가 받음   (jasckson 데이터바인드에 의해 자바객체로 변환되어서)    -->>   DB등록   -->>     ajax 성공시 출력




  // 댓글 등록
  $(document).ready(function() {
    showList(bno);

    $("#sendBtn").click(function () {

      let comment = $("input[name=comment]").val();

      if (comment.trim() == '') {
        alert("댓글을 입력해주세요.");
        $("input[name=commet]").focus()
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
    });

//========================================================================================================


// 댓글 수정하기
    $("#commentList").on("click", ".modBtn", function () {  // commentList클래스의 delBtn에 click이벤트를 넣어줌
      // alert("modBTN clicked");

      //cno 얻기
      let cno = $(this).parent().attr("data-cno");
      let comment = $('span.comment', $(this).parent()).text();

      // 1. comment의 내용을 inpout에 뿌려주기
      $("input[name=comment]").val(comment);
      // 2. cno 전달하기
      $("#modBtn").attr("data-cno", cno);
    })

    $("#modBtn").click(function () {
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
          alert(result);
          showList(bno);
        },
        error: function () {
          alert("error")
        } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    });


//========================================================================================================


    // 댓글삭제버튼
    // $(".delBTN").click(function(){  // 이렇게 걸면안됨. 비동기에 들어있는 버튼이라, 클릭이벤트 발생불가.
    $("#commentList").on("click", ".delBtn", function () {  // commentList클래스의 delBtn에 click이벤트를 넣어줌
      // alert("delBTN clicked")

      //cno 얻기
      let cno = $(this).parent().attr("data-cno");
      let bno = $(this).parent().attr("data-bno");

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

    });

//========================================================================================================
//========================================================================================================

    // <div id="replyForm">
    //   <input type="text" name="replyComment">
    //     <button id="wrtRepBtn" type="button">등록</button>
    // </div>


    // 대댓글 버튼
    // $(".delBTN").click(function(){  // 이렇게 걸면안됨. 비동기에 들어있는 버튼이라, 클릭이벤트 발생불가.
    $("#commentList").on("click", ".replyBtn", function () {  // commentList클래스의 delBtn에 click이벤트를 넣어줌
      // 1. 답글을 입력할 replyForm폼을 이동
      $("#replyForm").appendTo($(this).parent());

      // 2.답글을 입력할 폼을 보여줌
      $("#replyForm").css("display","block");
    });

    $("#wrtRepBtn").click(function () {
      // pcno 구하기
      let comment = $("input[name=replyComment]").val();
      let cno = $("#replyForm").parent().attr("data-cno");
      let bno = $("#replyForm").parent().attr("data-bno");
      let pcno = $("#replyForm").parent().attr("data-pcno");
      
      alert(comment);
      alert(cno);
      alert(bno);
      alert(pcno);
      
      if (comment.trim() == '') {
        alert("댓글을 입력해주세요.");
        $("input[name=replyComment]").focus();
        return;
      }

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

      $("#replyForm").css("display","none");
      $("input[name=replyComment]").val(''); // 비우기?
      $("#replyForm").appendTo("body");       // replyForm을 원래위치로
    });







  })
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
      return tmp + "</ui>";

    };



</script>
</body>
</html>