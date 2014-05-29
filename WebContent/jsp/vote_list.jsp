<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*, java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<body class="home">
    <%@include file="base.jsp" %>

    <ul class="nav nav-tabs">
        <li class="active">
            <h3>所有投票</h3>
        </li>
    </ul>
	<div class="control-group">
	<div class="panel-group" id="accordion">
	
	  <div class="panel panel-default">
	  	<% for(Vote vote: (Set<Vote>)request.getAttribute("allVote")) { %>
	    <div class="panel-heading">
	      <h3 class="panel-title">
	        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#<%=vote.getId()%>">
	         <%=vote.getTheme() %>
	        </a>
	      </h3>
	    </div>
	    
	    <div id="<%=vote.getId()%>" class="panel-collapse collapse">
	      <div class="panel-body">
	      	<ul>
			<% for(Item item: vote.getSelectItems()) { %>
				<li>
				<h4><%=item.getText() %></h4>
				<div class="progress progress-success progress-striped">
				  <div class="bar" ID="<%=item.getId() %>" style="width: <%=(int)(item.getCount() * 100 / (vote.getTotal() == 0 ? 1: vote.getTotal())) %>%;"></div>
				  <span class="badge badge-warning"><%=item.getCount() %></span>
				</div>
				</li>
			<% } %>
			</ul>
			<h4>共<%=vote.getTotal() %>票</h4>
			<% if(vote.isStart()) { %>
	     	<a class="btn btn-primary btn-lg" role="button" href="Vote?themeId=<%=vote.getId()%>">我要投票</a>
	      	<% } %>
	      </div>
	    </div>
	    <% } %>
	  </div>
	 	
	</div>	
	</div>
	
</body>
</html>