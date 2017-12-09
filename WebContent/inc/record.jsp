<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Edit -->
<script>
$(document).ready(function() {
	$("#myData").click(function() {
		var reason=$("#mytext").val();
		var id=$("#ID").val();
		var name=$("#Name").val();
		
		var check=$("#check:checked").val();
		
		window.location.href="<%=request.getContextPath()%>/Admin/btnUpdateRecord.htm?id="
													+ id + "&reason=" + reason +"&check=" + check + "&name=" + name ;

										})
					});
</script>

<!-- Edit -->
<div class="col-lg-12">
	<h1 class="page-header">Thành tích - Kỷ luật</h1>
</div>

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
										<c:forEach var="d" items="${dept}">

											<option value="${d.ID}">${d.name}</option>


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

					<!-- /.col-lg-12 -->
					<div class="row">
						<div class="col-sm-12">

							<table id="dataTables-example"
								class="table table-striped table-bordered table-hover">

								<tr>
									<th>Họ và Tên</th>
									<th>Tổng thành tích</th>
									<th>Tổng kỷ luật</th>
									<th>Điểm thưởng</th>
									<th>Phòng ban</th>
									<th>Đánh giá</th>

								</tr>
								<c:forEach var="s" items="${rstaff}">
									<tr>
										<td>${s[0]}</td>
										<td>${s[1]}</td>
										<td>${s[2]}</td>
										<td>${s[1]*s[2]}</td>
										<td>${s[3]}</td>
										<td>
											<p data-placement="top" data-toggle="tooltip" title="Edit">
												<button class="btn btn-primary btn-sm" data-title="Edit"
													data-toggle="modal" data-target="#edit"
													onclick="dataEdit('${s[4]}')">

													<span class="glyphicon glyphicon-pencil"></span>
												</button>
											</p>
										</td>
									</tr>
								</c:forEach>
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
									<h4 class="modal-title custom_align" id="Heading">Đánh giá</h4>
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
									<h4 class="modal-title custom_align" id="Heading">Đánh giá</h4>
								</div>
								<div id="show" class="modal-body"></div>
								<div class="modal-body">
									<p>
										Đánh giá: <input style="margin-left: 36px;" id="check"
											type="radio" name="check" value="True" checked="checked">Tốt
										<input id="check" style="margin-left: 20px;" type="radio"
											name="check" value="False">Xấu
									</p>
									<p>Lý do:</p>
									<textarea id="mytext"></textarea>

								</div>
								<div class="modal-footer ">
									<button id="myData" class="btn btn-warning btn-lg"
										style="width: 100%;">
										<span class="glyphicon glyphicon-ok-sign"></span> Nhận xét
									</button>

								</div>


							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- Edit -->

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
										href="recordstaff.htm?view=recordstaff&first=<%=f%>&max=<%=m%>"><%=i%></a></li>
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

<script type="text/javascript">
	$(document).ready(function(){
		$("#myselect ").click(function(){
			id=$("#myselect option:selected").val();
			
			switch(id){
			case "KD": window.location.href="<%=request.getContextPath()%>/Admin/recordstaff.htm?view=recordstaff&id="+id; 
			break;
			case "KT": window.location.href="<%=request.getContextPath()%>/Admin/recordstaff.htm?view=recordstaff&id="+id;break;
			case "NS": window.location.href="<%=request.getContextPath()%>/Admin/recordstaff.htm?view=recordstaff&id="+id;break;
			case "PT": window.location.href="<%=request.getContextPath()%>/Admin/recordstaff.htm?view=recordstaff&id="+id;break;
			case "SX": window.location.href="<%=request.getContextPath()%>
	/Admin/recordstaff.htm?view=recordstaff&id="
														+ id;
												break;
											}

										})

					});
</script>
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
			td = tr[i].getElementsByTagName("td")[0];
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

<script type="text/javascript">
	function dataEdit(id) {
		$.post('dataEvaluate.htm', {
			'id' : id

		}, function(data) {
			$("#show").html(data);
		});

	}
</script>