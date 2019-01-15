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
	<table class="tablaResponsiva display nowrap responsive">
		<thead class="thead-light">
			<tr>
				<th scope="col">Matricula</th>
				<th scope="col">Concepto</th>
				<th scope="col">Fecha alta</th>
				<th scope="col">Fecha baja</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${anuladas}" var="a">
				<tr>
					<td>${a.coche.matricula}</td>
					<td>${a.concepto}</td>
					<td>${a.fecha}</td>
					<td>${a.fechaBaja}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>


<%@ include file="../includes/footer.jsp"%>