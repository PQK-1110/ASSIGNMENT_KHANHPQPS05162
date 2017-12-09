<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="col-lg-12">
	<h1 class="page-header">Thông Tin Nhân Viên</h1>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		$("#myselect ").click(function(){
			id=$("#myselect option:selected").val();
			switch(id){
			case "KD": $("#result").html(id); window.location.href="<%=request.getContextPath()%>/Admin/showStaffofDepart.htm?view=staff&id="+id; 
			break;
			case "KT": $("#result").html(id);window.location.href="<%=request.getContextPath()%>/Admin/showStaffofDepart.htm?view=staff&id="+id;break;
			case "NS": $("#result").html(id);window.location.href="<%=request.getContextPath()%>/Admin/showStaffofDepart.htm?view=staff&id="+id;break;
			case "PT": $("#result").html(id);window.location.href="<%=request.getContextPath()%>/Admin/showStaffofDepart.htm?view=staff&id="+id;break;
			case "SX": $("#result").html(id);window.location.href="<%=request.getContextPath()%>/Admin/showStaffofDepart.htm?view=staff&id="
														+ id;
												break;
											}

										})

					});
</script>

<script type="text/javascript">
	
		function viewDetail(id) {
	        $.post('viewDetail.htm', {'id': id}, function (data) {
	            $(".modal-body").html(data);
	        });
	    }

	
</script>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/libraries/ckfinder/ckfinder.js"></script>
<!-- Cấu hình Upload file bằng Ckfinder -->
<script type="text/javascript">
    function BrowseServer(startupPath, functionData) {
        var finder = new CKFinder();
        finder.basePath = '<%=request.getContextPath()%>/libraries/ckfinder/'; //Đường path nơi đặt ckfinder
        finder.startupPath = startupPath; //Đường path hiện sẵn cho user chọn file
        finder.selectActionFunction = SetFileField; // hàm sẽ được gọi khi 1 file được chọn
        finder.selectActionData = functionData; //id của text field cần hiện địa chỉ hình
        //finder.selectThumbnailActionFunction = ShowThumbnails; //hàm sẽ được gọi khi 1 file thumnail được chọn	
        finder.popup(); // Bật cửa sổ CKFinder
    }
    
    function SetFileField(fileUrl, data) {
        document.getElementById(data["selectActionData"]).value = fileUrl;
        $("#anhdaidien").attr('src', fileUrl);
    }

    function ShowThumbnails(fileUrl, data) {
        var sFileName = this.getSelectedFile().name; // this = CKFinderAPI
        document.getElementById('anhdaidien').innerHTML +=
                '<div class="thumb">' +
                '<img src="' + fileUrl + '" />' +
                '<div class="caption">' +
                '<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
                '</div>' +
                '</div>';
        document.getElementById('preview').style.display = "";
        return false; // nếu là true thì ckfinder sẽ tự đóng lại khi 1 file thumnail được chọn
    }
 </script>
<!-- Upload file -->
<!-- Filter Table -->
<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("dataTables-example");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
<!-- Filter Table -->
<!-- /.col-lg-12 -->

