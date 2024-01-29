package Service.Util;

import Models.Periodo;

public class Validador {
	
	public static boolean verificarSobreposicao(Periodo periodoInicial, Periodo periodoFinal) {
		return periodoInicial.getEntrada().isBefore(periodoFinal.getSaida())
				&& periodoInicial.getSaida().isAfter(periodoFinal.getEntrada());
	}
	
}
