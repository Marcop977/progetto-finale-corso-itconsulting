package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import service.CorsoService;

import service.CorsoServiceImpl;

@WebServlet("/deleteCorso")
public class DeleteCorsoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CorsoService service = new CorsoServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idCorso = request.getParameter("idCorso");
		
		HttpSession session;
		
		if (idCorso != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "corso");
			service.deleteCorsoById(Integer.parseInt(idCorso));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

}
