<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Main</title>
</head>
<script>

var HttpXmlObj = function(){
	this.ajax = {};
    //해당브라우져가 익스플로러 7.0 이상이거나 파이어폭스, 크롭 등일경우
	if(window.XMLHttpRequest){
		this.ajax = new XMLHttpRequest();
 	}else if(window.ActiveXObject){
  		//해당 브라우져가 익스플로러 6.0 이하일경우
  		this.ajax = new ActiveXObject("Microsoft.XMLHTTP");
 	}
	//해당 브라우져가 듣보잡일경우.. 어떤 브라우져 인진 나도 모름.
	alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
}
var ajaxObj = new HttpXmlObj();
alert(ajaxObj.ajax);

var Object = function(){
	this.a = 3;
	this.b = 4;
	//this라고 붙여야지만 멤버변수가 된다. 
	
	function test(){
		alert(1);
	}
	this.test1 = function(){
		alert(2);
	}
	//내부적으로 쓰려면 선언안해주고 쓰면된다. 

}
var obj = new Object();
/*
alert(obj.a);
alert(obj.c);

 
 obj.test1();
 obj.test();
 */
 
function movePage(code){	
	var op = document.getElementById("move_code").value;
	if(code != undefined){
		op = code;
	}
	var str = "";
	if(op=="help"){
		str += "<table border='1'>";
		str += "<tr align='center'>";
		str += "<td>";
		str += "이동 코드"
		str += "</td>";
		str += "<td>";
		str += "이동 화면"
		str += "</td>";
		str += "<td>";
		str += "이동 버튼"
		str += "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td>";
		str += "1"
		str += "</td>";
		str += "<td>";
		str += "메인 화면"
		str += "</td>";
		str += "<td>";
		str += "<input type='button' value='이동하기' onclick='movePage(1)'/>"
		str += "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td>";
		str += "2"
		str += "</td>";
		str += "<td>";
		str += "게시판 화면"
		str += "</td>";
		str += "<td>";
		str += "<input type='button' value='이동하기' onclick='movePage(2)'/>"
		str += "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td>";
		str += "3"
		str += "</td>";
		str += "<td>";
		str += "로그인 화면"
		str += "</td>";
		str += "<td>";
		str += "<input type='button' value='이동하기' onclick='movePage(3)'/>"
		str += "</td>";
		str += "</tr>";
		str += "</table>";
		
		document.getElementById("help_div").innerHTML = str;
	}else if(op=="1"){
		alert("메인 화면으로 이동 하겠습니다.");
		location.href="./main"
	}else if(op=="2"){
		alert("게시판 화면으로 이동 하겠습니다.");
		location.href="./board/list"
	}else if(op=="3"){
		alert("로그인 화면으로 이동 하겠습니다.");
		location.href="./user/login"
	}else{
		alert("이동코드를 잘못입력하셨습니다.");
	}
}
</script>
<body>

<p>메인 화면에 오신 것을 환영 합니다.</p>

<input type="text" name="move_code" id="move_code"/>
<input type="button" value="이동하기" onclick="movePage()"/>
<div id="help_div"></div>
</body>
</html>