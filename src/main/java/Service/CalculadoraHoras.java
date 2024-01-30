package Service;

import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import Models.Periodo;
import Service.Util.Validador;

public class CalculadoraHoras {
	
	public static Map<String, LocalTime> subtrairTabelas(String horarioEntrada, String horarioSaida,
	        String marcacaoEntrada, String marcacaoSaida) {
	    try {
	        LocalTime entradaHorario = LocalTime.parse(horarioEntrada);
	        LocalTime saidaHorario = LocalTime.parse(horarioSaida);
	        LocalTime entradaMarcacao = LocalTime.parse(marcacaoEntrada);
	        LocalTime saidaMarcacao = LocalTime.parse(marcacaoSaida);

	        Periodo horarioDeTrabalho = new Periodo(entradaHorario, saidaHorario);
	        Periodo marcacoesFeitas = new Periodo(entradaMarcacao, saidaMarcacao);

	        List<Periodo> resultadoSubtracao = subtrairPeriodos(horarioDeTrabalho, Collections.singletonList(marcacoesFeitas));

	        Map<String, LocalTime> result = new HashMap<>();
	        result.put("entrada", resultadoSubtracao.get(0).getEntrada());
	        result.put("saida", resultadoSubtracao.get(0).getSaida());

	        return result;
	    } catch (DateTimeParseException e) {
	        e.printStackTrace();
	        return null;
	    }
	}


	private static List<Periodo> subtrairPeriodos(Periodo periodoInicial, List<Periodo> periodoFinal) {
	    return periodoFinal.stream()
	            .filter(periodoTabela -> Validador.verificarSobreposicao(periodoInicial, periodoTabela))
	            .map(periodoTabela -> {
	                LocalTime novaEntrada = periodoInicial.getEntrada().isBefore(periodoTabela.getEntrada())
	                        ? periodoTabela.getSaida()
	                        : periodoInicial.getEntrada();
	                LocalTime novaSaida = periodoInicial.getSaida().isAfter(periodoTabela.getSaida())
	                        ? periodoTabela.getSaida()
	                        : periodoInicial.getSaida();
	                return new Periodo(novaEntrada, novaSaida);
	            })
	            .collect(Collectors.toList());
	}



	public static String calcularDiferenca(String entradaHorario, String saidaHorario, String entradaMarcacao,
			String saidaMarcacao) {

		Periodo horarioDeTrabalho = new Periodo(entradaHorario, saidaHorario);
		Periodo marcacoesFeitas = new Periodo(entradaMarcacao, saidaMarcacao);

		Duration diferenca = horarioDeTrabalho.calcularDiferenca(marcacoesFeitas);

		Long horas = diferenca.toHours();
		int minutos = diferenca.toMinutesPart();

		return String.format("%02d:%02d", horas, minutos);
	}

}
