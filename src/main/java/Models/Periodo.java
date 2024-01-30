package Models;

import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Periodo {

	private LocalTime entrada;
	private LocalTime saida;
	
	

	public void setEntrada(LocalTime entrada) {
		this.entrada = entrada;
	}

	public void setSaida(LocalTime saida) {
		this.saida = saida;
	}

	public Periodo(String entrada, String saida) {
		this.entrada = converterParaLocalTime(entrada);
		this.saida = converterParaLocalTime(saida);
	}

	public Periodo(LocalTime novaEntrada, LocalTime novaSaida) {
		this.entrada = novaEntrada;
		this.saida = novaSaida;
	}

	public LocalTime getEntrada() {
		return entrada;
	}

	public LocalTime getSaida() {
		return saida;
	}

	public Duration calcularDiferenca(Periodo periodo) {
		return Duration.ofHours(this.entrada.getHour() - periodo.getSaida().getHour())
				.plusMinutes(this.entrada.getMinute() - periodo.getSaida().getMinute());
	}

	private LocalTime converterParaLocalTime(String horario) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		return LocalTime.parse(horario, formatter);
	}

	
}
