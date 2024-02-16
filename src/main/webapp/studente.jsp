<%@page import="model.Appello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="presentation.AddStudenteCtrl" %>
<%@ page import="presentation.CorsoCtrl" %>
<%@ page import="model.Corso" %>
<%@page import="presentation.AppelloCtrl" %>
<%@page import="model.Studente" %>
<%@ page import="presentation.PrenotazioneCtrl" %>
<%@ page import="model.Prenotazione" %>
<%@page import="java.util.List" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.LocalTime" %>


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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body class="bg-light">
  
  <% AddStudenteCtrl studCtrl = new AddStudenteCtrl();
  CorsoCtrl corsoCtrl = new CorsoCtrl();
  Studente s = (Studente) session.getAttribute("studente");
  System.out.println("Studente: " + s);
  AppelloCtrl controller = new AppelloCtrl();
  String prenExists = (String) request.getAttribute("errore");
  Integer tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
  if (tabellaAttiva == null) {
	    tabellaAttiva = 1;
	}
  System.out.println(tabellaAttiva + " tabella attiva");%>
  
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
              <a href="logout" style="text-decoration: none;">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- benvenuto -->
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Studente - Matricola <%=s.getMatricola() %></h1>
      </div>
    </div>

   <!-- tabella corsi -->
   <div id="tabella1" class="bg-light p-5" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
	    <div class="container"><h2 class="m-0 ps-2"> Tabella corsi</h2></div>
	    <div class="container mt-4 mb-5">
	      <table class="table shadow">
	        <thead>
	          <tr>
	            <th scope="col" class="th-corsi bg-primary text-light">ID corso</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Materia</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Docente</th>
	            <th scope="col" class="th-corsi bg-primary text-light">ID appello</th>
	          </tr>
	        </thead>
	        <tbody>
	          <% for (Corso c : corsoCtrl.mostraCorsi()) { 
	          %>
	          <tr>
	            <th scope="row" class="p-4"><%= c.getIdCorso() %></th>
	            <td><%= c.getMateria() %></td>
	            <td><%= c.getProfessore().getNome() + " " + c.getProfessore().getCognome() %></td>
	            <td>
	            	<form action="appello" method="post">
	            	<input type="hidden" name="materia" value="<%=c.getIdCorso() %>">
	            	<button class="btn btn-outline-primary" type="submit">Visualizza Appello</button>
	            	</form>
	            </td>
	          </tr>
	          <% } %>
	        </tbody>
	      </table>
	    </div>
	    <div class="container pt-5 text-end">
	    <a href="index.jsp">Torna alla home</a>
	    </div>
	</div>
	
			  
		  
		  
		<!-- appelli disponibili -->
		<div id="tabella2" class="bg-light px-5 pt-5 pb-0" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
		<% List<Appello> appelli = (List<Appello>) request.getAttribute("appelli"); %>
		<% if (appelli != null) { %>
				<% for (Appello a : appelli) { %>
				<div class="container">
		      <h2 class="m-0 ps-2">
		        Per il corso di <span class="text-decoration-underline"><%= a.getCorsoId().getMateria()%></span> sono disponibili i seguenti appelli:
		      </h2>
		      </div>
		    <div class="container mt-4 mb-5">
		      <table class="table shadow">
		        <thead>
		          <tr>
		            <th scope="col" class="th-corsi bg-primary text-light">ID Appello</th>
		            <th scope="col" class="th-corsi bg-primary text-light">Data</th>
		            <th scope="col" class="th-corsi bg-primary text-light">Materia</th>
		            <th scope="col" class="th-corsi bg-primary text-light">Docente</th>
		            <th scope="col" class="th-corsi bg-primary"></th>
		          </tr>
		        </thead>
		        <% break; }%>
		        <tbody>
		        <% for (Appello a : appelli) { %>
		          <tr>
		            <th scope="row" class="p-4"><%= a.getIdAppello() %></th>
		            <td><%= a.getData() %></td>
		            <td class="ms-5"><%= a.getCorsoId().getMateria() %></td>
		            <td><%= a.getCorsoId().getProfessore().getNome() + " " + a.getCorsoId().getProfessore().getCognome()%></td>
		            <td>
		            <form action="prenota" method="post">
			            <input type="hidden" name="appello" value="<%= a.getIdAppello() %>">
			            <button id="btnPrenota" class="btn btn-outline-primary" type="submit">
			                Prenota
			            </button>
			        </form> 	
		            </td>
		          </tr>
				<% } %>
		        </tbody>
		      </table>
		    </div>
			<div class="container pt-5 d-flex justify-content-between">
		    <a href="javascript:void(0);" class="btnBack">Torna indietro</a>
		    <a href="index.jsp">Torna alla home</a>
		    </div>
		<% } %>
		</div>
		
		
		<% PrenotazioneCtrl controllerPrenot = new PrenotazioneCtrl(); 
		Prenotazione p = (Prenotazione) request.getAttribute("prenotazione"); 
		LocalDateTime oggi = LocalDateTime.now(); %>
		
		<div id="tabella3" <% if (tabellaAttiva != 3) out.print("style=\"display:none;\""); %>>
		        <% if (p != null) {%>
	        <div class="container w-50 mt-5">
	            <h2>Prenotazione effettuata con successo.</h2>
	        </div>
	        <div class="container mt-3 mb-5 w-50 p-5 shadow">
		        <div class="row">
		            <div class="col-md-6 pt-1">
		                <h4 class="mb-3" style="font-weight: normal;">
		                  Studente: <span style="text-decoration: underline;"><%=p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome() %></span> <br />
		                  Prenotazione effettuata in data: <br /><%=oggi.toLocalDate() %> alle ore <%=oggi.getHour() + ":" + oggi.getMinute() %><br>
		                </h4>
		                <h4 style="font-weight: normal;">Per il seguente appello:</h4>
		            </div>
		
		            <div class="col-md-4">
		                <strong class="fs-4">Materia:</strong>
		                <p class="fs-4"><%= p.getAppPrenotato().getCorsoId().getMateria() %></p>
		                <strong class="fs-4">Data:</strong>
		                <p class="fs-4"><%= p.getAppPrenotato().getData() %></p>
		                <strong class="fs-4">Nome - Cognome:</strong>
		                <p class="fs-4"><%= p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome()%></p>
		            </div>
		            
		            <div class="col-md-2">
		                <i class="bi bi-check2-circle text-muted" style="font-size: 500%;"></i>
		            </div>
		        </div>
	    	</div>
			<div class="container w-50 d-flex justify-content-between pt-2">
		      <a href="javascript:void(0);" class="btnBack">Prenota nuovo appello</a>
		      <a href="index.jsp">Torna alla home</a>
		    </div>
	        	<% } %>
		</div>
		
			<% if (prenExists != null) {%>
				<div class="container mt-5">
			      <div class="row justify-content-center">
			        <div class="col-md-6">
			          <div class="card px-5 py-5 shadow">
			            <div class="text-center">
			              <i
			                class="bi bi-exclamation-triangle text-muted"
			                style="font-size: 400%"
			              ></i>
			              <h2>
			                Prenotazione esistente. <br />
			                <a href="javascript:void(0);" class="btnBack">Prenota un nuovo appello</a>
			              </h2>
			              <p>oppure</p>
			            </div>
			            <div class="text-center"><a href="index.jsp">Torna alla home</a></div>
			          </div>
			        </div>
			      </div>
			    </div>
		
			<% } %>
		

	

	<!-- Footer -->
    <footer>
      <div class="container-fluid" style="background: #e4e4e4; margin-top: 12vh">
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