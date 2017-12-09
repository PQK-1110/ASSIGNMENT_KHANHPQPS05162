
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="col-lg-12">
	<h1 class="page-header">Thông Tin Phòng Ban</h1>
</div>
<!-- /.col-lg-12 -->
<div class="row">
	<p data-placement="top" data-toggle="tooltip" title="insert">
		<button data-toggle="modal" data-target="#insert"
			style="margin-left: 20px;" class="btn btn-primary btn-sm">Thêm</button>
	</p>
</div>
<div class="row">
	<div class="col-sm-12">

		<table id="dataTables-example"
			class="table table-striped table-bordered table-hover">

			<tr>
				<th>ID</th>
				<th>Phòng ban</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>

			<c:forEach var="dept" items="${depart}">
				<tr>

					<td>${dept.ID}</td>
					<td>${dept.name}</td>

					<td><c:set var="d" value="${dept.ID}"></c:set>
						<p data-placement="top" data-toggle="tooltip" title="Edit">
							<button class="btn btn-primary btn-sm" data-title="Edit"
								data-toggle="modal" data-target="#edit"
								onclick="dataEdit('${dept.ID}')">

								<span class="glyphicon glyphicon-pencil"></span>
							</button>
						</p></td>
					<td><p data-placement="top" data-toggle="tooltip"
							title="Delete">
							<button class="btn btn-danger btn-sm" data-title="Delete"
								data-toggle="modal" data-target="#delete"
								onclick="dataDelete('${dept.ID}')">
								<span class="glyphicon glyphicon-trash"></span>
							</button>

						</p> </td>

				</tr>
			</c:forEach>


		</table>

		<div class="clearfix"></div>
		<ul class="pagination pull-right">
			<li class="disabled"><a href="#"><span
					class="glyphicon glyphicon-chevron-left"></span></a></li>
			<%
				String value = (String) request.getAttribute("size");
				int f = Integer.parseInt(String.valueOf(request.getAttribute("first")));
				int m = Integer.parseInt(String.valueOf(request.getAttribute("max")));
				int size = Integer.parseInt(value);
				int sotrang = size / 6;
				if (size % 6 > 0) {
					sotrang += 1;
				}
				for (int i = 1; i <= sotrang; i++) {

					if (i == 1) {
						f = 0;
						m = 6;
					} else if (i == sotrang) {
						m = size;
						f = ((sotrang - 1) * 6);

					} else {
						m = 6 * i;
						f = m - 6;
					}
			%>
			<li><a href="showDepart.htm?view=depart&first=<%=f%>&max=<%=m%>"><%=i%></a></li>

			<%
				}
			%>

			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
		</ul>



	</div>
	<!-- Edit -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Cập nhật
						Phòng ban</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer ">
					<button id="myData" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Cập nhật
					</button>

				</div>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- Edit -->

	<!-- Insert -->
	<div class="modal fade" id="insert" tabindex="-1" role="dialog"
		aria-labelledby="insert" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Thêm phòng
						ban</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						ID: <input id="ID" class="form-control " type="text"
							placeholder="Nhập ID phòng ban">
					</div>

					<div class="form-group">

						Tên phòng ban: <input id="Name" class="form-control" type="text"
							placeholder="Nhập tên phòng ban">

					</div>
				</div>
				<div class="modal-footer ">
					<button id="myInsert" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Thêm
					</button>

				</div>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- Insert -->

	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this
						entry</h4>
				</div>
				<div id="dataDelete"></div>
				<div class="modal-body"></div>
				<div class="alert alert-danger">
					<span class="glyphicon glyphicon-warning-sign"></span> Bạn thực sự
					muốn xóa?
				</div>

				<div class="modal-footer ">
					<button id="myDelete" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Chấp nhận
					</button>
					<a href="showDepart.htm?view=depart" class="btn btn-default"
						data-dismiss="modal"> <span class="glyphicon glyphicon-remove"></span> Không
					</a>
				</div>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	function dataEdit(id) {
		$.post('dataEdit.htm', {
			'id' : id

		}, function(data) {
			$(".modal-body").html(data);
		});

	}
	
</script>

<!-- Insert -->
<script>
$(document).ready(function() {
	$("#myInsert").click(function() {
		var id=$("#ID").val();
		var name=$("#Name").val();
		window.location.href="<%=request.getContextPath()%>/Admin/btnInsertDepart.htm?id="
													+ id + "&name=" + name;

										})
					});
</script>
<!-- Insert -->
<!-- Edit -->
<script>
$(document).ready(function() {
	$("#myData").click(function() {
		var id=$("#ID").val();
		var name=$("#Name").val();
		window.location.href="<%=request.getContextPath()%>
	/Admin/btnUpdateDepart.htm?id="
													+ id + "&name=" + name;

										})
					});
</script>
<!-- Edit -->
<!-- Delete -->
<script type="text/javascript">
	function dataDelete(id) {
		$.post('dataDelete.htm', {
			'id' : id

		}, function(data) {
			$(".modal-body").html(data);
		});

	}
</script>

<script>
	$(document).ready(function() {
		$("#myDelete").click(function() {
			var id = $("#ID").val();
			window.location.href="<%= request.getContextPath()%>/Admin/btnDeleteDepart.htm?id="+ id;

		})
	});
</script>
<!-- Delete  -->