<%@page import="model.Appello"%>
<%@page import="model.Professore"%>
<%@page import="model.Studente"%>
<%@page import="model.Corso"%>
<%@page import="model.Prenotazione"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="presentation.AddRecordCtrl"%>
    <%@ page import="presentation.ShowRecordCtrl"%>
     <%@page import="java.text.SimpleDateFormat" %>
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
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <style>
    .errore {
		border-color: red;
	}
    </style>
    <title>Document</title>
  </head>
  <body class="bg-light">
  
 
  
   <% ShowRecordCtrl showController = new ShowRecordCtrl();
   List<Studente> studenti = showController.mostraStudenti();
   List<Professore> professori = showController.mostraProfessori();
   List<Corso> corsi = showController.mostraCorsi();
   List<Appello> appelli = showController.mostraAppelli();
   List<Prenotazione> prenotazioni = showController.mostraPrenotazioni(); %>
   
   <%
   Collections.sort(studenti, new Comparator<Studente>() {
	   @Override
	   public int compare(Studente s1, Studente s2) {
		   return s1.getCognome().compareTo(s2.getCognome());
	   }
   });
   
   Collections.sort(professori, new Comparator<Professore>() {
	  @Override
	  public int compare(Professore p1, Professore p2) {
		  return p1.getCognome().compareTo(p2.getCognome());
	  }
   });
   
   Collections.sort(corsi, new Comparator<Corso>() {
	   @Override
	   public int compare(Corso c1, Corso c2) {
		   return c1.getMateria().compareTo(c2.getMateria());
	   }
   });
   
   Collections.sort(appelli, new Comparator<Appello>() {
       @Override
       public int compare(Appello a1, Appello a2) {							        	
           return a1.getData().compareTo(a2.getData());
       }
   });
   
   Collections.sort(prenotazioni, new Comparator<Prenotazione>() {
	   @Override
	   public int compare(Prenotazione p1, Prenotazione p2) {
		   return p1.getAppPrenotato().getData().compareTo(p2.getAppPrenotato().getData());
	   }
   });
   %>
   
   
  <% String tabellaAttiva = (String) session.getAttribute("tabellaAttiva");
   if (tabellaAttiva == null) {
	    tabellaAttiva = "studente";
	}
   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); %>
  
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
        <h1 class="text-light">Segreteria</h1>
      </div>
    </div>
    
    <!-- scelta azione -->
	<div class="container">
		<div class="btn-group">
			<button id="btnStud" class="bottone" data-tabella-id="studente">Aggiungi Studente</button>
			<button id="btnProf" class="bottone" data-tabella-id="professore">Aggiungi Professore</button>
			<button id="btnCorso" class="bottone" data-tabella-id="corso">Aggiungi Corso</button>
			<button id="btnAppello" class="bottone" data-tabella-id="appello">Aggiungi Appello</button>
			<button id="btnPren" class="bottone" data-tabella-id="prenotazione">Aggiungi Prenotazione</button>
		</div>
	</div>
	<input type="hidden" id="tabellaAttivaInput" name="tabellaAttiva" value="0">


	<!-- aggiungi studente -->
	<div class="container my-5 studente tabella" >
		<div class="row">
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-white p-5 rounded-3 shadow formAggiungi studenteAggiungi" style="margin-bottom: 100px">
				<h3 class="mb-4">Aggiungi studente</h3>
				<form action="addRecord" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nomeStudente" placeholder="Inserisci nome" class="form-control bg-light compilaCampo" maxlength="45"><br>
						<label>Cognome:</label>
						<input type="text" name="cognomeStudente" placeholder="Inserisci cognome" class="form-control bg-light compilaCampo" maxlength="45"><br>
						<label>Username:</label>
						<input type="text" name="usernameStudente" placeholder="Inserisci username" class="form-control bg-light compilaCampo" maxlength="10"><br>
						<label>Password:</label>
						<input type="text" name="passwordStudente" placeholder="Inserisci password" class="form-control bg-light compilaCampo" maxlength="5"><br>
						<input type="submit" value="Aggiungi" class="btn btn-success w-100 btnControllo">
						<div class="text-danger erroreFeedback"></div>
					</div>
				</form>
			</div>
			<div class="p-5 rounded-3 shadow formModifica studenteModifica" style="display: none; margin-bottom: 100px; border: 1px solid black">
				<h3 class="mb-4">Modifica studente</h3>
				<form action="updateRecord" method="post">
					<div class="w-100">
						<input type="hidden" name="idUtente" class="form-control compilaCampo">
						<label>Nome:</label>
						<input type="text" name="nomeModifica" placeholder="Inserisci nome" class="form-control compilaCampo" maxlength="45"><br>
						<label>Cognome:</label>
						<input type="text" name="cognomeModifica" placeholder="Inserisci cognome" class="form-control compilaCampo" maxlength="45"><br>
						<label>Username:</label>
						<input type="text" name="usernameModifica" placeholder="Inserisci username" class="form-control compilaCampo" maxlength="10"><br>
						<label>Password:</label>
						<input type="text" name="passwordModifica" placeholder="Inserisci password" class="form-control compilaCampo" maxlength="5"><br>
						<input type="hidden" name="tipo_utente" class="form-control compilaCampo">
						<input type="submit" value="Modifica" class="btn btn-success w-100 btnControllo mb-3">
						<input type="button" value="Annulla" class="btn btn-secondary w-100">
						<div class="text-danger erroreFeedback"></div>
					</div>
				</form>
			</div>
			
			
			<a href="logout" class="mb-3">Logout/Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<div class="col-md-7">
		<table class="table shadow">
			<thead>
				<tr>
					<th scope="col" class="th-corsi bg-primary text-light">Matricola</th>
					<th scope="col" class="th-corsi bg-primary text-light">Studente</th>
					<th scope="col" class="th-corsi bg-primary text-light">Username</th>
					<th scope="col" class="th-corsi bg-primary text-light">Password</th>
					<th scope="col" class="th-corsi bg-primary text-light"></th>
				</tr>
			</thead>
			<tbody>
				<% for (Studente s : studenti) { %>
				<tr>
					<th scope="row" class="p-4"><%=s.getMatricola() %></th>
					<td><%=s.getNome() + " " + s.getCognome() %></td>
					<td><%=s.getUsername() %></td>
					<td><%=s.getPassword() %></td>
					
					<td style="display: none"><%= s.getTipoUtente() %></td>
					
					<td class="align-middle">
				        <div class="d-inline-block me-2">
				        	<button class="btn btn-success btnEdit"><i class="bi bi-pencil-square fs-5"></i></button>
				        </div>
				        <div class="d-inline-block">
				            <form action="deleteRecord" method="post">
				                <input type="hidden" name="matricola" value="<%=s.getMatricola() %>">
				                <button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
				            </form>
				        </div>
				    </td>
				</tr>
				<% } %>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	<!-- aggiungi professore -->
	<div class="container my-5 professore tabella" style="display: none" data-tabella="professore">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-white p-5 rounded-3 shadow formAggiungi professoreAggiungi" style="margin-bottom: 100px">
				<h3 class="mb-4">Aggiungi docente</h3>
				<form action="addRecord" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nomeProf" placeholder="Inserisci nome" class="form-control bg-light compilaCampo" maxlength="45"><br>
						<label>Cognome:</label>
						<input type="text" name="cognomeProf" placeholder="Inserisci cognome" class="form-control bg-light compilaCampo" maxlength="45"><br>
						<label>Username:</label>
						<input type="text" name="usernameProf" placeholder="Inserisci username" class="form-control bg-light compilaCampo" maxlength="10"><br>
						<label>Password:</label>
						<input type="text" name="passwordProf" placeholder="Inserisci password" class="form-control bg-light compilaCampo" maxlength="5"><br>
						<input type="submit" value="Aggiungi" class="btn btn-success w-100 btnControllo">
						<div class="text-danger erroreFeedback"></div> 
					</div>
				</form>
			</div>
			<div class="p-5 rounded-3 shadow formModifica professoreModifica" style="display: none; margin-bottom: 100px; border: 1px solid black">
				<h3 class="mb-4">Modifica docente</h3>
				<form action="updateRecord" method="post">
					<div class="w-100">
						<input type="hidden" name="idUtente" class="form-control compilaCampo">
						<label>Nome:</label>
						<input type="text" name="nomeModifica" placeholder="Inserisci nome" class="form-control compilaCampo" maxlength="45"><br>
						<label>Cognome:</label>
						<input type="text" name="cognomeModifica" placeholder="Inserisci cognome" class="form-control compilaCampo" maxlength="45"><br>
						<label>Username:</label>
						<input type="text" name="usernameModifica" placeholder="Inserisci username" class="form-control compilaCampo" maxlength="10"><br>
						<label>Password:</label>
						<input type="text" name="passwordModifica" placeholder="Inserisci password" class="form-control compilaCampo" maxlength="5"><br>
						<input type="hidden" name="tipo_utente" class="form-control compilaCampo">
						<input type="submit" value="Modifica" class="btn btn-success w-100 btnControllo mb-3">
						<input type="button" value="Annulla" class="btn btn-secondary w-100">
						<div class="text-danger erroreFeedback"></div>
					</div>
				</form>
			</div>
			<a href="logout" class="mb-3">Logout/Torna alla home</a>
		</div>
		
		
		<div class="col-md-1"></div>
		

		<div class="col-md-7">
		<table class="table shadow">
			<thead>
				<tr>
					<th scope="col" class="th-corsi bg-primary text-light">ID</th>
					<th scope="col" class="th-corsi bg-primary text-light">Professore</th>
					<th scope="col" class="th-corsi bg-primary text-light">Username</th>
					<th scope="col" class="th-corsi bg-primary text-light">Password</th>
					<th scope="col" class="th-corsi bg-primary text-light"></th>
				</tr>
			</thead>
			<tbody>
				<% for (Professore p : professori) { %>
				<tr>
					<th scope="row" class="p-4"><%=p.getIdProfessore() %></th>
					<td><%=p.getNome() + " " + p.getCognome() %></td>
					<td><%=p.getUsername() %></td>
					<td><%=p.getPassword() %></td>
					<td style="display: none"><%=p.getTipoUtente() %></td>
					<td>
						<div class="align-middle">
							<div class="d-inline-block me-2">
						        	<button class="btn btn-success btnEdit"><i class="bi bi-pencil-square fs-5"></i></button>
						    </div>
						    <div class="d-inline-block">
								<form action="deleteRecord" method="post">
									<input type="hidden" name="idProfessore" value="<%=p.getIdProfessore() %>">
									<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
								</form>
							</div>
						</div>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	<!-- aggiungi corso -->
	<div class="container my-5 corso tabella" data-tabella="corso">
		<div class="row">
			<div class="col-md-4 d-flex flex-column">
				<div class="bg-white p-5 rounded-3 shadow corsoAggiungi" style="margin-bottom: 100px">
					<h3 class="mb-4">Aggiungi corso</h3>
					<form action="addRecord" method="post">
						<div class="w-100">
							<label>Corso:</label>
							<input type="text" name="corso" placeholder="Inserisci corso" class="form-control compilaCampo" maxlength="25"><br>
							<label>Docente:</label>
							  <select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idProfessore">
							    <option selected disabled>-- Seleziona un docente --</option>
							    <% for (Professore p : professori) { %>
							    <option value="<%=p.getIdProfessore() %>"><%=p.getNome() + " " + p.getCognome() %></option>
							    <% } %>
							  </select>
							<input type="submit" value="Aggiungi" class="btn btn-success w-100 btnControllo">
							<div class="text-danger erroreFeedback"></div> 
						</div>
					</form>
				</div>
				<div class="p-5 rounded-3 shadow corsoModifica" style="display: none; margin-bottom: 100px; border: 1px solid black">
					<h3 class="mb-4">Modifica corso</h3>
					<form action="updateRecord" method="post">
						<div class="w-100">
							<label>Corso:</label>
							<input type="text" name="corsoNome" placeholder="Inserisci corso" class="form-control bg-light compilaCampo" maxlength="25"><br>
							<label>Docente:</label>
							  <select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idProfessore">
							    <option selected disabled>-- Seleziona un docente --</option>
							    <% for (Professore p : professori) { %>
							    <option value="<%=p.getIdProfessore() %>"><%=p.getNome() + " " + p.getCognome() %></option>
							    <% } %>
							  </select>
							<input type="hidden" name="idCorso" class="form-control compilaCampo">
							<input type="submit" value="Modifica" class="btn btn-success w-100 btnControllo mb-3">
							<input type="button" class="btn btn-secondary w-100" value="Annulla">
							<div class="text-danger erroreFeedback"></div> 
						</div>
					</form>
				</div>
				
				
				
				<a href="logout" class="mb-3">Logout/Torna alla home</a>
			</div>
				
			<div class="col-md-1"></div>
			
			<div class="col-md-7">
			<table class="table shadow">
							<thead>
								<tr>
									<th scope="col" class="th-corsi bg-primary text-light">ID corso</th>
									<th scope="col" class="th-corsi bg-primary text-light">Corso</th>
									<th scope="col" class="th-corsi bg-primary text-light">Docente</th>
									<th scope="col" class="th-corsi bg-primary text-light"></th>
								</tr>
							</thead>
							<tbody>
								<% for (Corso c : corsi) {%>
								<tr>
									<th scope="row" class="p-4"><%=c.getIdCorso() %></th>
									<td><%=c.getMateria() %></td>
									<td><%=c.getProfessore().getNome() + " " + c.getProfessore().getCognome() %></td>
									<td>
									<div class="align-middle">
										<div class="d-inline-block me-2">
											<button class="btn btn-success btnEditCorso"><i class="bi bi-pencil-square fs-5"></i></button>
										</div>
										<div class="d-inline-block">
											<form action="deleteRecord" method="post">
												<input type="hidden" name="idCorso" value="<%=c.getIdCorso() %>">
												<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
											</form>
										</div>
									</div>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>	
				
			</div>
		</div>
	</div>
	
	<!-- aggiungi appello -->
	<% String confermaMessage = (String) request.getAttribute("confermaMessage");
	if (confermaMessage != null && !confermaMessage.isEmpty()) {
	%>
    <div class="alert alert-success" role="alert">
        <%= confermaMessage %>
    </div>
	<% } %>
	<div class="container my-5 appello tabella" data-tabella="studente">
		<div class="row">
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-white p-5 rounded-3 shadow appelloAggiungi" style="margin-bottom: 100px">
				<h3 class="mb-4">Aggiungi appello</h3>
				<form action="addRecord" method="post">
					<div class="w-100">
						<label>Data appello:</label>
						<input type="date" name="data" placeholder="Inserisci data" class="form-control bg-light compilaCampo"><br>
						<label>Corso:</label>
						<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idCorso">
							<option selected disabled>-- Seleziona corso --</option>
							<% for (Corso c : corsi) {%>
							<option value="<%=c.getIdCorso() %>"><%=c.getMateria() %></option>
							<% } %>
						</select>
						<input type="submit" value="Aggiungi" class="btn btn-success w-100 btnControllo">
						<div class="text-danger erroreFeedback"></div> 
					</div>
				</form>
			</div>
			<div class="p-5 rounded-3 shadow appelloModifica" style="display: none; margin-bottom: 100px; border: 1px solid black">
				<h3 class="mb-4">Modifica appello</h3>
				<form action="updateRecord" method="post">
					<div class="w-100">
						<label>Data appello:</label>
						<input type="date" name="data" placeholder="Inserisci data" class="form-control compilaCampo"><br>
						<label>Corso:</label>
						<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idCorsoAppello">
							<option selected disabled>-- Seleziona corso --</option>
							<% for (Corso c : corsi) {%>
							<option value="<%=c.getIdCorso() %>"><%=c.getMateria() %></option>
							<% } %>
						</select>
						<input type="hidden" name="idAppello" class="form-control compilaCampo">
						<input type="submit" value="Modifica" class="btn btn-success w-100 btnControllo mb-3">
						<input type="button" class="btn btn-secondary w-100" value="Annulla">
						<div class="text-danger erroreFeedback"></div> 
					</div>
				</form>
			</div>
			
			
			<a href="logout" class="mb-3">Logout/Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		

		<div class="col-md-7">
		<table class="table shadow">
			<thead>
				<tr>
					<th scope="col" class="th-corsi bg-primary text-light">ID Appello</th>
					<th scope="col" class="th-corsi bg-primary text-light">Data</th>
					<th scope="col" class="th-corsi bg-primary text-light">Corso</th>
					<th scope="col" class="th-corsi bg-primary text-light">Docente</th>
					<th scope="col" class="th-corsi bg-primary text-light"></th>
				</tr>
			</thead>
			<tbody>
				<% for (Appello a : appelli) {%>
				<tr>
					<th scope="row" class="p-4"><%=a.getIdAppello() %></th>
					<td><%=sdf.format(a.getData()) %></td>
					<td><%=a.getCorsoId().getMateria() %></td>
					<td><%=a.getCorsoId().getProfessore().getNome() + " " + a.getCorsoId().getProfessore().getCognome() %></td>
					<td>
						<div class="align-middle">
							<div class="d-inline-block me-2">
								<button class="btn btn-success btnEditAppello"><i class="bi bi-pencil-square fs-5"></i></button>
							</div>
							<div class="d-inline-block">
								<form action="deleteRecord" method="post">
									<input type="hidden" name="idAppello" value="<%=a.getIdAppello() %>">
									<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
								</form>
							</div>
						</div>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	
	<!-- aggiungi prenotazione -->
	<div class="container my-5 prenotazione tabella">
		<div class="row">
			<div class="col-md-4 d-flex flex-column">
				<div class="bg-white p-5 rounded-3 shadow prenotazioneAggiungi" style="margin-bottom: 100px">
					<h3 class="mb-4">Aggiungi prenotazione</h3>
					<form action="addRecord" method="post">
						<div class="w-100">
							<label>Studente:</label>
							<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="matricola">
							    <option selected disabled>-- Seleziona uno studente --</option>
							    <% for (Studente s : studenti) { %>
							    <option value="<%=s.getMatricola() %>"><%=s.getNome() + " " + s.getCognome() %></option>
							    <% } %>
							</select>
							<label>Appello:</label>
							<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idAppello">
							    <option selected disabled>-- Seleziona un appello --</option>
							    <% for (Appello a : appelli) {%>
							    <option value="<%=a.getIdAppello() %>"><%=a.getCorsoId().getMateria() + " - " + sdf.format(a.getData()) %></option>
							    <% } %>
							</select>
							<input type="submit" value="Aggiungi" class="btn btn-success w-100 btnControllo">
							<div class="text-danger erroreFeedback"></div> 
						</div>
					</form>
				</div>
				<div class="p-5 rounded-3 shadow prenotazioneModifica" style="display: none; margin-bottom: 100px; border: 1px solid black">
					<h3 class="mb-4">Modifica prenotazione</h3>
					<form action="updateRecord" method="post">
						<div class="w-100">
							<label>Studente:</label>
							<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="matricolaPren">
							    <option selected disabled>-- Seleziona uno studente --</option>
							    <% for (Studente s : studenti) { %>
							    <option value="<%=s.getMatricola() %>" class="options-studente"><%=s.getNome() + " " + s.getCognome() %></option>
							    <% } %>
							</select>
							<label>Appello:</label>
							<select class="form-select mb-4 compilaCampo" aria-label="Seleziona un'opzione" name="idAppelloPren">
							    <option selected disabled class="options-appello">-- Seleziona un appello --</option>
							    <% for (Appello a : appelli) {%>
							    <option value="<%=a.getIdAppello() %>" class="options-appello"><%=a.getCorsoId().getMateria() + " - " + sdf.format(a.getData()) %></option>
							    <% } %>
							</select>
							<input type="hidden" name="idPrenotazione" class="form-control compilaCampo">
							<input type="submit" value="Modifica" class="btn btn-success w-100 btnControllo mb-3">
							<input type="button" class="btn btn-secondary w-100" value="Annulla">
							<div class="text-danger erroreFeedback"></div> 
						</div>
					</form>
				</div>
				
				<a href="logout" class="mb-3">Logout/Torna alla home</a>
			</div>
				
			<div class="col-md-1"></div>
			
			<div class="col-md-7">
			<table class="table shadow">
							<thead>
								<tr>
									<th scope="col" class="th-corsi bg-primary text-light">ID prenotazione</th>
									<th scope="col" class="th-corsi bg-primary text-light">Studente</th>
									<th scope="col" class="th-corsi bg-primary text-light">Corso</th>
									<th scope="col" class="th-corsi bg-primary text-light">Data</th>
									<th scope="col" class="th-corsi bg-primary text-light">Docente</th>
									<th scope="col" class="th-corsi bg-primary text-light"></th>
								</tr>
							</thead>
							<tbody>
							
							<% for (Prenotazione p : prenotazioni) { %>
								<tr>
									<th scope="row" class="p-4"><%=p.getIdPrenotazione() %></th>
									<td><%=p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome() %></td>
									<td><%=p.getAppPrenotato().getCorsoId().getMateria() %></td>
									<td><%=sdf.format(p.getAppPrenotato().getData()) %></td>
									<td><%=p.getAppPrenotato().getCorsoId().getProfessore().getNome() + " " + p.getAppPrenotato().getCorsoId().getProfessore().getCognome() %></td>
									<td>
										<div class="align-middle">
											<div class="d-inline-block me-2">
												<button class="btn btn-success btnEditPren"><i class="bi bi-pencil-square fs-5"></i></button>
											</div>
											<div class="d-inline-block">
												<form action="deleteRecord" method="post">
													<input type="hidden" name="idpren" value="<%=p.getIdPrenotazione() %>">
													<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
												</form>
											</div>
										</div>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>	
				
			</div>
		</div>
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
    <script src="./js/segreteria.js"></script>
    <script>
	//prendo la variabile che si trova in Java.
	//questa variabile ha dentro di sé una stringa, che sarà uguale alla classe di una delle tabelle ("studente", "professore"...). Se è vuota, la imposta su "studente"  
    const tabellaAttiva = "<%= tabellaAttiva %>";
    const bottoni = document.querySelectorAll(".bottone");
    
    //al click di qualsiasi bottone, tutte le tabelle scompaiono, mentre quella che ha la classe uguale a quella del bottona cliccato, compare. Quindi se clicco "Aggiungi studente", bottone.dataset.tabellaId sarà uguale a "studente". Mi comparirà quindi la tabella studente
    //questa parte dei bottoni è solo JS
    bottoni.forEach((bottone) => {
    	bottone.addEventListener("click", function() {
	    	document.querySelectorAll(".tabella").forEach((tabella) => {
	    		tabella.style.display = "none";
	    	})
	    	
	    	const tabellaClasse = bottone.dataset.tabellaId;
	    	document.querySelector("." + tabellaClasse).style.display = "block";
	    	document.querySelector("." + tabellaClasse + "Aggiungi").style.display = "block";
	    	document.querySelector("." + tabellaClasse + "Modifica").style.display = "none";
    	})
    })	
	
    
    //al refresh della pagina, quindi anche al submit, tutte le tabelle scompaiono, mentre quella che ha la classe uguale alla variabila tabellaAttiva, compare
    //tabellaAttiva del submit servlet e tabellaAttiva del refresh sono uguali, corrispondono, non c'è bisogno di fare un'altra variabile es. con sessionStorage, mi prendo direttamente quella
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelectorAll(".tabella").forEach(tabella => {
	        tabella.style.display = "none";
	    });

        const tabellaCorrisp = document.querySelector("." + tabellaAttiva);
        tabellaCorrisp.style.display = "block";
	});
    </script>
</body>
</html>