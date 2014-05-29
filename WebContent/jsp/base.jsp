<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var xmlHttp;
	var flagName = true, flagPass = true, flagComfirm = true, loginflag = false;
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
<% if(request.getAttribute("error") != null) {%>
	<div class="alert">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <strong>Warning!</strong> <%=request.getAttribute("error") %>
	</div>
<% } %>
<div class="navbar navbar-default navbar-static-top">
		<div class="navbar-inner">
			<a class="brand" href="home.jsp">投票系统</a>

			<ul class="nav">
				
				<li>
					<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">投票管理<b class="caret"></b></a>
				    <ul class="dropdown-menu">
					    <li>
					    <a href="GetAllVote">所有投票</a>
					    <% if(session.getAttribute("user") != null) {%>
                            <a href="vote_add.jsp">发起投票</a>
                            <a href="VoteManage">管理投票</a>
                        <% } %>
					    </li>
				    </ul>
				</li>
				
				<li>
					<form class="form-search" action="SearchVote" method="post">
			          <div class="input-append">
			            <input type="text" class="span2 search-query" id="keyword" name="keyword">
			            <button type="submit" class="btn">Search</button>
			          </div>
			        </form>
				</li>
			</ul>

             <div class="nav pull-right">
             	<ul class="nav">
             	<% if(session.getAttribute("user") != null) {%>
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"><%=session.getAttribute("user") %><b class="caret"></b></a>
				    <ul class="dropdown-menu">
					    <li>
                            <a href="LogoutServlet">退出</a>
					    </li>
				    </ul>
				</li>
				<% }else { %>
             	
             	<li>
		        <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#LoginModal">
				 <span class="glyphicon glyphicon-user"><i class="icon-user icon-white"></i>登录</span>
				</button>
				
				<!-- 登录 -->
				<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title" id="myModalLabel">登录</h4>
				      </div>
				      <div class="modal-body"> 
				      
				      <form class="form-horizontal" action="LoginSerlet" method="post">
				          
				            <div class="control-group">
				                <label class="control-label" for="loginName">用户名：</label>
				                <div class="controls">
				                    <input type="text" id="loginName" name="loginName" onclick="">
				                    <span class="text-error">
									</span>
				                </div>
				            </div>
				            <div class="control-group">
				                <label class="control-label" for="loginPass">密码：</label>
				                <div class="controls">
				                <input type="password" id="loginPass" name="loginPass">
				                <span class="text-error">
								</span>
				                </div>
				            </div>
					      	 <div class="control-group">
				                <div class="controls">
				                <button type="submit" class="btn btn-primary">登录</button>
				                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				                </div>
				            </div>
				      </form>
				      
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
				</li>
				
				
				<!-- 注册 -->
				<li>
				<button class="btn btn-lg" data-toggle="modal" data-target="#RegisterModal">
				 注册
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="RegisterModal" tabindex="-1" role="dialog" aria-labelledby="RegisterModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title" id="RegisterModalLabel">注册</h4>
				      </div>
				      <div class="modal-body">
				      
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
							</span>
			                </div>
			            </div>
			            
			            <div class="control-group">
			                <label class="control-label" for="comfirm">密码：</label>
			                <div class="controls">
			                <input type="password" id="comfirm" name="comfirm" onblur="checkComfirm(this.value)">
			                <span class="text-error" id="comfirmError">
			                </span>
			                </div>
			            </div>
			            
			            <div class="control-group">
			                <div class="controls">
			                <button type="submit" class="btn btn-primary">注册</button>
			                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                </div>
			            </div>
				      </form>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
		       	</li>
		       	<% } %>
		       	</ul> 
		     </div>
		     
		     
			
			
			
			
				</div>
			</div>

