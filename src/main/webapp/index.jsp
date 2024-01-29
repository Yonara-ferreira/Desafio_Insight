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
</head>
<body>
	<div class="container mt-5">
		<!-- Tabela para Hor�rio de Trabalho -->
	 <h2>Hor�rio de Trabalho</h2>

    <form id="horarioForm">
        <label for="entrada">Entrada:</label>
        <input type="text" id="entrada" maxlength="5" placeholder="HH:MM" required>

        <label for="saida">Sa�da:</label>
        <input type="text" id="saida" maxlength="5" placeholder="HH:MM" required>

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
            <!-- As linhas da tabela ser�o adicionadas dinamicamente aqui -->
        </tbody>
    </table>

		<!-- Repita o mesmo padr�o para as outras tabelas (Marca��es, Atraso, Hora Extra) -->
		<!-- Tabela para Marca��es Feitas -->
		<h2>Marca��es Feitas</h2>
		<table class="table">
			<!-- Cabe�alhos e campos para marca��es -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Sa�da</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para entrada e sa�da das marca��es -->
				<tr>
					<td><input type="text" class="form-control"
						placeholder="HH:MM" /></td>
					<td><input type="text" class="form-control"
						placeholder="HH:MM" /></td>
					<!-- Adicione um bot�o para remover a linha se necess�rio -->
					<td><button type="button" class="btn btn-danger">Remover</button></td>
				</tr>
				<!-- Voc� pode adicionar mais linhas conforme necess�rio -->
			</tbody>
		</table>

		</tbody>
		</table>

		<!-- Tabela para Atraso -->
		<h2>Atraso</h2>
		<table class="table">
			<!-- Cabe�alhos e campos para atraso -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Sa�da</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para registros de atraso -->
			</tbody>
		</table>

		<!-- Tabela para Hora Extra -->
		<h2>Hora Extra</h2>
		<table class="table">
			<!-- Cabe�alhos e campos para hora extra -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Sa�da</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para registros de hora extra -->
			</tbody>
		</table>
	</div>

	<!-- Adicione seus scripts JavaScript aqui para manipula��o dos dados e intera��o do usu�rio -->

</body>
</html>
