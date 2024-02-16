<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page import="java.sql.*"%>
<%@page import="model.Professore" %>
<%@page import="model.Corso" %>
<%@page import="model.Appello" %>
<%@page import="presentation.AppelloCtrl" %>
<%@page import="presentation.CorsoCtrl" %>
<%@page import="model.Prenotazione"%>
<%@page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body class="bg-light">
    <% Professore p = (Professore) session.getAttribute("professore");
    CorsoCtrl corsoController = new CorsoCtrl();
    AppelloCtrl appelloController = new AppelloCtrl();
    int tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
    System.out.println(tabellaAttiva);
    %>

    <!-- navbar -->
    <div class="container mt-5">
      <div class="row align-items-center">
        <div class="col-6 pb-4">
          <a href="index.jsp"><img src="./img/logo.png" alt="" /></a>
        </div>
        <div class="col-6">
          <ul
            class="d-flex gap-5 d-flex align-items-center justify-content-end"
            style="list-style-type: none"
          >
            <li><a href="index.jsp" style="text-decoration: none">HOME</a></li>
            <li><a href="" style="text-decoration: none">ABOUT US</a></li>
            <li><a href="" style="text-decoration: none">SHORTCODE</a></li>
            <li><a href="" style="text-decoration: none">NEWS</a></li>
            <li>
              <a href="logout" style="text-decoration: none">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- benvenuto -->
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Docente</h1>
      </div>
    </div>

    <!-- tabella corsi -->	
	 <div class="container my-5" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
	    <% for (Appello a : appelloController.mostraAppelliByProf(p)) { %>
		<% if (a != null) { %>
	    <div class="container mt-4">
		    <h3 class="mb-3">
		        Per la sua materia: <%= a.getCorsoId().getMateria() %> sono disponibili i seguenti appelli:
		    </h3>
	      <table class="table shadow">
	        <thead>
	          <tr>
	            <th scope="col" class="th-corsi bg-primary text-light">ID Appello</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Data</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Materia</th>
	            <th scope="col" class="th-corsi bg-primary text-light"></th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <th scope="row"><%= a.getIdAppello() %></th>
                <td><%= a.getData() %></td>
                <td><%= a.getCorsoId().getMateria() %></td>
                <td>
	            	<form action="prenotazioni" method="post">
	                	<input type="hidden" name="ID_appello" value="<%=a.getIdAppello() %>">
	                	<button class="btn btn-outline-primary" type="submit"><i class="bi bi-eye"></i></button>
                	</form>
                </td>
	          </tr>
	        </tbody>
	      </table>
	    </div>
	    <div class="container pt-5 mt-5">
	    <a href="index.jsp">Torna alla home</a>
	    </div>
	    <% } else { %>
		<div class="container my-5">
        <h3 class="mb-3">
	        Per la sua materia: <%= a.getCorsoId().getMateria() %> non ci sono appelli disponibili.
	    	</h3>
 		</div>
	    
		<% } } %>
		</div>
	
	
	
	
	
	
	
	
	
	
	


		
	<div class="container my-5" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
		<% List<Prenotazione> prenotazioni = (List<Prenotazione>) request.getAttribute("prenotazioni"); 
			if (prenotazioni != null) {%>
        <% for (Prenotazione p1 : prenotazioni) { %>
        <div class="container mt-4">
		    <h3 class="mb-3">Per il corso di
		        <span class="text-decoration-underline"><%= p1.getAppPrenotato().getCorsoId().getMateria() %></span> in
		        data <%=p1.getAppPrenotato().getData() %> si sono prenotati i seguenti studenti:
	      	</h3>
	      	<% break; } %>
		    <table class="table shadow">
		        <thead>
		            <tr>
		                <th scope="col" class="th-corsi bg-primary text-light">Matricola</th>
		                <th scope="col" class="th-corsi bg-primary text-light">Nome</th>
		                <th scope="col" class="th-corsi bg-primary text-light">Cognome</th>
		            </tr>
	        </thead>
	        <tbody>
	        <% List<Prenotazione> prenotazioni2 = (List<Prenotazione>) request.getAttribute("prenotazioni");%>
	        
	        <% Collections.sort(prenotazioni2, new Comparator<Prenotazione>() {
	            	@Override
		            public int compare(Prenotazione p2, Prenotazione p3) {
		            	String matricola1 = Integer.toString(p2.getStudPrenotato().getMatricola());
		                String matricola2 = Integer.toString(p3.getStudPrenotato().getMatricola());
		                return matricola1.compareTo(matricola2);
		            }
	       		}); %>
	      
				<% for (Prenotazione p4 : prenotazioni) { %>
	            <tr>
	                <th scope="row"><%= p4.getStudPrenotato().getMatricola()  %></th>
	                <td><%= p4.getStudPrenotato().getNome()%></td>
	                <td><%= p4.getStudPrenotato().getCognome() %></td>
	            </tr>
	            <% } %>
	        </tbody>
	    	</table>
    	</div>
	    <div class="container pt-5 mt-5 d-flex justify-content-between">
		    <a href="javascript:void(0);" class="btnBack">Visualizza i corsi</a>
		    <a href="index.jsp">Torna alla home</a>
		</div>
		<% } %>
	</div>




    <!-- Footer -->
    <footer>
      <div class="container-fluid" style="background: #e4e4e4; margin-top: 15vh">
        <div class="container pt-5">
          <div class="row">
            <div class="col-lg-4">
              <h4>Sailor</h4>
              <p>Lorem ipsum, dolor sit amet consectetur adipisicing.</p>
              <p class="m-0"><strong>Phone:</strong> 435452345</p>
              <p><strong>Email:</strong> sdfgssdfg@gdfn.com</p>
            </div>
            <div class="col-lg-2">
              <h6>Useful Links</h6>
              <ul class="list-unstyled">
                <li class="mb-2 mt-3 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Home
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>About us
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Services
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Terms of
                  service
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Privacy policy
                </li>
              </ul>
            </div>
            <div class="col-lg-2">
              <h6>Our Services</h6>
              <ul class="list-unstyled">
                <li class="mb-2 mt-3 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Payments
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Shipping
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Product
                  Returns
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>FAQ
                </li>
                <li class="mb-2 fw-light">
                  <i class="bi bi-chevron-right riduci-icona"></i>Shop Checkout
                </li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h6>Our Newsletter</h6>
              <p>Lorem ipsum, dolor sit amet consectetur adipisicing.</p>
              <div class="input-group">
                <input type="text" class="form-control" />
                <button type="button" class="btn btn-primary">Subscribe</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 py-4" style="background: #dbdbdb">
        <div class="text-center">
          <p>© Copyright <strong>Itconsulting</strong>. All Rights Reserved</p>
        </div>
      </div>
    </footer>
	 <script>
	 document.addEventListener("DOMContentLoaded", function() {
	        let btnsBack = document.querySelectorAll(".btnBack");
	        btnsBack.forEach(function(btnBack) {
	            btnBack.addEventListener("click", function() {
	                console.log("ciao");
	                window.history.back();
	            });
	        });
	  });  	      
    </script>    
  </body>
</html>
