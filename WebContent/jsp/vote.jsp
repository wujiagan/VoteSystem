<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<link href="../jquery.tzCheckbox/jquery.tzCheckbox.css" rel="stylesheet"/>
<script src="../jquery.tzCheckbox/jquery.tzCheckbox.js"></script>
<script src="../js/script.js"></script>
<script type="text/javascript">
</script>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<body class="home">
    <%@include file="base.jsp" %>

    <ul class="nav nav-tabs">
        <li class="active">
            <h3>投票</h3>
        </li>
    </ul>
    <% 
    	Vote vote = (Vote)request.getAttribute("vote"); 
    	if (vote != null) {
    %>
    <div id="page">
	<form class="form-horizontal" action="UpdateVote" method="post" onsubmit="return checkForm()">
	  <h1><%=vote.getTheme() %></h1>
	  <ul>
		<% for(Item item: vote.getSelectItems()) { %>
		<li><label for="<%=item.getId() %>"><%=item.getText() %></label><input type="checkbox" id="<%=item.getId() %>" name="item" data-on="不投" data-off="投票" value="<%=item.getId() %>"/></li>
		<% } %>
	  </ul>
	  <input type="hidden" name="themeId" value="<%=vote.getId()%>">
	<button type="submit" class="btn btn-primary">确定</button>
	</form>
	</div>
	<% } %>
</body>
</html>