package Controllers;
import java.io.IOException;

import Service.CalculadoraHoras;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/calculoHoras")
public class CalculadoraBancoDeHoras extends HttpServlet{
	
	    private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String entradaHorario = request.getParameter("entradaHorario");
	        String saidaHorario = request.getParameter("saidaHorario");
	        String entradaMarcacao = request.getParameter("entradaMarcacao");
	        String saidaMarcacao = request.getParameter("saidaMarcacao");

	        String resultado = CalculadoraHoras.calcularDiferenca(entradaHorario, saidaHorario, entradaMarcacao, saidaMarcacao);
	        
	     
	        response.setContentType("text/plain");
	        response.getWriter().write(resultado);
	    }

	

}
