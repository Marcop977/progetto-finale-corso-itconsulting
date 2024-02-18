package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import service.AppelloServiceImpl;

import service.AppelloService;

@WebServlet("/deleteAppello")
public class DeleteAppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	AppelloService service = new AppelloServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idAppello = request.getParameter("idAppello");
		System.out.println(idAppello);
		
		HttpSession session;
		
		if (idAppello != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "appello");
			service.deleteAppelloById(Integer.parseInt(idAppello));
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);
		}
		
//		if (!service.isPrenPresente(Integer.parseInt(idAppello))) {
//			System.out.println("service: " + service.isPrenPresente(Integer.parseInt(idAppello)));
//			if (idAppello != "") {
//				session = request.getSession(true);
//				session.setAttribute("tabellaAttiva", "appello");
//				service.deleteAppelloById(Integer.parseInt(idAppello));
//				request.getRequestDispatcher("segreteria.jsp").forward(request, response);
//			}
//		} else {
//			String confermaMessage = "E' presente una prenotazione";
//		    request.setAttribute("confermaMessage", confermaMessage);
//		}
		
	}

}
