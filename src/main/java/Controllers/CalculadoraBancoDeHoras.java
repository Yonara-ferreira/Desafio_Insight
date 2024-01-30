package Controllers;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import com.google.gson.Gson;

import Models.Periodo;
import Service.CalculadoraHoras;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/horario")
public class CalculadoraBancoDeHoras extends HttpServlet{
	
	    private static final long serialVersionUID = 1L;
	    
	    private static final List<Periodo> horarios = new CopyOnWriteArrayList<>();
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	       
	    	String entradaStr = request.getParameter("entrada");
	    	String saidaStr = request.getParameter("saida");
	    	System.out.println("entradaStr: " + entradaStr);
	    	System.out.println("saidaStr: " + saidaStr);


	     
	        if (entradaStr != null && saidaStr != null) {
	         
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	            LocalTime entrada = LocalTime.parse(entradaStr, formatter);
	            LocalTime saida = LocalTime.parse(saidaStr, formatter);
	        
	          
				Periodo horario = new Periodo(entrada, saida);
	            horario.setEntrada(entrada);
	            horario.setSaida(saida);
	 

	            horarios.add(horario);

	           
	            String diferencaFormatada = CalculadoraHoras.calcularDiferenca(entradaStr, saidaStr, "entradaMarcacao", "saidaMarcacao");

	            response.getWriter().write("Horário adicionado com sucesso. Diferença: " + diferencaFormatada);
	        } else {
	 
	            response.getWriter().write("Parâmetros de entrada/saída nulos.");
	        }
	    }
	    
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        
	        String json = new Gson().toJson(horarios);
	        
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        response.getWriter().write(json);
	    }



}
