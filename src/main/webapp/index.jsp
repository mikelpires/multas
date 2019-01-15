<%@ include file="includes/header.jsp"%>
<%@ include file="includes/mensajes.jsp"%>

<div class="container-fluid">
	<div class="jumbotron mx-auto">

		<h1 class="mb-5">Bienvenido, ${agente.nombre}</h1>

		<div class="row">
			<div class="col-6">


				<div class="card">

					<a href="listado?idAgente=${agente.id}" class="btn"> <img
						class="card-img-top img" src="css/checklist.svg"
						alt="Card image cap">

						<div class="card-body">
							<h2>Ver</h2>
						</div>
					</a>
				</div>
			</div>
			<div class="col-6">

				<div class="card">

					<a href="buscar.jsp" class="btn"> <img class="card-img-top"
						src="https://www.svgrepo.com/show/163525/write.svg"
						alt="Card image cap">

						<div class="card-body">
							<h2>Multar</h2>
						</div>
					</a>
				</div>

			</div>

		</div>
		<!-- div row -->
	</div>
	<!-- div jumbotron -->
</div>
<!-- div container -->
<%@ include file="../includes/footer.jsp"%>