package Models;

import java.util.List;

public class HorarioTrabalho {
	
    private List<Periodo> registros;

   
    public HorarioTrabalho(List<Periodo> periodos) {
        this.registros = periodos;
    }
   
    public void adicionarPeriodo(Periodo registro) {
        registros.add(registro);
    }
   
    public List<Periodo> getPeriodos() {
        return registros;
    }

}
