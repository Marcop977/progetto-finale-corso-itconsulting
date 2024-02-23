<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page import="java.sql.*"%>
<%@page import="model.Professore" %>
<%@page import="model.Corso" %>
<%@page import="model.Appello" %>
<%@page import="presentation.AppelloCtrl" %>
<%@ page import="presentation.ShowRecordCtrl"%>
<%@page import="model.Prenotazione"%>
<%@page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body class="bg-light">
    <% Professore p = (Professore) session.getAttribute("professore");
    ShowRecordCtrl showController = new ShowRecordCtrl();
    AppelloCtrl appelloController = new AppelloCtrl();
    int tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
    List<Appello> appelli = (List<Appello>) request.getAttribute("appelli");
    List<Prenotazione> prenotazioni = (List<Prenotazione>) request.getAttribute("prenotazioni");
    String appelloAggiunto = (String) request.getAttribute("appelloAggiunto");
    String tabellaNome = "";
    
    if (tabellaAttiva == 1)
    	tabellaNome = "Corsi";
    else if (tabellaAttiva == 2)
    	tabellaNome = "Appelli";
    else if (tabellaAttiva == 3)
    	tabellaNome = "Prenotazioni";
    	
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
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
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Docente - <%=tabellaNome %></h1>
      </div>
    </div>
    

	<!-- tabella corsi -->	
	<div class="container my-5" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
		<% if (p != null && !showController.mostraCorsiByProf(p.getIdProfessore()).isEmpty()) { %>
		<div class="container mt-4">
			<h3 class="mb-3">I suoi corsi:</h3>
		</div>
		<table class="table shadow">
			<tr>
				<th scope="col" class="th-corsi bg-primary text-light">ID corso</th>
				<td scope="col" class="th-corsi bg-primary text-light">Materia</td>
				<td scope="col" class="th-corsi bg-primary text-light">Appello</td>
			</tr>
			<% if (p != null) { %>
			<%
			Collections.sort(showController.mostraCorsiByProf(p.getIdProfessore()), new Comparator<Corso>() {
				   @Override
				   public int compare(Corso c1, Corso c2) {
					   return c1.getMateria().compareTo(c2.getMateria());
				   }
			   });
			%>
			<% for (Corso c : showController.mostraCorsiByProf(p.getIdProfessore())) { %>
			<tr>
				<td scope="row" class="p-4"><%=c.getIdCorso() %></td>
				<td><%=c.getMateria() %></td>
				<td>
					<form action="appello" method="post">
						<input type="date" name="dataAppello" class="appelloData" style="margin-right: 10px; border: none; border-bottom: 1px solid grey; border-radius: 2px">
						<input type="hidden" name="idCorso" value="<%=c.getIdCorso() %>" class="btn btn-primary">
						<button type="submit" name="add" class="btn btn-success addAppello"><i class="bi bi-plus-lg"></i></button>
						<button type="submit" name="view" class="btn btn-outline-primary">Visualizza appelli</button>
					</form>
				</td>
			</tr>
			<% } } %>
		</table>
		<% } else { %>
			<div class="container my-5 pb-5">
			    <div class="row justify-content-center">
			        <div class="col-md-6">
			          <div class="card px-5 py-5 shadow">
			            <div class="text-center">
			              <i
			                class="bi bi-file-earmark text-muted"
			                style="font-size: 400%"
			              ></i>
			              <h2 class="mb-3">
			                Non ci sono corso disponibili.
			              </h2>	              
			              <a href="logout">Effettua logout/Torna alla home</a>
			            </div>
			          </div>
			        </div>
			      </div>
			</div>
			<% } %>
			<div class="container text-end pt-5 mt-5">
		      <a href="logout">Logout/Torna alla home</a>
		    </div>
	</div>
	
	<div class="alert alert-success alertAggiunto fixed-bottom w-50 text-center ms-auto" style="display: none"></div>
	
	
	<!-- tabella appelli -->
	<div class="container my-5" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
	<% if (appelli != null && !appelli.isEmpty()) { %>
		<div class="container mt-4 mb-3">
			<h3>Appelli per il corso di <strong class="text-decoration-underline"><%=appelli.get(0).getCorsoId().getMateria() %></strong>:</h3>
		</div>
		<table class="table shadow">
			<tr>
				<th scope="col" class="th-corsi bg-primary text-light">ID appello</th>
				<td scope="col" class="th-corsi bg-primary text-light">Data</td>
				<td scope="col" class="th-corsi bg-primary text-light">Prenotazioni</td>
			</tr>
			<% Collections.sort(appelli, new Comparator<Appello>() {
			    @Override
			    public int compare(Appello a1, Appello a2) {
			    	Date dataAppello1 = a1.getData();
			    	Date dataAppello2 = a2.getData();
			    	
			        return dataAppello1.compareTo(dataAppello2);
			    }
				});
			%>
			<% for (Appello a : appelli) { %>
			<tr>
				<td scope="row" class="p-4"><%=a.getIdAppello() %></td>
				<td><%=sdf.format(a.getData()) %></td>
				<td>
					<form action="prenotazioni" method="post">
						<input type="hidden" value="<%=a.getIdAppello() %>" name="ID_appello">
						<input type="submit" value="Visualizza prenotazioni" class="btn btn-outline-primary">
					</form>
				</td>
			</tr>
			<% } %>
		</table>
		<div class="container d-flex justify-content-between pt-5 mt-5">
		      <a href="javascript:void(0);" class="btnBack mb-5">Visualizza i corsi</a>
		      <a href="logout">Logout/Torna alla home</a>
		    </div>
		<% } else { %>
			<div class="container my-5 pb-5">
				    <div class="row justify-content-center">
				        <div class="col-md-6">
				          <div class="card px-5 py-5 shadow">
				            <div class="text-center">
				              <i
				                class="bi bi-file-earmark text-muted"
				                style="font-size: 400%"
				              ></i>
				              <h2 class="mb-3">
				                Non ci sono appelli disponibili.
				              <a href="javascript:void(0);" class="btnBack">Seleziona un nuovo appello</a><br>
				              </h2>
				              <p>oppure</p>			              
				              <a href="logout">Effettua logout</a>
				            </div>
				          </div>
				        </div>
				 </div>
			</div>
		<% } %>
	</div>
	
	
	
	
	<!-- tabella prenotazioni -->
	<div class="container my-5" <% if (tabellaAttiva != 3) out.print("style=\"display:none;\""); %>>
	<% if (prenotazioni != null && !prenotazioni.isEmpty()) { %> <!-- prenotazioni.get(0) perché mi restituisce 1 record essendo la prenotazione unica -->
		<div class="container mt-4 mb-3">
			<h3>Prenotazioni per l'appello di <strong class="text-decoration-underline"><%=prenotazioni.get(0).getAppPrenotato().getCorsoId().getMateria() %></strong> in data <strong><%=sdf.format(prenotazioni.get(0).getAppPrenotato().getData()) %></strong>:</h3>
		</div>
		<table class="table shadow">
			<tr>
				<th scope="col" class="th-corsi bg-primary text-light">ID prenotazione</th>
				<td scope="col" class="th-corsi bg-primary text-light">Studente</td>
				<td scope="col" class="th-corsi bg-primary text-light">Data</td>
				<td scope="col" class="th-corsi bg-primary text-light">Materia</td>
			</tr>
			<% Collections.sort(prenotazioni, new Comparator<Prenotazione>() {
			    @Override
			    public int compare(Prenotazione p1, Prenotazione p2) {
			    	String nomePren1 = p1.getStudPrenotato().getNome();
			    	String nomePren2 = p2.getStudPrenotato().getNome();
			    	
			        return nomePren1.compareTo(nomePren2);
			    }
				});
			%>
			<% for (Prenotazione p1 : prenotazioni) { %>
			<tr>
				<td scope="row" class="p-4"><%=p1.getIdPrenotazione() %></td>
				<td><%=p1.getStudPrenotato().getNome() + " " + p1.getStudPrenotato().getCognome() %></td>
				<td><%=sdf.format(p1.getAppPrenotato().getData()) %></td>
				<td><%=p1.getAppPrenotato().getCorsoId().getMateria() %></td>
			</tr>
			<% } %>
		</table>
			<div class="container d-flex justify-content-between pt-5 mt-5">
		      <a href="javascript:void(0);" class="btnBack mb-5">Visualizza appelli</a>
		      <a href="logout">Logout/Torna alla home</a>
		    </div>
	<% } else { %>
	<div class="container my-5 pb-5">
	    <div class="row justify-content-center">
	        <div class="col-md-6">
	          <div class="card px-5 py-5 shadow">
	            <div class="text-center">
	              <i
	                class="bi bi-file-earmark text-muted"
	                style="font-size: 400%"
	              ></i>
	              <h2 class="mb-3">
	                Non ci sono prenotazioni disponibili.<br>
	               <a href="javascript:void(0);" class="btnBack">Seleziona una nuova prenotazione</a><br>
	              </h2>
			       <p>oppure</p>			              
			       <a href="logout">Effettua logout/Torna alla home</a>
	            </div>
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
              © 2024 Copyright: <strong>Itconsulting</strong>
            </p>
          </div>
        </div>
      </div>
    </footer>
    <script src="./js/professore.js"></script>
	 <script>
	 <% if (appelloAggiunto != null) { %>
		 	alertAggiunto.style.display = "block";
		 	const alertTitolo = document.createElement("h2");
	        alertTitolo.textContent = "<%=appelloAggiunto %>";
	        alertAggiunto.appendChild(alertTitolo);
		 	<% if (appelloAggiunto.equals("C'è stato un errore. Appello già esistente")) { %>
		 		alertAggiunto.setAttribute("class", "alert alert-danger alertAggiunto fixed-bottom w-50 text-center ms-auto");
		 	<% } %>
		 	setTimeout(() => {
		 		alertAggiunto.style.display = "none";
		 	}, 3000);
	 <% } %>
    </script>    
  </body>
</html>
