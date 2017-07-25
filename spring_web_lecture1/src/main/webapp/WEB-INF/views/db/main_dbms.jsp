<%@ include file="/WEB-INF/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
    html, body {
        width: 100%;      /*provides the correct work of a full-screen layout*/ 
        height: 100%;     /*provides the correct work of a full-screen layout*/
        overflow: hidden; /*hides the default body's space*/
        margin: 0px;      /*hides the body's scrolls*/
    }		
    div.controls {
			margin: 0px 10px;
			font-size: 14px;
			font-family: Tahoma;
			color: #404040;
			height: 80px;
		}
</style>
<script>
var bottomGrid, topGrid, dhxWins, w1,f1;
var data={
	    rows:[
	        { id:1, data: ["2","red1", "red", "33","asdf","asdf"]},
	        { id:2, data: ["2","red1", "red", "33","asdf","asdf"]}
	    ]
	};

	function clickEvent(id,name){
		if(id=="load"){
			var au = new AjaxUtil("/user/userlistaction","it_mode");
			au.setCallbackSuccess(returnList);
			au.send();
		}else if(id=="adddb"){
			w1.show();
			w1.getTopmostWindow();
		}else if(id=="submit"){ 
			var aud = new AjaxUtilDx("db/add",f1)
			aud.send();
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
		dhxWins = new dhtmlXWindows();
		w1 = dhxWins.createWindow("w1", 20, 30, 270, 300);
        var formData = [
			{type: "settings", position: "label-left", labelWidth: 100, inputWidth: 120},
			{type: "block", inputWidth: "auto", offsetTop: 12, list: [
				{type: "input", label: "DB URL", value: "jdbc:mysql://127.0.0.1:3307/study_jsp", name:"url"},
				{type: "input", label: "Driver Name", value: "com.mysql.jdbc.Driver", name:"dbms"},
				{type: "input", label: "DB Name", value: "mine", name:"dbname"},
				{type: "input", label: "User Name", value: "root", name:"id"},
				{type: "password", label: "Password", value: "rjqnrdl82", name:"pwd"},
				{type: "button", value: "커낵터신규생성", name:"submit",offsetLeft: 70, offsetTop: 14}
			]}
		];
		f1 = w1.attachForm(formData, true);
		f1.attachEvent("onButtonClick",clickEvent);
		w1.attachEvent("onClose",function(win){
			w1.hide();
		})
		w1.hide();
		w1.setText("Add DB Connector");
		
	    layout.cells("a").setWidth(270);        //sets the width of the 'form' cell  
	    var aToolBar = layout.cells("a").attachToolbar();
	    aToolBar.addButton("adddb",1,"Add Conector");
	    aToolBar.attachEvent("onClick", clickEvent);

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
	    cToolBar.attachEvent("onClick", clickEvent);
	    
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
<div id="winVP"></div>
<input type="hidden" name="mode" id="mode" value="list"/>
<body>
</body>
</html>