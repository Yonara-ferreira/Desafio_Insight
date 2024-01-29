<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Desafio L�gico</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
</head>
<body>
	<div class="container mt-5">

		<h2>Hor�rio de Trabalho</h2>

		<form id="horarioForm">
			<label for="entrada">Entrada:</label> <input type="text" id="entrada"
				maxlength="5" placeholder="HH:MM" required> <label
				for="saida">Sa�da:</label> <input type="text" id="saida"
				maxlength="5" placeholder="HH:MM" required>

			<button type="button" onclick="adicionarHorario()">Adicionar</button>
		</form>

		<table id="horarioTable">
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Sa�da</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

		<h2>Marca��es Feitas</h2>

		<form id="marcacaoForm">
			<label for="entrada">Entrada:</label> <input type="text" id="entrada"
				maxlength="5" placeholder="HH:MM" required> <label
				for="saida">Sa�da:</label> <input type="text" id="saida"
				maxlength="5" placeholder="HH:MM" required>

			<button type="button" onclick="adicionarMarcacao()">Adicionar</button>
		</form>

		<table id="marcacaoTable">
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Sa�da</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
		<div class="container">
			<h2>Atrasos Contabilizados</h2>

			<table class="table table-atraso">
				<thead>
					<tr>
						<th scope="col">Data do C�lculo</th>
						<th scope="col">Minutos de Atraso</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					
					</tr>
					<tr>
						
					</tr>
				</tbody>
			</table>

			<h2>Hora Extra</h2>

			<table class="table table-hora-extra">
				<thead>
					<tr>
						<th scope="col">Entrada</th>
						<th scope="col">Sa�da</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						
					</tr>
					<tr>
					
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
