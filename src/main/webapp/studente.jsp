<%@page import="model.Appello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.Corso" %>
<%@page import="presentation.AppelloCtrl" %>
<%@ page import="presentation.ShowRecordCtrl"%>
<%@page import="model.Studente" %>
<%@ page import="presentation.PrenotazioneCtrl" %>
<%@ page import="model.Prenotazione" %>
<%@page import="java.util.List" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.LocalTime" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page import="presentation.AddRecordCtrl"%>
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
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body class="bg-light">
  
  <%
  ShowRecordCtrl showCtrl = new ShowRecordCtrl();
  List<Corso> corsi = showCtrl.mostraCorsi();
  Studente s = (Studente) session.getAttribute("studente");
  List<Appello> appelli = (List<Appello>) request.getAttribute("appelli");
  
  //se la prenotazione esiste
  String prenExists = (String) request.getAttribute("errore");
  Integer tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
  if (tabellaAttiva == null) {
	    tabellaAttiva = 1;
	}
  String tabellaNome = "";
  if (tabellaAttiva != 1) {
      tabellaNome = "Appelli";
  } else {
      tabellaNome = "Corsi";
  } %>
  
 <%
 Collections.sort(corsi, new Comparator<Corso>() {
   @Override
   public int compare(Corso c1, Corso c2) {
	   return c1.getMateria().compareTo(c2.getMateria());
   }
 });
 %>
  
 
  
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-scroll pb-4 pt-5">
      <div class="container">
        <a href="index.jsp"><img src="./img/logo.png" alt="" /></a>
        <button
          class="navbar-toggler ps-0"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#navbarExample01"
          aria-controls="navbarExample01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span
            class="navbar-toggler-icon d-flex justify-content-start align-items-center"
          >
            <i class="fas fa-bars"></i>
          </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarExample01">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-3">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#adoptions"
                >About Us</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#foundation"
                >Shortcode</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#help">News</a>
            </li>
            <li class="nav-item">
              <a href="logout" class="nav-link"><i class="bi bi-box-arrow-in-left text-danger"></i> Logout</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- benvenuto -->
    <div class="bg-primary p-5 mb-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Studente - <%=tabellaNome %></h1>
      </div>
    </div>

   <!-- tabella corsi -->
   <div id="tabella1" class="bg-light" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
  				 <% if (corsi.isEmpty()) { %>
   				<div class="container my-5 pb-4">
			      <div class="row justify-content-center">
			        <div class="col-md-6">
			          <div class="card px-5 py-5 shadow">
			            <div class="text-center">
			              <i
			                class="bi bi-chat-dots text-muted"
			                style="font-size: 400%"
			              ></i>
			              <h2>
			                Non ci sono corsi disponibili.<br />
			                Torna fra qualche istante
			              </h2>
			              <p>oppure</p>
			            </div>
			            <div class="text-center"><a href="logout">Logout/Torna alla home</a></div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <% } else { %>
	    <div class="container"><h2 class="m-0 ps-2">I corsi:</h2></div>
	    <div class="container mt-3 mb-5">
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
	          <% for (Corso c : corsi) { 
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
	    <div class="container py-5 text-end">
	    <a href="logout">Logout/Torna alla home</a>
	    </div>
	<% } %>
	</div>
	
			  
		  
		  <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); %>
		<!-- appelli disponibili -->
		<div id="tabella2" class="bg-light pb-5" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
		<% if (appelli != null && !appelli.isEmpty()) { %>
				<%
				Collections.sort(appelli, new Comparator<Appello>() {
					   @Override
					   public int compare(Appello a1, Appello a2) {							        	
					       return a1.getData().compareTo(a2.getData());
					   }
				});
				%>
				<% for (Appello a : appelli) { %>
				<div class="container">
		      <h2 class="m-0 ps-2">
		        Appelli disponibili per il corso di <strong class="text-decoration-underline"><%= a.getCorsoId().getMateria()%></strong>:
		      </h2>
		      </div>
		    <div class="container mt-3 mb-5">
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
		            <td><%= sdf.format(a.getData()) %></td>
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
			<div class="container d-flex justify-content-between pt-5">
			    <a href="javascript:void(0);" class="btnBack">Visualizza i corsi</a>
			    <a href="logout">Logout/Torna alla home</a>
		    </div>
		<% } else { %>
		<div class="container my-5">
			      <div class="row justify-content-center">
			        <div class="col-md-6">
			          <div class="card px-5 py-5 shadow">
			            <div class="text-center">
			              <i
			                class="bi bi-chat-dots text-muted"
			                style="font-size: 400%"
			              ></i>
			              <h2>
			                Non ci sono appelli disponibili per il corso selezionato.<br />
			                <a href="javascript:void(0);" class="btnBack">Seleziona un nuovo appello</a>
			              </h2>
			              <p>oppure</p>
			            </div>
			            <div class="text-center"><a href="logout">Logout/Torna alla home</a></div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <% } %>
		</div>
		
		
		
		
		
		
		
		
		
		
		<% PrenotazioneCtrl controllerPrenot = new PrenotazioneCtrl(); 
		Prenotazione p = (Prenotazione) request.getAttribute("prenotazione"); 
		LocalDateTime oggi = LocalDateTime.now(); 
		DateTimeFormatter dataGiusta = DateTimeFormatter.ofPattern("dd/MM/yyyy 'alle ore' HH:mm"); %>
		
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
		                  Prenotazione effettuata in data: <br /><%=oggi.format(dataGiusta) %><br>
		                </h4>
		                <h4 style="font-weight: normal;">Per il seguente appello:</h4>
		            </div>
		
		            <div class="col-md-4">
		                <strong class="fs-4">Materia:</strong>
		                <p class="fs-4"><%= p.getAppPrenotato().getCorsoId().getMateria() %></p>
		                <strong class="fs-4">Data appello:</strong>
		                <p class="fs-4"><%= sdf.format(p.getAppPrenotato().getData()) %></p>
		                <strong class="fs-4">Nome - Cognome:</strong>
		                <p class="fs-4"><%= p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome()%></p>
		            </div>
		            
		            <div class="col-md-2">
		                <i class="bi bi-check2-circle text-muted" style="font-size: 500%;"></i>
		            </div>
		        </div>
	    	</div>
			<div class="container w-50 d-flex justify-content-between pt-2">
		      <a href="javascript:void(0);" class="btnBack mb-5">Prenota nuovo appello</a>
		      <a href="logout">Logout/Torna alla home</a>
		    </div>
			<% } else {%>
				<div class="container my-5 pb-5">
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
			            <div class="text-center"><a href="logout">Logout/Torna alla home</a></div>
			          </div>
			        </div>
			      </div>
			    </div>
		
			<% } %>
		</div>
		
		

	

	<!-- Footer -->
    <footer class="text-start text-light" style="background-color: #002046">
      <div class="container p-5">
        <div class="row p-5">
          <div class="col-lg-3">
            <a href=""><img src="./img/logo-2.png" alt="" /></a>
            <small class="d-block mt-3 mb-2" style="line-height: 1.8">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est,
              perferendis aperiam! Adipisci voluptatum similique corporis.
            </small>
            <a href=""><i class="bi bi-facebook fs-5"></i></a>
            <a href=""><i class="bi bi-twitter ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-instagram ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-whatsapp ms-3 fs-5"></i></a>
          </div>
          <div class="col-lg-2">
            <h5>Quick Links</h5>
            <ul class="p-0" style="line-height: 2">
              <li>
                <small><a href="">Home</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-2">
            <h5>Pages</h5>
            <ul class="p-0" style="line-height: 2">
              <li>
              	<small><a href="">Home</a></small>
              <li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-5">
            <h5>Contact Us</h5>
            <div class="d-flex gap-3 mb-2 mt-3">
              <input
                type="text"
                placeholder="Name*"
                class="custom-input py-2"
              />
              <input
                type="text"
                placeholder="Email*"
                class="custom-input py-2"
              />
            </div>
            <input
              type="text"
              placeholder="Message*"
              class="custom-input pb-4"
              style="width: 91.5%"
            />
            <button type="button" class="btn btn-primary d-block mt-4 px-4">
              SEND
            </button>
          </div>
        </div>
      </div>
      <div class="bg-light py-3">
        <div class="row">
          <div class="col-12 text-center">
            <p class="text-dark m-0">
              � 2024 Copyright: <strong>Itconsulting</strong>
            </p>
          </div>
        </div>
      </div>
    </footer>
    <script src="./js/studente.js"></script>
</body>
</html>