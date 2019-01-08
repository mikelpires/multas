<%@ include file="../includes/header.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Hola</title>

<link
	href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>


<body class="text-center">
	<div class="container-fluid">
		<div class="jumbotron mx-auto">
			<h1 class="mb-5">Bienvenido, ${agente.nombre}</h1>
			<div class="row">
				<div class="col-sm-6 col-xs-12" >
					<div class="card" style="width: 100%;">
					<h2>Ver multas</h2>
					<a href="vermultas.jsp" class="btn ">
						<img class="card-img-top"
							src="https://upload.wikimedia.org/wikipedia/commons/9/9d/Checklist_Noun_project_5166_yellow.svg"
							alt="Card image cap">
							</a>

					</div>
					</div>
					<div class="col-md-6 col-xs-12">
						<div class="card" style="width: 100%;">
						<h2>Multar</h2>
						<a href="multar" class="btn">
							<img class="card-img-top"
								src="https://www.svgrepo.com/show/163525/write.svg"
								alt="Card image cap">
						</a>
	
						</div>

				</div>

			</div><!-- div row -->
		</div> <!-- div jumbotron -->
	</div><!-- div container -->
	<%@ include file="../includes/footer.jsp"%>