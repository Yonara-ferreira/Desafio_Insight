<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Desafio Lógico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script src="js/index.js"></script>

</head>
<body>
	<div class="container mt-5">

		<h2>Horário de Trabalho</h2>

		<form id="horarioForm">
			<label for="entrada">Entrada:</label>
			 <input type="text" id="entrada" class="input-hora" maxlength="5" placeholder="HH:MM" required>
			 <label for="saida">Saída:</label> 
				<input type="text" id="saida" class="input-hora" maxlength="5" placeholder="HH:MM" required>

			<button type="button" class="btn btn-primary" onclick="cadastrarRegistro()">Adicionar</button>
			<button type="button" class="btn btn-secondary" onclick="document.getElementById('horarioForm').reset();">Limpar</button>
		</form>

		<table id="tabelaRegistros">
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Saída</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

		<h2>Marcações Feitas</h2>

		<form id="marcacaoForm">
		
			<label for="#entradaMarcacao">Entrada:</label> 
			<input type="text" id="entradaMarcacao" class="input-hora" maxlength="5" placeholder="HH:MM" required>
			<label for="saidaMarcacao">Saída:</label> 
			<input type="text" id="saidaMarcacao" class="input-hora" maxlength="5" placeholder="HH:MM"  required>

			<button type="button" class="btn btn-primary" onclick="subtrairTabelas()">Adicionar</button>
			<button type="button" class="btn btn-secondary" onclick="document.getElementById('marcacaoForm').reset();">Limpar</button>
		</form>

		<table id="tabelaMarcacoes">
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Saída</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
		
		<div class="container">
			 <h2>Cálculos de Atraso</h2>
			 
				<form id="atrasoForm">
					<label for="data">Data:</label>
					 <input type="date" id="data" required>
					 
					 <label for="entrada">Entrada Prevista:</label>
					 <input type="text" id="entradaAtrasada" class="input-hora"  maxlength="5" placeholder="HH:MM" required>
		
					<label for="saidaAtrasada">Saída Real:</label> 
					<input type="text" id="saidaAtrasada" class="input-hora" maxlength="5" placeholder="HH:MM" required>
				
					<button type="button" class="btn btn-primary"  onclick="calcularAtraso()">Calcular Atraso</button>
					<button type="button" class="btn btn-secondary" onclick="document.getElementById('atrasoForm').reset();">Limpar</button>
					
			</form>

			<table id="tabelaAtraso">
				<thead>
					<tr>
						<th>Data</th>
						<th>Entrada Prevista</th>
						<th>Saída Real</th>
						<th>Atraso</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>

			<h2>Cálculos de Hora Extra</h2>
			<form id="horaExtraForm">
				<label for="data">Data:</label> 
					<input type="date" id="data"required> 
						<label for="entrada">Entrada:</label> 
				
				<input type="text" id="entradaHrExtra" class="input-hora" maxlength="5" placeholder="HH:MM" required>
				<label for="saida">Saída:</label>
				
				<input type="text" class="input-hora" id="saidaHrExtra"maxlength="5" placeholder="HH:MM" required> 
				<label for="cargaHoraria">Carga Horária Diária:</label> 
				<input type="text" class="input-hora" id="cargaHorariaExtra" maxlength="5" placeholder="HH:MM" required>
				
				<button type="button" onclick="calcularAtrasosHorasExtras()">Calcular Hora Extra</button>
			</form>
			<table id="tabelaHoraExtra">
				<thead>
					<tr>
						<th>Data</th>
						<th>Entrada</th>
						<th>Saída</th>
						<th>Carga Horária Diária</th>
						<th>Hora Extra</th>
					</tr>
				</thead>
				<tbody>
					
			</table>
		</div>
	</div>
	
	<script src="js/index.js"></script>
</body>
</html>
