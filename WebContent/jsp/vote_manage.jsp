<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*, java.util.*"  %>
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
            <h3>投票管理</h3>
        </li>
    </ul>
    <form class="form-horizontal" action="VoteManage" method="post" onsubmit="return checkForm()">
    <div id="page">
	  <ul>
	    <% 
	    	for(Vote vote: (Set<Vote>)request.getAttribute("allVote")) { 
	    		if(vote.isStart()) {
	    %>
		<li><label for="<%=vote.getId() %>"><%=vote.getTheme()%></label><input type="checkbox" id="<%=vote.getId() %>" name="themeId" data-on="关闭投票" data-off="开启投票" value="<%=vote.getId() %>" checked="checked"/></li>
		<% }else { %>
		<li><label for="<%=vote.getId() %>"><%=vote.getTheme()%></label><input type="checkbox" id="<%=vote.getId() %>" name="themeId" data-on="关闭投票" data-off="开启投票" value="<%=vote.getId() %>"/></li>
		<% }} %>
	  </ul>
	  <button type="submit" class="btn btn-primary">确定</button>
	</div>
	
	</form>
</body>
</html>