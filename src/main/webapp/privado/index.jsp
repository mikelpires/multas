<%@ include file="../includes/header.jsp"%>


<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- /.row -->
<div class="jumbotron">
	<div class="dropdown izquierda">
		<button class="btn btn-danger dropdown-toggle" type="button"
			id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false">
			<i class="fa fa-power-off "></i>
		</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

			<a class="dropdown-item fa2xtext" href="logout"> <i
				class="fa fa-sign-out-alt fa-1x"></i> Cerrar sesión
			</a>

		</div>
	</div>


	<h1 class="font-italic">
		<strong>Bienvenido,</strong> ${agente.nombre}
	</h1>
	<c:if test="${not empty alerta}">
<div class="alert alert-${alerta.tipo} show" role="">
	  ${alerta.texto}
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
</c:if>
	<div class="row">
		<div class="col-lg-3 col-md-6 col-xs-6">
			<!-- panel1 -->
			<div class="panel panel-blue" onclick="location.href='listado?idAgente=${agente.id}';">
				<div class="panel-heading">
					<div class="row">
						<div class="col-12 text-left">
							<i class="fa fa-receipt fa-5x"></i>
						</div>

					</div>
				</div>
				<a href="listado?idAgente=${agente.id}">
					<div class="panel-footer">
						<span class="pull-left">Ver multas</span> <span class="pull-right"><i
							class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 col-xs-6">
			<!-- panel2 -->
			<div class="panel panel-green" onclick="location.href='privado/buscar.jsp';">
				<div class="panel-heading">
					<div class="row">
						<div class="col-12 text-left">
							<i class="fa fa-car fa-5x"></i>
						</div>
						
					</div>
				</div>
				<a href="privado/buscar.jsp">
					<div class="panel-footer">
						<span class="pull-left">Multar</span> <span class="pull-right"><i
							class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>


		<div class="col-lg-3 col-md-6 col-xs-6">
			<!-- panel 3 -->
			<div class="panel panel-red" onclick="location.href='anular?opcion=listar&idAgente=${agente.id}';">
				<div class="panel-heading">
					<div class="row">
						<div class="col-12 text-left">
							<i class="fa fa-times-circle fa-5x"></i>
						</div>

					</div>
				</div>
				<a href="anular?opcion=listar&idAgente=${agente.id}">
					<div class="panel-footer">
						<span class="pull-left">Multas anuladas</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-xs-6">
			<!-- panel 4 -->
			<div class="panel panel-yellow" onclick="location.href='#';">
				<div class="panel-heading">
					<div class="row">
						<div class="col-12 text-left">
							<i class="fa fa-chart-bar fa-5x"></i>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">Ver estadisticas</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>


	</div>
	<!-- /.row -->
</div>

<%@ include file="../includes/footer.jsp"%>