<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">

			<li><a href="<%=request.getContextPath()%>/Admin/index.htm"><i
					class="fa fa-dashboard fa-fw"></i> Bảng điều khiển</a></li>
			<li><a
				href="<%=request.getContextPath()%>/Admin/chuyentrang.htm?view=depart"><i
					class="fa fa-bar-chart-o fa-fw"></i> Phòng ban</a></li>
			<li><a
				href="<%=request.getContextPath()%>/Admin/chuyentrang.htm?view=staff"><i
					class="fa fa-table fa-fw"></i> Nhân viên</a></li>
			<li><a
				href="<%=request.getContextPath()%>/Admin/chuyentrang.htm?view=recordstaff"><i
					class="fa fa-edit fa-fw"></i> Bảng thi đua nhân viên</a></li>

			<li><a
				href="<%=request.getContextPath()%>/Admin/chuyentrang.htm?view=top10"><i
					class="fa fa-dashboard fa-fw"></i> Bảng xếp hạng</a></li>

		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->