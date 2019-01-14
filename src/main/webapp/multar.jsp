<%@ include file="includes/header.jsp"%>

<main role="main" class="container text-center">
<div class="jumbotron">
	<div class="row">
		<div class="col-3">
			<a href="buscar.jsp" class="btn btn-primary btn-lg active atras"
				role="button" aria-pressed="true">Atras</a>
		</div>
	</div>
	<%@ include file="includes/mensajes.jsp"%>
	<form action="formularioMulta" class="form-signin" method="post">
		<div class="form-group">
			<input type="hidden" class="form-control" value="${coche.id}"
				name="idcoche">
		</div>
		<div class="form-group">
			<label for="matricula">Matricula</label> <input type="text"
				name="matricula" class="form-control" value="${coche.matricula}"
				placeholder="AAAABBB" disabled>
		</div>

		<div class="form-group">
			<label for="importe">Importe:</label> <input name="importe"
				type="number" step="0.01" min="0" class="form-control"
				placeholder="Importe" autofocus required>
		</div>

		<div class="form-group">
			<label>Concepto:</label>
			<textarea name="concepto" class="form-control" rows="4" cols="50"
				maxlength="150" placeholder="Maximo 150 caracteres" required></textarea>

		</div>
		<input type="hidden" name="idagente" value="${agente.id}">
		<button type="submit" class="btn btn-warning">Aceptar</button>
	</form>
</div>
</main>
<%@ include file="includes/footer.jsp"%>