<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<% request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">

<script type="text/javascript">
	function addTheme(btn) {
		var theme = document.getElementById("theme").value;
		if(theme == null || theme == "") {
			document.getElementById("themeError").innerHTML = "主题不能为空";
		}else if(theme.length > 250) {
			document.getElementById("themeError").innerHTML = "主题太长";
		}else{
			document.getElementById("itemtitle").innerHTML = "请添加选择项目";
			addRow(btn);
		}
	}
	function addRow(btn) {
		btn.disabled = true;
		btn.className = "btn btn-success";
		var length = document.getElementById("itemtable").rows.length;
		var newTR = document.getElementById("itemtable").insertRow(length);
        var newTD = newTR.insertCell(0);
        newTD.innerHTML = "<div class='input-group'><input type='text' class='form-control' placeholder='选项' id = item" + length + " name = item" + length + ">"
        + "<button type='button' class='btn btn-primary' onclick='addRow(this)'>继续添加</button></div>";
	}
	
	function checkUserNameCallback() {
		if(xmlHttp.readyState == 4) {
			if(xmlHttp.status == 200) {
				var text = xmlHttp.responseText;
				if(text == "false") {
					flagName = false;
					document.getElementById("nameError").innerHTML = "该用户名已存在"
				}else {
					flagName = true;
					document.getElementById("nameError").innerHTML = "该用户名可以使用"
				}
			}
			
		}
	}
	
</script>
</head>
<body class="home">
    <%@include file="base.jsp" %>

    <ul class="nav nav-tabs">
        <li class="active">
            <h3>发起投票</h3>
        </li>
    </ul>
	<form class="form-horizontal" action="CreateVote" method="post">
            <div class="control-group">
                <label class="control-label" for="theme">主题名：</label>
                <div class="controls">
                    <input type="text" class="form-control" id="theme" name="theme" placeholder="主题">
                    <button type="button" class="btn btn-primary" onclick="addTheme(this)">添加选项</button>
                    <span class="text-error" id="themeError">
					<% if (request.getAttribute("themeError")!=null)  { %>
	                <%=request.getAttribute("themeError") %>
	                <% } %>
					</span>
                </div>
            </div>
            
            <div class="controls">
              	<h3><span class="label label-success" id="itemtitle" ></span></h3>
              	<table class="table table-striped" id="itemtable" name="itemtable">
				</table>
            </div>
            <div class="controls">
              	<button type="Submit" class="btn btn-success" onclick="">确定</button>
            </div>
        </form>
    
</body>
</html>