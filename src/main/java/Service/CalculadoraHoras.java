package Service;

import java.time.Duration;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

import Models.Periodo;
import Service.Util.Validador;

public class CalculadoraHoras {

	public List<Periodo> subtrairTabelas(List<Periodo> periodoInicial, List<Periodo> periodoFinal) {
		
		List<Periodo> periodos = periodoInicial.stream().map(periodoTabela1 -> {
	        boolean sobreposicao = periodoFinal.stream()
	                .anyMatch(periodoTabela2 -> Validador.verificarSobreposicao(periodoTabela1, periodoTabela2));

	        return sobreposicao ? subtrairPeriodos(periodoTabela1, periodoFinal) : periodoTabela1;
	    })
	    .collect(Collectors.toList());

	    return periodos;
	    		
	}


	private Periodo subtrairPeriodos(Periodo periodoInicial, List<Periodo> periodoFinal) {
		
		Periodo visualizacaoPeriodos = periodoFinal.stream().filter(periodosTabela -> 
										Validador.verificarSobreposicao(periodoInicial, periodosTabela))
	            .map(periodosTabela -> {
	                LocalTime novaEntrada = periodoInicial.getEntrada().isBefore(periodosTabela.getEntrada())
	                        ? periodosTabela.getSaida()
	                        : periodoInicial.getEntrada();
	                LocalTime novaSaida = periodoInicial.getSaida().isAfter(periodosTabela.getSaida())
	                        ? periodosTabela.getEntrada()
	                        : periodoInicial.getSaida();

	                return new Periodo(novaEntrada, novaSaida);
	            })
	            .findFirst()
	            .orElse(periodoInicial);
		
	    return visualizacaoPeriodos;
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
