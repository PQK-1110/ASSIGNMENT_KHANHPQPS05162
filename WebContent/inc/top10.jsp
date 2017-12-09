<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-12">
	<h1 class="page-header">Top 10 Nhân Viên Xuất Sắc</h1>
</div>
<!-- /.col-lg-12 -->
<div class="row">
	<div class="col-lg-12">
		<ul class="ch-grid">

			<c:forEach var="t" items="${top10}">

				<li>
					<div class="ch-item"
						style="background-image: url(<%= request.getContextPath()%>/${t.avatar});">

						<div class="ch-info-wrap">
							<div class="ch-info">
								<div class="ch-info-front "
									style="background-image: url(<%= request.getContextPath()%>/${t.avatar});"></div>

								<div class="ch-info-back">
									<h3>${t.username}</h3>
									<p>
										<a style="cursor: pointer;" data-title="Detail"
											data-toggle="modal" data-target="#detail"
											onclick="viewDetail(${t.ID})">${t.name}</a>${t.dept.name}
									</p>
								</div>
							</div>
						</div>

					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
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
					<h4 class="modal-title custom_align" id="Heading">Thông tin
						nhân viên</h4>
				</div>
				<div class="modal-body">

					<div class="panel-body"></div>
					<div class="panel-footer">
						<a data-original-title="Broadcast Message" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-primary"><i
							class="glyphicon glyphicon-envelope"></i></a>
					</div>

				</div>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- onclick -->
</div>
<script type="text/javascript">
	function viewDetail(id) {
		$.post('viewDetail.htm', {
			'id' : id
		}, function(data) {
			$(".modal-body").html(data);
		});
	}
</script>