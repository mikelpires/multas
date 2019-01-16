<%@ include file="includes/header.jsp"%>
<body class="text-center">


	<form novalidate action="index" method="post" class="form-signin">
		<img class="mb-4"
			src="css/checklist.svg"
			alt="" width="72" height="72">
		<h1>Inicia sesion para continuar</h1>
		<div class="form-group">
			<%@ include file="includes/mensajes.jsp"%>
		</div>

		<div class="form-group">
			<label for="email" class="sr-only">Nº placa</label><input
				type="email" name="placa" class="form-control"
				placeholder="Introduce placa" required autofocus>
		</div>

		<div class="form-group">
			<label for="pass" class="sr-only">Contraseña</label> <input
				type="password" name="password" class="form-control"
				placeholder="Password" required>
		</div>

		<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				Entrar</button>
		</div>
	</form>


	<%@ include file="includes/footer.jsp"%>