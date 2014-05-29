<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
</head>

<body class="home">
     	<%@include file="base.jsp" %>
        <div id="mycarousel" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		      <div class="item active">
		      <img src="../img/bg1.jpg" alt="">
		      <div class="carousel-caption">
			    <h3>投票系统</h3>
			    <p>wellcome</p>
			  </div>
		      </div> 
		      <div class="item">
		      <img src="../img/bg2.jpg" alt="">
		      <div class="carousel-caption">
			    <h3>投票系统</h3>
			    <p>wellcome</p>
			  </div>
		      </div> 
		      <div class="item">
		      <img src="../img/bg3.jpg" alt="">
		      <div class="carousel-caption">
			    <h3>投票系统</h3>
			    <p>wellcome</p>
			  </div>
		      </div> 
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#mycarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left">&lsaquo;</span>
		  </a>
		  <a class="right carousel-control" href="#mycarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right">&rsaquo;</span>
		  </a>
		</div>
</body>
</html>