<div class="row">
	<form role="form" action="<%=request.getContextPath()%>/Admin.htm">
		<div class="col-md-4 col-md-offset-0">
			<input type="hidden" name="id" value="${ID}">
			<c:set var="emp" value="${staffofid[0]}"></c:set>
			<div class="form-group">
				<label>Họ và Tên</label> <input type="text" class="form-control"
					name="name" required="required" value="${emp.name}">

			</div>
			<div class="form-group">
				<label>Ngày sinh</label> <input class="form-control" name="birthday"
					value="${emp.birthday}" type="date" min="1960-01-01"
					max="1999-31-12">
			</div>
			<div class="form-group">
				<label>Giới tính</label> <br /> <label class="radio-inline">
					<input type="radio" name="gender" id="optionsRadiosInline1"
					value="true" checked>Nam
				</label> <label class="radio-inline"> <input type="radio"
					name="gender" id="optionsRadiosInline2"
					<c:choose><c:when test="${emp.gender=='false'}">checked</c:when></c:choose>
					value="false">Nữ
				</label>

			</div>

		</div>

		<div class="col-md-4 col-md-offset-0">

			<div class="form-group">
				<label>Username</label> <input class="form-control" name="username"
					value="${emp.username}" required="required">

			</div>
			<div class="form-group">
				<label>Email</label> <input class="form-control" name="email"
					value="${emp.email}" type="email">
			</div>
			<div class="form-group">
				<label>Lương</label> <input class="form-control" type="number"
					value="${emp.salary}" name="salary" required="required">
			</div>

		</div>

		<div class="col-md-4 col-md-offset-0">

			<div class="form-group">
				<label>Phòng ban</label> <select name="depart" class="form-control">
					<c:forEach var="dept" items="${depart}">
						<c:choose>
							<c:when test="${emp.dept.name==dept.name}">
								<option value="${dept.ID}" selected="selected">${dept.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${dept.ID}">${dept.name}</option>
							</c:otherwise>
						</c:choose> >
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>Số điện thoại</label> <input class="form-control"
					name="phone" value="${emp.phone}" type="text">
			</div>
			<div class="form-group">
				<label>Phân quyền</label> <select name="role" class="form-control">
					<c:choose>
						<c:when test="${emp.role=='true'}">
							<option value="true" selected="selected">Admin</option>
							<option>Nhân viên</option>
						</c:when>
						<c:otherwise>
							<option>Admin</option>
							<option value="false" selected="selected">Nhân viên</option>

						</c:otherwise>

					</c:choose>

				</select>
			</div>

		</div>

		<div class="col-md-8 col-md-offset-0">
			<div class="form-group">
				<label>Ghi chú</label>
				<textarea rows="10" cols="8" id="editor"></textarea>
			</div>
		</div>

		<div class="col-md-4 col-md-offset-0">
			<div class="form-group">
				<label>Ảnh đại diện</label><br /> <img style="border: 1px solid;"
					id="url" width="80" height="80" alt="" onclick="openPopup()"
					src="<%=request.getContextPath()%>${emp.avatar}">
				<c:set var="avatar" value="${emp.avatar}"></c:set>
				<input value="" width="80" height="80" id="url" name="photo"
					type="text" onclick="openPopup()">
			</div>
		</div>

		<button style="margin-left: 20px;" name="btnInsertStaff"
			class="btn btn-primary btn-sm"
			<c:if test="${control=='edit'}">disabled</c:if>>Thêm</button>
		<button style="margin-left: 20px;" name="btnUpdateStaff"
			class="btn btn-success btn-sm"
			<c:if test="${control=='insert'}">disabled</c:if>>Cập nhật</button>
		<a style="margin-left: 20px;" href="showStaff.htm?view=staff"
			class="btn btn-warning btn-sm">Nhập lại</a>
	</form>
</div>
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<!-- /.panel-heading -->

			<div class="panel-body">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_length" id="dataTables-example_length">
								<label>Lọc theo phòng ban <select id="myselect"
									name="dataTables-example_length"
									aria-controls="dataTables-example"
									class="form-control input-sm">
										<option>Lựa chọn</option>
										<c:forEach var="dept" items="${depart}">

											<option value="${dept.ID}">${dept.name}</option>


										</c:forEach>


								</select> entries
								</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<label>Search:<input type="text" id="myInput"
									onkeyup="myFunction()" class="form-control input-sm"
									placeholder="Tìm kiếm theo tên"
									aria-controls="dataTables-example"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>ID</th>
										<th style="width: 300px;">Name</th>
										<th>Gender</th>
										<th>Birthday</th>
										<th>Avatar</th>
										<th>Email</th>

										<th>Salary</th>
										<th>Depart</th>
										<th>Detail</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="emp" items="${staff}">

										<tr class="odd gradeX">

											<td>${emp.ID}</td>
											<td>${emp.name}</td>
											<c:choose>
												<c:when test="${emp.gender=='true'}">
													<td style="width: 40px;">Nam</td>
												</c:when>
												<c:otherwise>
													<td style="width: 40px;">Nữ</td>
												</c:otherwise>
											</c:choose>
											<td style="width: 120px;"><fmt:formatDate type="date"
													pattern="dd/MM/yyyy" value="${emp.birthday}" /></td>
											<td><img alt="img" width="64px" height="64px"
												src="<%= request.getContextPath() %>/${emp.avatar}" /></td>
											<td>${emp.email}</td>

											<td><fmt:formatNumber type="number"
													value="${emp.salary}" pattern="###,###"></fmt:formatNumber>đ</td>
											<td>${emp.dept.ID}</td>

											<td><p data-placement="top" data-toggle="tooltip"
													title="Detail">

													<button class="btn btn-info btn-sm" data-title="Detail"
														data-toggle="modal" data-target="#detail"
														onclick="viewDetail(${emp.ID})">

														<span class="glyphicon glyphicon-search"></span>
													</button>
												</p></td>
											<td><a class='btn btn-primary btn-sm'
												href="showStaff.htm?view=staff&id=${emp.ID}&control=edit"><span
													class="glyphicon glyphicon-edit" style="padding: 3px;"></span></a></td>
											<td>
												<p data-placement="top" data-toggle="tooltip" title="Delete"
													style="float: right;" data-original-title="Delete">
													<button class="btn btn-danger btn-sm too"
														data-title="Delete" data-toggle="modal"
														data-target="#delete" onclick="dataDelete('${emp.ID}')">
														<span class="glyphicon glyphicon-trash"
															style="padding: 3px;"></span>
													</button>
												</p> <c:set var="s" value="${emp.ID}"></c:set>
											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
					<!-- /.table-responsive -->

					<!-- su kien click button show thong tin  -->
					<div class="modal fade" id="detail" tabindex="-1" role="dialog"
						aria-labelledby="detail" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">Thông
										tin nhân viên</h4>
								</div>
								<div class="modal-body">

									<div class="panel-body"></div>
									<div class="panel-footer">
										<a data-original-title="Broadcast Message"
											data-toggle="tooltip" type="button"
											class="btn btn-sm btn-primary"><i
											class="glyphicon glyphicon-envelope"></i></a>
									</div>

								</div>


							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- onclick -->

					<!-- Delete -->
					<div class="modal fade" id="delete" tabindex="-1" role="dialog"
						aria-labelledby="edit" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">Delete
										this entry</h4>
								</div>
								<div class="modal-body"></div>
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-warning-sign"></span> Bạn thật
									sự muốn xóa?
								</div>
								<div class="modal-footer ">
									<button id="myDelete" class="btn btn-success">
										<span class="glyphicon glyphicon-ok-sign"></span> Chấp nhận
									</button>
									<a href="showStaff.htm?view=staff" class="btn btn-default"
										data-dismiss="modal"> <span
										class="glyphicon glyphicon-remove"></span> Không
									</a>
								</div>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">Showing 1 to 10 of 57
								entries</div>
						</div>
						<div class="col-sm-6">
							<div class="dataTables_paginate paging_simple_numbers"
								id="dataTables-example_paginate">
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

									<li class="paginate_button" aria-controls="dataTables-example"
										tabindex="0"><a
										href="showStaff.htm?view=staff&first=<%=f%>&max=<%=m%>"><%=i%></a></li>
									<%
										}
									%>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<!-- 				<div class="well"> -->
				<!-- 					<h4>DataTables Usage Information</h4> -->
				<!-- 					<p> -->
				<!-- 						DataTables is a very flexible, advanced tables plugin for jQuery. -->
				<!-- 						In SB Admin, we are using a specialized version of DataTables -->
				<!-- 						built for Bootstrap 3. We have also customized the table headings -->
				<!-- 						to use Font Awesome icons in place of images. For complete -->
				<!-- 						documentation on DataTables, visit their website at <a -->
				<!-- 							target="_blank" href="https://datatables.net/">https://datatables.net/</a>. -->
				<!-- 					</p> -->
				<!-- 					<a class="btn btn-default btn-lg btn-block" target="_blank" -->
				<!-- 						href="https://datatables.net/">View DataTables Documentation</a> -->
				<!-- 				</div> -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<script>
var editor=CKEDITOR.replace('editor');
CKFinder.setupCKEditor(editor,'<%=request.getContextPath()%>/libraries/ckfinder/');
</script>
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
			window.location.href="<%=request.getContextPath()%>/Admin/btnDeleteStaff.htm?id="+ id;
			
		})
	});
</script>
<!-- Delete  -->
<!-- Show Image -->

