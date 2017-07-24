<%@ include file="/WEB-INF/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>
var data={
	    rows:[
	        { id:1, data: ["2","red1", "red", "33","asdf","asdf"]},
	        { id:2, data: ["2","red1", "red", "33","asdf","asdf"]}
	    ]
	};
	var grid; 
	dhtmlxEvent(window,"load",function(){
	    var layout = new dhtmlXLayoutObject(document.body, "3L");
	    layout.cells("a").setWidth(270);        //sets the width of the 'form' cell  
	    layout.cells("a").setText("DataBase Connections");//sets the form's header  
	    layout.cells("b").hideHeader();      //hides the header of the 'chart' cell  
	    layout.cells("c").setText("Result");     //hides the header of the 'grid' cell  
	    grid = layout.cells("c").attachGrid();
	    grid.setImagePath(imgPath);       //sets the path to the source images
	    grid.setHeader("userid, username, age, address",null
	    		,["text-align:center;","text-align:center;","text-align:center;","text-align:center","text-align:center"]);              //sets the columns' headers
	    grid.setColTypes("ed,ed,ed,ed,ed");                 //sets the types of columns
	    grid.setInitWidths("100,150,230,230,*");   //sets the initial widths of columns
	    grid.setColAlign("center,center,center,center,center");  //sets the x alignment
		grid.setColSorting("str,str,str,str,str");
	    grid.init();
	    grid.parse(data, "json");

	});
</script>
<style>
    html, body {
        width: 100%;      /*provides the correct work of a full-screen layout*/ 
        height: 100%;     /*provides the correct work of a full-screen layout*/
        overflow: hidden; /*hides the default body's space*/
        margin: 0px;      /*hides the body's scrolls*/
    }
</style>
<body>
</body>
</html>