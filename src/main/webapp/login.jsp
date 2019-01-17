<%@ include file="includes/header.jsp"%>
<body class="text-center">

	<div class="fondo">
		<form novalidate action="index" method="post" class="form-signin">
			<div class="circulo">
				<!-- <img class="mb-4" src="https://vignette.wikia.nocookie.net/cybernations/images/d/d0/Emblem_of_the_Judicial_Police.svg/revision/latest?cb=20120415182330" alt="" width="140px"> -->
			<img class="mb-4" src="css/avatar.jpg" alt="" width="110px">
			</div>
			
			<div class="form-group">
				<%@ include file="includes/mensajes.jsp"%>
			</div>

			<div class="form-group">
				<label for="email" class="sr-only">Nº placa</label><input
					type="email" name="placa" class="form-control"
					placeholder="Nº placa" required autofocus>
			</div>

			<div class="form-group">
				<label for="pass" class="sr-only">Contraseña</label> <input
					type="password" name="password" class="form-control"
					placeholder="Contraseña" required>
			</div>

			<div class="form-group">
				<button class="btn btn-lg btn-warning btn-block" type="submit">
					Entrar</button>
			</div>
		</form>
	</div>

	<%@ include file="includes/footer.jsp"%>