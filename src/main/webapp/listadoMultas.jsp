<%@ include file="../includes/header.jsp"%>

<main role="main" class="container">
<div class="row">
	<div class="col-3">
		<a href="index.jsp" class="btn btn-primary btn-lg active atras"
			role="button" aria-pressed="true">Atras</a>
	</div>
</div>


<table class="table tablaResponsiva">
	<thead class="thead-light">
		<tr>
			<th scope="col">Id multa</th>
			<th scope="col">Matricula</th>
			<th scope="col">Concepto</th>
			<th scope="col">Fecha</th>
			<th scope="col">Editar?</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${multas}" var="m">
			<tr>
				<td>${m.id}</td>
				<td>${m.coche.matricula}</td>
				<td>${m.concepto}</td>
				<td>${m.fecha}</td>
				<td><button type="button" class="btn btn-danger btn-block"
						data-toggle="modal" data-target="#${m.id}">Eliminar</button></td>

			</tr>
			<div class="modal fade" id="${m.id}" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Estas seguro?</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Estas a punto de eliminar el
							registro ${m.id}</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Cerrar</button>
							<a href="eliminar?id=${m.id}" class="btn btn-danger">Eliminar</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</tbody>
</table>




<%@ include file="../includes/footer.jsp"%>