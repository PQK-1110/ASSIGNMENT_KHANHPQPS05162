<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page pageEncoding="utf-8"%>
<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		username = "";
	}
%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"
			href="<%=request.getContextPath()%>/Admin/index.htm"><img
			alt="logo" width="200" height="30"
			src="<%=request.getContextPath()%>/sources/img/logom.png"></a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">

		<!-- <li class="dropdown">
			<a class="dropdown-toggle"
			data-toggle="dropdown" href="?lang=en"><img width="40px" height="20px" alt="flagusa" src="<%=request.getContextPath()%>/sources/img/flagusa.jpg"></a>
		</li>
		<li class="dropdown">
			<a class="dropdown-toggle"
			data-toggle="dropdown" href="?lang=vi"><img width="40px" height="20px" alt="flagvi" src="<%=request.getContextPath()%>/sources/img/flagvi.jpg"></a>
		</li> -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-messages">
				<li><a href="#"> <span style="display: block;"> <strong>John
								Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
						</span>
					</span> <span style="display: block;">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Pellentesque eleifend.</span>
				</a></li>
				<li class="divider"></li>
				<li><a href="#"> <span style="display: block;"> <strong>John
								Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
						</span>
					</span> <span style="display: block;">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Pellentesque eleifend.</span>
				</a></li>
				<li class="divider"></li>
				<li><a href="#"> <span style="display: block;"> <strong>John
								Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
						</span>
					</span> <span style="display: block;">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Pellentesque eleifend.</span>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>Read
							All Messages</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-messages --></li>
		<!-- /.dropdown -->


		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><%=username%> <b class="caret"></b></a>
			<ul class="dropdown-menu dropdown-user">
				<li>
					<div class="navbar-content">
						<div class="row">
							<div class="col-md-5">
								<img
									src="<%=request.getContextPath()%><%=session.getAttribute("avatar")%>"
									alt="Alternate Text" class="img-responsive" />
								<p
									style="text-align: center; font-size: 85%; margin: 0 0 10px 0px;">
									<a href="#">Change</a>
								</p>
							</div>
							<div class="col-md-7">
								<span><%=username%></span>
								<p class="text-muted small">
									<%=session.getAttribute("email")%></p>
								<div class="divider"></div>
								<a
									href="<%=request.getContextPath()%>/Admin/chuyentrang.htm?view=profile"
									class="btn btn-primary btn-sm active">Xem hồ sơ</a>
							</div>
						</div>
					</div>
					<div class="navbar-footer">
						<div class="navbar-footer-content">
							<div class="row">
								<div class="col-md-6">
									<a href="#" class="btn btn-default btn-sm">Thay đổi mật
										khẩu</a>
								</div>
								<div class="col-md-6">
									<a href="<%=request.getContextPath()%>/Login/logout.htm"
										class="btn btn-default btn-sm pull-right">Đăng xuất</a>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul></li>


		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<%
		if (username.equals("admin")) {
	%>
	<%@include file="/inc/barAdmin.jsp"%>
	<%
		} else {
	%>
	<%@include file="/inc/barMember.jsp"%>
	<%
		}
	%>
</nav>