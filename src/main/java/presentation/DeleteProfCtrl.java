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

import service.CorsoService;

import service.CorsoServiceImpl;

import service.AppelloService;

import service.AppelloServiceImpl;

@WebServlet("/deleteProfessore")
public class DeleteProfCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProfessoreService service = new ProfessoreServiceImpl();
	CorsoService service1 = new CorsoServiceImpl();
	AppelloService service2 = new AppelloServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idProfessoreStr = request.getParameter("idProfessore");
		int idProfessore = Integer.parseInt(idProfessoreStr);
		
		
		HttpSession session;
		
		if (idProfessoreStr != null) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "professore");
//			service2.deleteAppelloByCorso(service1.getbyProf(idProfessore));
//			service1.deleteCorsoByCattedra(idProfessore);
			service.deleteProfById(idProfessore);
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
	}

}
