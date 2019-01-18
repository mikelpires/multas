<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/navbar.jsp"%>
<main role="main" class="container text-center">
<div class="jumbotron">
	<div class="row">
		<div class="col-1">
			<span style="font-size: 3em; color: Dodgerblue;"> <a
				href="privado/buscar.jsp" class="fas fa-arrow-circle-left"
				role="button" aria-pressed="true"></a>
			</span>
		</div>
	</div>

	<%@ include file="../includes/mensajes.jsp"%>

	<h1>Objetivos</h1>
	<%-- 	<c:choose>
		<c:when test="${objetivo.objetivoMesCumplido}"><i class="fas fa-check-circle"></i></c:when>
		<c:otherwise><i class="fas fa-times-circle"></i></c:otherwise>
	</c:choose> --%>

	<h2>
		Total mes ${objetivo.objetivoMes} &euro; <small>/ 1000 </small>
		<c:choose>
			<c:when test="${objetivo.objetivoMesCumplido}">
				<i class="fas fa-check-circle green"></i>
			</c:when>
			<c:otherwise>
				<i class="fas fa-times-circle red"></i>
			</c:otherwise>
		</c:choose>
	</h2>
	<h2>
		Total año ${objetivo.objetivoAnyo} &euro; <small>/ 12000 </small>
		<c:choose>
			<c:when test="${objetivo.objetivoAnyoCumplido}">
				<i class="fas fa-check-circle green"></i>
			</c:when>
			<c:otherwise>
				<i class="fas fa-times-circle red"></i>
			</c:otherwise>
		</c:choose>
	</h2>

<hr>
	<h1>Objetivos anuales</h1>
	<nav aria-label="Page navigation example">
		<ul class="pagination flex-wrap">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Anterior</span>
			</a></li>
			<c:forEach begin="2008" end="2019" varStatus="loop">
				<c:if test="loop.index=2019"></c:if>
				<li class="page-item"><a class="page-link"
					href="estadisticas?idAgente=${agente.id}&anyo=${loop.index}">${loop.index}</a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Siguiente</span>
			</a></li>
		</ul>
	</nav>


	<!-- <div class="input-group mb-3">
		<div class="input-group-prepend">
			<label class="input-group-text" for="inputGroupSelect01">Meses</label>
		</div>
		<select name="anyo" class="custom-select" id="inputGroupSelect01">

			<option value="2019" selected>2019</option>
			<option value="2018">2018</option>
			<option value="2017">2017</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
			<option value="2010">2010</option>
			<option value="2009">2009</option>
		</select>
	</div> -->
	<table class="tablaResponsiva display responsive nowrap"
		style="width: 100%">
		<thead>
			<tr>
				<th>Mes</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${objetivoAnyo}">
				<tr>
					<td>${obj.key}</td>
					<td>${obj.value}&euro;<small>/ 1000 </small> <c:choose>
							<c:when test="${obj.value > 1000}">
								<i class="fas fa-check-circle green"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-times-circle red"></i>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>
</main>
<%@ include file="../includes/footer.jsp"%>