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
</head>
<body>
	<div class="container mt-5">
		<!-- Tabela para Horário de Trabalho -->
	 <h2>Horário de Trabalho</h2>

    <form id="horarioForm">
        <label for="entrada">Entrada:</label>
        <input type="text" id="entrada" maxlength="5" placeholder="HH:MM" required>

        <label for="saida">Saída:</label>
        <input type="text" id="saida" maxlength="5" placeholder="HH:MM" required>

        <button type="button" onclick="adicionarHorario()">Adicionar</button>
    </form>

    <table id="horarioTable">
        <thead>
            <tr>
                <th>Entrada</th>
                <th>Saída</th>
            </tr>
        </thead>
        <tbody>
            <!-- As linhas da tabela serão adicionadas dinamicamente aqui -->
        </tbody>
    </table>

		<!-- Repita o mesmo padrão para as outras tabelas (Marcações, Atraso, Hora Extra) -->
		<!-- Tabela para Marcações Feitas -->
		<h2>Marcações Feitas</h2>
		<table class="table">
			<!-- Cabeçalhos e campos para marcações -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Saída</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para entrada e saída das marcações -->
				<tr>
					<td><input type="text" class="form-control"
						placeholder="HH:MM" /></td>
					<td><input type="text" class="form-control"
						placeholder="HH:MM" /></td>
					<!-- Adicione um botão para remover a linha se necessário -->
					<td><button type="button" class="btn btn-danger">Remover</button></td>
				</tr>
				<!-- Você pode adicionar mais linhas conforme necessário -->
			</tbody>
		</table>

		</tbody>
		</table>

		<!-- Tabela para Atraso -->
		<h2>Atraso</h2>
		<table class="table">
			<!-- Cabeçalhos e campos para atraso -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Saída</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para registros de atraso -->
			</tbody>
		</table>

		<!-- Tabela para Hora Extra -->
		<h2>Hora Extra</h2>
		<table class="table">
			<!-- Cabeçalhos e campos para hora extra -->
			<thead>
				<tr>
					<th>Entrada</th>
					<th>Saída</th>
				</tr>
			</thead>
			<tbody>
				<!-- Linhas da tabela para registros de hora extra -->
			</tbody>
		</table>
	</div>

	<!-- Adicione seus scripts JavaScript aqui para manipulação dos dados e interação do usuário -->

</body>
</html>
