<%@ include file="../includes/header.jsp"%>
<main role="main" class="container text-center">
<div class="jumbotron">
	<div class="row">




		<div class="offset-md-3 col-md-6 xs-12">
			<h1>Editar ${videos}</h1>
			<form action="buscar" method="post">

				<div class="form-group">
					<input type="text" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="matricula"
						placeholder="Matricula">
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">Buscar</button>
				</div>
			</form>

		</div>
	</div>
</div>
</main>

<%@ include file="../includes/footer.jsp"%>