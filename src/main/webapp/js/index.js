$(document).ready(function() {
	$('#tabelaRegistros').DataTable();
	$('#tabelaMarcacoes').DataTable();
	$('#tabelaAtraso').DataTable();
	$('#tabelaAtraso').DataTable();
});

$(document).ready(function() {
	$('.input-hora').inputmask('99:99', { placeholder: '__:__' });
	$('.input-hora').on('keydown', function(event) {

		if (event.keyCode === 8) {
			return true;
		}
		var value = $(this).val();
		if (value.length === 2 && !value.includes(':')) {
			$(this).val(value + ':');
		}
	});
});

$(document).ready(function() {
	var horarioEntrada = $('#tabelaRegistros tbody tr:first-child td:first-child input').val();
	console.log(horarioEntrada);
});



function cadastrarRegistro() {
	var entrada = $('#entrada').val();
	var saida = $('#saida').val();

	var newRow = $('<tr><td>' + entrada + '</td><td>' + saida +
		'</td><td><button onclick="obterValoresDaLinha(this)">Obter Valores</button></td></tr>');
	$('#tabelaRegistros tbody').append(newRow);;


	$('#entrada').val('');
	$('#saida').val('');
}


var obterValores = {};

function obterValoresDaLinha(button) {
	var $row = $(button).closest('tr');
	obterValores = {
        entrada: $row.find('td:eq(0)').text(),
        saida: $row.find('td:eq(1)').text()
    };
	var entrada = $row.find('td:eq(0)').text();
	var saida = $row.find('td:eq(1)').text();

	console.log('Entrada:', entrada);
	console.log('Saída:', saida);
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



function subtrairTabelas() {
	var horarioEntrada = obterValores.entrada;
    var horarioSaida = obterValores.saida;
	var marcacaoEntrada = $('#entradaMarcacao').val();
	var marcacaoSaida = $('#saidaMarcacao').val();

	console.log('Valores obtidos:');
	console.log('Horário Entrada:', horarioEntrada);
	console.log('Horário Saída:', horarioSaida);
	console.log('Marcação Entrada:', marcacaoEntrada);
	console.log('Marcação Saída:', marcacaoSaida);


	$.ajax({
		url: '/projeto-marcacoes/horario',
		type: 'POST',
		data: {
			horarioEntrada: horarioEntrada,
			horarioSaida: horarioSaida,
			marcacaoEntrada: marcacaoEntrada,
			marcacaoSaida: marcacaoSaida
		},
		contentType: 'application/json',
		dataType: 'json',
		success: function(result) {
			console.log('Resultado da requisição AJAX:', result);

			if (result && result.entrada && result.saida) {
				alert('Resultado da subtração:\n' +
					'Entrada: ' + result.entrada + '\n' +
					'Saída: ' + result.saida);

				$('#tabelaMarcacoes').html('<tr><td>' + result.entrada + '</td><td>' + result.saida + '</td></tr>');
			} else {
				alert('Resultado da subtração é nulo ou inválido.');
			}
		},
		error: function(error) {
			alert('Não foi possível realizar a subtração\n' + JSON.stringify(error));
		}
	});
}

function calcularHoraExtra() {
	var data = $('#data').val();
	var entrada = $('#entradaHrExtra').val();
	var saida = $('#saidaHrExtra').val();
	var cargaHoraria = $('#cargaHorariaExtra').val();

	var horaExtra = calcularDiferencaHoraExtra(entrada, saida) - cargaHoraria;

	var newRow = $('<tr><td>' + data + '</td><td>' + entrada + '</td><td>' + saida + '</td><td>' + cargaHoraria + '</td><td>' + horaExtra + '</td></tr>');
	$('#tabelaHoraExtra tbody').append(newRow);

	$('#data').val('');
	$('#entradaHrExtra').val('');
	$('#saidaHrExtra').val('');
	$('#cargaHorariaExtra').val('');
}

// Função para calcular a diferença em horas entre dois horários no formato HH:MM
function calcularDiferencaHoraExtra(hora1, hora2) {
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

function calcularAtraso() {

	var data = $('#data').val();
	var entradaPrevista = $('#entradaAtrasada').val();
	var saidaReal = $('#saidaAtrasada').val();

	// Exemplo simples: calcular a diferença entre saída real e entrada prevista
	var atraso = calcularDiferencaHoras(entradaPrevista, saidaReal);


	var newRow = $('<tr><td>' + data + '</td><td>' + entradaPrevista + '</td><td>' + saidaReal + '</td><td>' + atraso + '</td></tr>');
	$('#tabelaAtraso tbody').append(newRow);

	$('#data').val('');
	$('#entradaAtrasada').val('');
	$('#saidaAtrasada').val('');
}


function calcularDiferencaHoras(hora1, hora2) {
	var [hora1h, hora1m] = hora1.split(':').map(Number);
	var [hora2h, hora2m] = hora2.split(':').map(Number);

	var diferencaHoras = hora2h - hora1h;
	var diferencaMinutos = hora2m - hora1m;

	if (diferencaMinutos < 0) {
		diferencaHoras--;
		diferencaMinutos += 60;
	}

	return diferencaHoras + ':' + (diferencaMinutos < 10 ? '0' : '') + diferencaMinutos;
}

function calcularAtrasosHorasExtras(marcacoes, horarioTrabalho) {
	var atrasos = [];
	var horasExtras = [];

	for (var marcacao of marcacoes) {
		for (var horario of horarioTrabalho) {
			var entradaHorario = new Date(`2000-01-01 ${horario.entrada}`);
			var saidaHorario = new Date(`2000-01-01 ${horario.saida}`);
			var entradaMarcacao = new Date(`2000-01-01 ${marcacao.entrada}`);
			var saidaMarcacao = new Date(`2000-01-01 ${marcacao.saida}`);

			if (entradaMarcacao < entradaHorario) {
				atrasos.push({
					inicio: entradaMarcacao.toLocaleTimeString(),
					fim: entradaHorario.toLocaleTimeString()
				});
			}

			if (saidaMarcacao > saidaHorario) {
				horasExtras.push({
					inicio: saidaHorario.toLocaleTimeString(),
					fim: saidaMarcacao.toLocaleTimeString()
				});
			}
		}
	}

	return { atrasos, horasExtras };
}




