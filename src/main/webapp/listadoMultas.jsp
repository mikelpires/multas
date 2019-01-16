<%@ include file="../includes/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-1">
			<span style="font-size: 3em; color: Dodgerblue;"> <a
				href="index.jsp" class="fas fa-arrow-circle-left" role="button"
				aria-pressed="true"></a>
			</span>
		</div>
	</div>
	<h1>Listado multas</h1>
	<%@ include file="../includes/mensajes.jsp"%>
	<table class="tablaResponsiva display responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th>Matricula</th>
				<th>Concepto</th>
				<th>Fecha</th>
				<th>Estado</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${multas}" var="m">
				<tr>
					<td>${m.coche.matricula}</td>
					<td>${m.concepto}</td>
					<td>${m.fecha}</td>
					<c:choose>
						<c:when test="${empty m.fechaBaja }">
							<td><button type="button" class="btn btn-warning"
									data-toggle="modal" data-target="#modal${m.id}">Anular</button></td>
						</c:when>
						<c:otherwise>
							<td><a class="btn btn-secondary"
								href="anular?opcion=listar&idAgente=${agente.id}">Anulada </a></td>
						</c:otherwise>
					</c:choose>
				</tr>

				<c:if test="${empty m.fechaBaja }">
					<div class="modal fade" id="modal${m.id}" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">¿Estas
										seguro?</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									Estas a punto de anular la multa por <strong>${m.concepto}</strong>
									del coche <strong>${m.coche.matricula}</strong>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cerrar</button>
									<a class="btn btn-warning"
										href="anular?idAgente=${agente.id}&idMulta=${m.id}&opcion=anular">Anular</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>

			</c:forEach>

		</tbody>
	</table>

	<%-- <table class="table display tablaResponsiva responsive nowrap ">
	<thead class="thead-light">
		<tr>
			<th>Matricula</th>
			<th>Concepto</th>
			<th>Fecha</th>
			<th>Anular?</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${multas}" var="m">
			<tr>
				<td>${m.coche.matricula}</td>
				<td>${m.concepto}</td>
				<td>${m.fecha}</td>
				<td><a href="anular?idAgente=${agente.id}&idMulta=${m.id}"
					class="btn btn-warning">Anular</a></td>

			</tr>
		</c:forEach>
	</tbody>
</table> --%>

</div>


<%@ include file="../includes/footer.jsp"%>