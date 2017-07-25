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
var bottomGrid, topGrid; 
var data={
	    rows:[
	        { id:1, data: ["2","red1", "red", "33","asdf","asdf"]},
	        { id:2, data: ["2","red1", "red", "33","asdf","asdf"]}
	    ]
	};

	function reload(id){
		if(id=="load"){
			var au = new AjaxUtil("/user/userlistaction","it_mode");
			au.setCallbackSuccess(returnList);
			au.send();
		}
	}
	
	function returnList(list){
		var datas = list.data;
    	var strs = "<?xml version='1.0' encoding='utf-8'?>";
		strs += '<rows>';
    	for(i=0; i<datas.length;i++){
    		strs += "<row id='r" + (i+1) + "'>";
    		strs += '<cell>' + datas[i].userid +'</cell>';
    		strs += '<cell>' + datas[i].username +'</cell>';
    		strs += '<cell>' + datas[i].age +'</cell>';
    		strs += '<cell>' + datas[i].admin +'</cell>';
    		strs += '<cell>' + datas[i].boardadmin +'</cell>';
    		strs += "</row>";
    	}	
    	strs += "</rows>";
		bottomGrid.clearAll();
		bottomGrid.parse(strs,"xml");
	}
	
	dhtmlxEvent(window,"load",function(){
	    var layout = new dhtmlXLayoutObject(document.body, "3L");
	    layout.cells("a").setWidth(270);        //sets the width of the 'form' cell  
	    layout.cells("a").setText("DataBase Connections");//sets the form's header  
	    layout.cells("b").hideHeader();      //hides the header of the 'chart' cell  
	    layout.cells("c").setText("Result");     //hides the header of the 'grid' cell  
	    var myTabbar = layout.cells("b").attachTabbar(); 
	    myTabbar.addTab("a1", "Tab 1-1", null, null, true);
	    myTabbar.addTab("a2", "Tab 1-2");
	    topGrid = layout.cells("b").attachGrid();
	    topGrid.setImagePath(imgPath);
	    topGrid.setHeader("userid, username, age, address",null
	    		,["text-align:center;","text-align:center;","text-align:center;","text-align:center","text-align:center"]);   
	    topGrid.setColTypes("ed,ed,ed,ed,ed");                 //sets the types of columns
	    topGrid.setInitWidths("100,150,230,230,*");   //sets the initial widths of columns
	    topGrid.setColAlign("center,center,center,center,center");  //sets the x alignment
	    topGrid.setColSorting("str,str,str,str,str");
	    topGrid.init();
	    topGrid.parse(data, "json");
	    
	    var cToolBar = layout.cells("c").attachToolbar();
	    cToolBar.addButton("load","right","reLoad");
	    cToolBar.attachEvent("onClick", reload);
	    
	    bottomGrid = layout.cells("c").attachGrid();
	    bottomGrid.setImagePath(imgPath);       //sets the path to the source images
	    bottomGrid.setHeader("userid, username, age, admin, boardadmin",null
	    		,["text-align:center;","text-align:center;","text-align:center;","text-align:center","text-align:center"]);              //sets the columns' headers
	    bottomGrid.setColTypes("ed,ed,ed,ed,ed");                 //sets the types of columns
	    bottomGrid.setInitWidths("100,150,230,230,*");   //sets the initial widths of columns
	    bottomGrid.setColAlign("center,center,center,center,center");  //sets the x alignment
	    bottomGrid.setColSorting("str,str,str,str,str");
	    bottomGrid.init();
	    //bottomGrid.parse(data, "json");

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
<input type="hidden" name="mode" id="mode" value="list"/>
<body>
</body>
</html>