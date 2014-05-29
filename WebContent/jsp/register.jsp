<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.TransCodeTool" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<script type="text/javascript">
	var xmlHttp;
	var flagName = true, flagPass = true, flagComfirm = true;
	function createXMLHttp() {
		if(window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function checkUserName(userName) {
		if(userName == null || userName == "") {
			document.getElementById("nameError").innerHTML = "用户名不能为空";
		}else {
			createXMLHttp();
			xmlHttp.open("post", "CheckUserName?name=" + userName);
			xmlHttp.onreadystatechange = checkUserNameCallback ;
			xmlHttp.send(null);
			document.getElementById("nameError").innerHTML = "正在验证....";
		}
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
	function checkPass(pass) {
		if(pass == null || pass == "") {
			document.getElementById("passError").innerHTML = "密码不能为空";
			flagPass = false;
		}else if(pass.length < 6 && pass.length > 18) {
			document.getElementById("passError").innerHTML = "密码为6到18个字符";
			flagPass = false;
		}else {
			flagPass = true;
		}		
	}
	function checkComfirm(pass) {
		if(document.getElementById("pass").value != pass) {
			document.getElementById("comfirmError").innerHTML = "密码不一致";
			flagComfirm = false;
		}else {
			flagComfirm = true;
		}
	}
	function checkForm() {
		return flagName && flagPass && flagComfirm;
	}
</script>
</head>
<body class="home">
    <%@include file="base.jsp" %>
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="order_in_add.jsp">用户注册</a>
        </li>
    </ul>
	<form class="form-horizontal" action="RegisterServlet" method="post" onsubmit="return checkForm()">
            <div class="control-group">
                <label class="control-label" for="name">用户名：</label>
                <div class="controls">
                    <input type="text" id="name" name="name" onblur="checkUserName(this.value)">
                    <span class="text-error" id="nameError"></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="pass">密码：</label>
                <div class="controls">
                <input type="password" id="pass" name="pass" onblur="checkPass(this.value)">
                <span class="text-error" id="passError">
				<% if (request.getAttribute("passError")!=null)  { %>
                <%=request.getAttribute("passError") %>
                <% } %>
				</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="comfirm">密码：</label>
                <div class="controls">
                <input type="password" id="comfirm" name="comfirm" onblur="checkComfirm(this.value)">
                <span class="text-error" id="comfirmError">
                <% if (request.getAttribute("comfirmError")!=null)  { %>
                <%=request.getAttribute("comfirmError") %>
                <% } %>
                </span>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                <button type="submit" class="btn btn-primary">注册</button>
                </div>
            </div>
            <span class="text-error">
                <% if (request.getAttribute("registerError")!=null)  { %>
                <%=request.getAttribute("registerError") %>
                <% } %>
			</span>
        </form>
    
</body>
</html>
