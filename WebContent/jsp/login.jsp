<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
</head>
<body class="home">
    <%@include file="base.jsp" %>

    <ul class="nav nav-tabs">
        <li class="active">
            <a href="order_in_add.jsp">用户登录</a>
        </li>
    </ul>
	<form class="form-horizontal" action="LoginSerlet" method="post">
            <div class="control-group">
                <label class="control-label" for="name">用户名：</label>
                <div class="controls">
                    <input type="text" id="name" name="name">
                    <span class="text-error">
					<% if (request.getAttribute("nameError")!=null)  { %>
	                <%=request.getAttribute("nameError") %>
	                <% } %>
					</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="pass">密码：</label>
                <div class="controls">
                <input type="password" id="pass" name="pass">
                <span class="text-error">
				<% if (request.getAttribute("passError")!=null)  { %>
                <%=request.getAttribute("passError") %>
                <% } %>
				</span>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                <button type="submit" class="btn btn-primary">登录</button>
                </div>
            </div>
        </form>
    
</body>
</html>