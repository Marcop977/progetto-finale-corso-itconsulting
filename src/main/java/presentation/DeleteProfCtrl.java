package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import service.ProfessoreService;

import service.ProfessoreServiceImpl;

@WebServlet("/deleteProfessore")
public class DeleteProfCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProfessoreService service = new ProfessoreServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idProfessore = request.getParameter("idProfessore");
		
		HttpSession session;
		
		if (idProfessore != null) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "professore");
			service.deleteProfById(Integer.parseInt(idProfessore));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
	}

}
