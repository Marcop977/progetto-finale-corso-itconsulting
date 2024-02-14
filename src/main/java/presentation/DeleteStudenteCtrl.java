package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import service.StudenteService;
import service.StudenteServiceImpl;

@WebServlet("/deleteStudente")
public class DeleteStudenteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	StudenteService service = new StudenteServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String matricolaParametro = request.getParameter("matricola");
		
		if (matricolaParametro != null) {
			int matricola = Integer.parseInt(matricolaParametro);
			service.deleteStudenteById(matricola);
		}
		
		doGet(request, response);
	}

}
