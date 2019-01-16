<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/navbar.jsp"%>


<div class="container-fluid">
<div class="jumbotron">
	<div class="row">
		<div class="col-1">
			<span style="font-size: 3em; color: Dodgerblue;"> <a
				href="privado/index.jsp" class="fas fa-arrow-circle-left" role="button"
				aria-pressed="true"></a>
			</span>
		</div>
	</div>
	<%@ include file="../includes/mensajes.jsp"%>

	<div class="row">

		<div class="offset-md-3 col-md-6 xs-12">

			<h1>Buscar matricula</h1>
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
</div>


<%@ include file="../includes/footer.jsp"%>