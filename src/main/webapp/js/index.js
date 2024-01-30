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