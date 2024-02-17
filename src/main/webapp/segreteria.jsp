<%@page import="model.Professore"%>
<%@page import="model.Studente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="presentation.AddStudenteCtrl"%>
    <%@ page import="presentation.AddProfessoreCtrl"%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body>
  
 
  
   <% String tabellaAttiva = (String) session.getAttribute("tabellaAttiva");
   if (tabellaAttiva == null) {
	    tabellaAttiva = "studente";
	} %>
  
 <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-scroll pb-4 pt-5">
      <div class="container">
        <img src="./img/logo.png" alt="" loading="lazy" />
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
              <a class="nav-link" aria-current="page" href="#pets">Home</a>
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
	<button id="btnStud" class="bottone" data-tabella-id="studente">Aggiungi Studente</button>
	<button id="btnProf" class="bottone" data-tabella-id="professore">Aggiungi Professore</button>
	<button id="btnCorso" class="bottone" data-tabella-id="corso">Aggiungi Corso</button>
	<button id="btnAppello" class="bottone" data-tabella-id="appello">Aggiungi Appello</button>
	</div>
	<input type="hidden" id="tabellaAttivaInput" name="tabellaAttiva" value="0">
	
	
	<!-- anziché usare javascript, provare a nascondere/mostrare le tabelle con post per ciascun bottone, andando a settare tabellaAttiva -->


	<!-- aggiungi studente -->
	<div class="container my-5 studente tabella" data-tabella="studente">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi studente</h3>
				<form action="addStudente" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<% AddStudenteCtrl controller = new AddStudenteCtrl();%>	
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Studente</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<% for (Studente s : controller.mostraStudenti()) { %>
				<tr>
					<th><%= s.getMatricola() %></th>
					<td><%= s.getNome() + " " + s.getCognome() %></td>
					<td><%= s.getUsername() %></td>
					<td><%= s.getPassword() %></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="<%= s.getMatricola() %>">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
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
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi docente</h3>
				<form action="addProfessore" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		

		<% AddProfessoreCtrl controller1 = new AddProfessoreCtrl(); %>
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Professore</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<% for (Professore p : controller1.mostraProfessori()) { %>
				<tr>
					<th><%=p.getIdProfessore() %></th>
					<td><%=p.getNome() + " " + p.getCognome() %></td>
					<td><%=p.getUsername() %></td>
					<td><%=p.getPassword() %></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	<!-- aggiungi corso -->
	<div class="container my-5 corso tabella" style="display: none" data-tabella="corso">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi corso</h3>
				<form action="addStudente" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<!--  -->	
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Studente</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	<!-- aggiungi appello -->
	<div class="container my-5 appello tabella" style="display: none" data-tabella="appello">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi appello</h3>
				<form action="addStudente" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<!--  -->	
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Studente</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
					</td>
				</tr>
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
    
    <script>
    
	//prendo la variabile che si trova in Java.
	//questa variabile ha dentro di sé una stringa, che sarà uguale alla classe di una delle tabelle ("studente", "professore"...). Se è vuota, la imposta su "studente"  
    let tabellaAttiva = "<%= tabellaAttiva %>";
    let bottoni = document.querySelectorAll(".bottone");
    
    //al click di qualsiasi bottone, tutte le tabelle scompaiono, mentre quella che ha la classe uguale a quella del bottona cliccato, compare. Quindi se clicco "Aggiungi studente", bottone.dataset.tabellaId sarà uguale a "studente". Mi comparirà quindi la tabella studente
    bottoni.forEach((bottone) => {
    	bottone.addEventListener("click", function() {
	    	document.querySelectorAll(".tabella").forEach((tabella) => {
	    		tabella.style.display = "none";
	    	})
	    	
	    	let tabellaClasse = bottone.dataset.tabellaId;
	    	document.querySelector("." + tabellaClasse).style.display = "block";
    	})
    })	
	
    
    //al refresh della pagina, quindi anche al submit, tutte le tabelle scompaiono, mentre quella che ha la classe uguale alla variabila tabellaAttiva, compare
    //tabellaAttiva del submit servlet e tabellaAttiva del refresh sono uguali, corrispondono, non c'è bisogno di fare un'altra variabile es. con sessionStorage, mi prendo direttamente quella
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelectorAll(".tabella").forEach(tabella => {
	        tabella.style.display = "none";
	    });

	    if (tabellaAttiva) {
	        let tabellaCorrisp = document.querySelector("." + tabellaAttiva);
	        if (tabellaCorrisp) {
	            tabellaCorrisp.style.display = "block";
	        }
	    }
	});
	

	
	
	
    
    /*
    bottoni.forEach((bottone) => {
    	bottone.addEventListener("click", function() {
	    	document.querySelectorAll(".tabella").forEach((tabella) => {
	    		tabella.style.display = "none";
	    	})
	    	
	    	//let tabellaClasse = tabellaAttiva;
	    	let tabellaClasse = bottone.dataset.tabellaId;
	    	document.querySelector("." + tabellaClasse).style.display = "block";
    	})
    })
	
	const forms = document.querySelectorAll('form');

	forms.forEach(form => {
	    form.addEventListener('submit', function(event) {
	        console.log('Form submitted');
	        console.log(tabellaAttiva + " - variabile durante il submit, salvata in session");
			sessionStorage.setItem("tabellaAttiva", tabellaAttiva);
	    });
	});

	document.addEventListener("DOMContentLoaded", function() {
	    // Riprendi il valore di tabellaAttiva da sessionStorage
	    let tabellaAttivaJs = sessionStorage.getItem("tabellaAttiva");

	    console.log(tabellaAttivaJs + " variabile dopo il refresh");
	    
	    // Nascondi tutte le tabelle di default
	    document.querySelectorAll('.tabella').forEach(tabella => {
	        tabella.style.display = 'none';
	    });

	    // Ora puoi utilizzare il valore di tabellaAttiva per nascondere o mostrare la tabella corrispondente
	    if (tabellaAttiva === "studente") {
	        // Mostra la tabella studente e nascondi tutte le altre
	        document.querySelector('.studente.tabella').style.display = 'block';
	        document.querySelectorAll('.tabella:not(.studente)').forEach(tabella => {
	            tabella.style.display = 'none';
	        });
	    } else if (tabellaAttiva === "professore") {
	        // Mostra la tabella professore e nascondi tutte le altre
	        document.querySelector('.professore.tabella').style.display = 'block';
	        document.querySelectorAll('.tabella:not(.professore)').forEach(tabella => {
	            tabella.style.display = 'none';
	        });
	    } else if (tabellaAttiva === "corso") {
	        // Mostra la tabella corso e nascondi tutte le altre
	        document.querySelector('.corso.tabella').style.display = 'block';
	        document.querySelectorAll('.tabella:not(.corso)').forEach(tabella => {
	            tabella.style.display = 'none';
	        });
	    } else if (tabellaAttiva === "appello") {
	        // Mostra la tabella appello e nascondi tutte le altre
	        document.querySelector('.appello.tabella').style.display = 'block';
	        document.querySelectorAll('.tabella:not(.appello)').forEach(tabella => {
	            tabella.style.display = 'none';
	        });
	    } else {
	        // Se tabellaAttiva non corrisponde a nessuno dei valori sopra, nascondi tutte le tabelle di default
	        document.querySelectorAll('.tabella').forEach(tabella => {
	            tabella.style.display = 'none';
	        });
	    }
	});
	*/

    </script>
</body>
</html>