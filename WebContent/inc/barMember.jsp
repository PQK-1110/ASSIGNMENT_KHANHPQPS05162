<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						
						<li><a href="<%= request.getContextPath()%>/Admin/index.htm"><i class="fa fa-dashboard fa-fw"></i>
								Bảng điều khiển</a></li>
						<li><a href="<%= request.getContextPath()%>/Admin/chuyentrang.htm?view=profile"><i class="fa fa-bar-chart-o fa-fw"></i>
								Hồ sơ</a>
							</li>
						<li><a href="<%= request.getContextPath()%>/Admin/chuyentrang.htm?view=top10"><i class="fa fa-table fa-fw"></i>
								Bảng xếp hạng</a></li>	
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								Thay đổi mật khẩu</a></li>
						
						
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->