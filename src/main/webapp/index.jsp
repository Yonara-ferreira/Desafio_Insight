<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Desafio Lógico</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"  href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<script>
$(document).ready(function() {
    $('#tabelaRegistros').DataTable();
    $('#tabelaMarcacoes').DataTable();
    $('#tabelaAtraso').DataTable();
});

	function cadastrarRegistro() {
		var entrada = $('#entrada').val();
		var saida = $('#saida').val();

		var newRow = $('<tr><td>' + entrada + '</td><td>' + saida
				+ '</td></tr>');
		$('#tabelaRegistros tbody').append(newRow);

		$('#entrada').val('');
		$('#saida').val('');
	}

    function cadastrarMarcacao() {
       
        var entrada = $('#entradaMarcacao').val();
        var saida = $('#saidaMarcacao').val();
        
        var newRow = $('<tr><td>' + entrada + '</td><td>' + saida
				+ '</td></tr>');
		$('#tabelaMarcacoes tbody').append(newRow);

        $('#entradaMarcacao').val('');
        $('#saidaMarcacao').val('');
    }

    function calcularHoraExtra() {
        var data = $('#data').val();
        var entrada = $('#entradaHrExtra').val();
        var saida = $('#saidaHrExtra').val();
        var cargaHoraria = $('#cargaHorariaExtra').val();
        
        var horaExtra = calcularDiferencaHoras(entrada, saida) - cargaHoraria;

        var newRow = $('<tr><td>' + data + '</td><td>' + entrada + '</td><td>' + saida + '</td><td>' + cargaHoraria + '</td><td>' + horaExtra + '</td></tr>');
        $('#tabelaHoraExtra tbody').append(newRow);

        $('#data').val('');
        $('#entradaHrExtra').val('');
        $('#saidaHrExtra').val('');
        $('#cargaHorariaExtra').val('');
    }

    // Função para calcular a diferença em horas entre dois horários no formato HH:MM
    function calcularDiferencaHoras(hora1, hora2) {
        var [hora1h, hora1m] = hora1.split(':').map(Number);
        var [hora2h, hora2m] = hora2.split(':').map(Number);

        var diferencaHoras = hora2h - hora1h;
        var diferencaMinutos = hora2m - hora1m;

        if (diferencaMinutos < 0) {
            diferencaHoras--;
            diferencaMinutos += 60;
        }

        return diferencaHoras + (diferencaMinutos / 60);
    }
</script>

<body>
	<div class="container mt-5">

		<h2>Horário de Trabalho</h2>

		<form id="horarioForm">
			<label for="entrada">Entrada:</label> <input type="text" id="entrada"
				maxlength="5" placeholder="HH:MM" required> <label
				for="saida">Saída:</label> <input type="text" id="saida"
				maxlength="5" placeholder="HH:MM" required>

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
			<input type="number" id="entradaMarcacao" maxlength="5" placeholder="HH:MM" required>
			<label for="saidaMarcacao">Saída:</label> 
			<input type="number" id="saidaMarcacao" maxlength="5" placeholder="HH:MM" required>

			<button type="button" class="btn btn-primary" onclick="cadastrarMarcacao()">Adicionar</button>
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
					 <input type="text" id="entradaAtrasada" maxlength="5" placeholder="HH:MM" required>
		
					<label for="saidaAtrasada">Saída Real:</label> <input type="text" id="saida" maxlength="5" placeholder="HH:MM" required>
				
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
				
				<input type="text" id="entradaHrExtra" maxlength="5" placeholder="HH:MM" required>
				
				<label for="saida">Saída:</label>
				<input type="text" id="saidaHrExtra"maxlength="5" placeholder="HH:MM" required> 
				<label for="cargaHoraria">Carga Horária Diária:</label> 
				<input type="text" id="cargaHorariaExtra" maxlength="5" placeholder="HH:MM" required>
				
				<button type="button" onclick="calcularHoraExtra()">Calcular Hora Extra</button>
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
</body>
</html>
