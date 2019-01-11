

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title>Poner Multa</title>
		
		<link
			href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css"
			rel="stylesheet">
			
		<!-- Custom styles for this template -->
		<link href="css/style.css" rel="stylesheet">
	
	</head>

	<body class="text-center" class="container-fluid">
	
	
	<form action="/action_page.php" class="form-signin" method="post">
		<div class="form-group">
			<input type="hidden" class="form-control" value="${coche.id}" name="idcoche">
		</div>
		<div class="form-group">
			<label for="matricula">Matricula</label> <input type="text"
				class="form-control" name="matricula" value="${coche.matricula}" placeholder="AAAABBB" disabled>
		</div>

		<div class="form-group">
			<label for="importe">Importe:</label> <input type="number"  step="0.01" min="0"
				class="form-control" id="importe" Placeholder="Importe" autofocus required>
		</div>

		<div class="form-group">
			<label>Concepto:</label>
			<textarea class="form-control" rows="4" cols="50" maxlength="150" placeholder="Maximo 150 caracteres" required></textarea>
			
		</div>
		<button type="submit" class="btn btn-warning">Aceptar</button>
	</form>
	

</body>

</html>