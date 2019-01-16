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

	<h1>Listado multas anuladas</h1>
	<%@ include file="../includes/mensajes.jsp"%>
	<table class="tablaResponsiva display nowrap responsive">
		<thead class="thead-light">
			<tr>
				<th scope="col">Matricula</th>
				<th scope="col">Concepto</th>
				<th scope="col">Fecha alta</th>
				<th scope="col">Fecha baja</th>
				<th scope="col">Habilitar</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${anuladas}" var="a">
				<tr>
					<td>${a.coche.matricula}</td>
					<td>${a.concepto}</td>
					<td>${a.fecha}</td>
					<td>${a.fechaBaja}</td>
					<td><button type="button" class="btn btn-warning"
							data-toggle="modal" data-target="#modal${a.id}">Click aqui</button></td>

				</tr>
				<div class="modal fade" id="modal${a.id}" tabindex="-1"
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
								Estas a punto de habilitar la multa por <strong>${a.concepto}</strong>
								del coche <strong>${a.coche.matricula}</strong> anulada el <strong>${a.fechaBaja}</strong>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cerrar</button>
								<a class="btn btn-warning"
									href="anular?idAgente=${agente.id}&idMulta=${a.id}&opcion=habilitar"
									>Habilitar</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</tbody>
	</table>

</div>


<%@ include file="../includes/footer.jsp"%>