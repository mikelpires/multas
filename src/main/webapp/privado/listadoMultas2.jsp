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

	<table class="tablaResponsiva display responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th>Matricula</th>
				<th>Concepto</th>
				<th>Fecha</th>
				<th>Anular</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${multas}" var="m">
				<tr>
					<td>${m.coche.matricula}</td>
					<td>${m.concepto}</td>
					<td>${m.fecha}</td>
					<td><a class="btn btn-warning"
						href="anular?idAgente=${agente.id}&idMulta=${m.id}"
						target="_blank">Click aqui</a></td>
				</tr>
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