//con questo codice il messaggio di errore appare sotto al bottone
//prendimi tutti i bottoni, al click di ognuno di essi prendimi il corrispettivo form, prendimi tutti i campi e se sono vuoti o se ci sono spazi bianchi, blocca il submit, fai apparire il messaggio di errore e aggiungi la classe errore ai campi (bordo rosso)
document.querySelectorAll(".btnControllo").forEach((bottone) => {
  bottone.addEventListener("click", function (e) {
    //prendimi il form più vicino al bottone
    const form = bottone.closest("form");

    form.querySelectorAll(".compilaCampo").forEach((campo) => {
      if (campo.value.trim() === "" || campo.selectedIndex === 0) {
        e.preventDefault();

        const divErrore = form.querySelector(".erroreFeedback");
        const messaggio = `
	                    <div class="text-danger">
	                        <span style="font-size: 12px">Compila tutti i campi</span>
	                    </div>
	                `;
        divErrore.innerHTML = messaggio;

        campo.classList.add("errore");
        campo.addEventListener("input", function () {
          divErrore.innerHTML = "";
          campo.classList.remove("errore");
        });
      }
    });
  });
});

//form modifica di studente e professore. Li faccio insieme poiché gli input sono gli stessi e nello stesso ordine dei td
document.querySelectorAll(".btnEdit").forEach((button) => {
  button.addEventListener("click", function () {
    console.log("Ciao");
    const formAggiungiLista = document.querySelectorAll(".formAggiungi");
    const formModificaLista = document.querySelectorAll(".formModifica");

    const formAggiungi = button.closest(".row").querySelector(".formAggiungi");
    const formModifica = button.closest(".row").querySelector(".formModifica");

    if (formAggiungi) {
      formAggiungi.style.display =
        formAggiungi.style.display === "none" ? "block" : "none";
    }

    if (formModifica) {
      formModifica.style.display =
        formModifica.style.display === "none" ? "block" : "none";
    }

    const tds = button.closest("tr").querySelectorAll("td");
    const th = tds[0].parentNode.querySelector("th");
    const inputs = formModifica.querySelectorAll(
      "input:not([type='submit']):not([type='button'])"
    );
    inputs[0].value = th.textContent;
    const nomeCognome = tds[0].textContent.trim().split(" ");
    if (inputs.length >= 2) {
      inputs[1].value = nomeCognome[0];
      inputs[2].value = nomeCognome[1] || "";
    }
    for (let i = 3; i < inputs.length; i++) {
      inputs[i].value = tds[i - 2].textContent.trim();
    }

    const btnAnnulla = formModifica.querySelector("input[type='button']");
    btnAnnulla.addEventListener("click", function () {
      formModifica.style.display = "none";
      formAggiungi.style.display = "block";
    });
  });
});

//per corso ne faccio un altro separato poiché il numero di campi e l'ordine è diverso
document.querySelectorAll(".btnEditCorso").forEach((button) => {
  button.addEventListener("click", function () {
    const formModifica = document.querySelector(".corsoModifica");
    const formAggiungi = document.querySelector(".corsoAggiungi");

    formAggiungi.style.display =
      formAggiungi.style.display === "none" ? "block" : "none";
    formModifica.style.display =
      formModifica.style.display === "none" ? "block" : "none";

    const tds = this.closest("tr").querySelectorAll("td");
    const th = tds[0].parentNode.querySelector("th");
    const inputs = formModifica.querySelectorAll(
      "input:not([type='submit']):not([type='button'])"
    );
    const options = formModifica.querySelectorAll("option");

    for (let i = 0; i < options.length; i++) {
      if (options[i].textContent == tds[1].textContent.trim()) {
        options[i].selected = true;
      }
    }

    inputs[0].value = tds[0].textContent.trim();
    inputs[1].value = th.textContent.trim();

    const btnAnnulla = formModifica.querySelector("input[type='button']");
    btnAnnulla.addEventListener("click", function () {
      formModifica.style.display = "none";
      formAggiungi.style.display = "block";
    });
  });
});

//modifica appello
document.querySelectorAll(".btnEditAppello").forEach((button) => {
  button.addEventListener("click", function () {
    const formModifica = document.querySelector(".appelloModifica");
    const formAggiungi = document.querySelector(".appelloAggiungi");

    formAggiungi.style.display =
      formAggiungi.style.display === "none" ? "block" : "none";
    formModifica.style.display =
      formModifica.style.display === "none" ? "block" : "none";

    const tds = this.closest("tr").querySelectorAll("td");
    const th = tds[0].parentNode.querySelector("th");
    const inputs = formModifica.querySelectorAll(
      "input:not([type='submit']):not([type='button'])"
    );
    console.log(inputs);
    const dataNonCorretta = tds[0].textContent.trim();
    const dataSplittata = dataNonCorretta.split("/");
    const giorno = dataSplittata[0];
    const mese = dataSplittata[1];
    const anno = dataSplittata[2];

    const dataCorretta = anno + "-" + mese + "-" + giorno;

    inputs[0].value = dataCorretta; //data
    const options = formModifica.querySelectorAll("option"); //corso
    for (let i = 0; i < options.length; i++) {
      if (options[i].textContent == tds[1].textContent.trim()) {
        options[i].selected = true;
      }
    }

    inputs[1].value = th.textContent.trim(); //id

    const btnAnnulla = formModifica.querySelector("input[type='button']");
    console.log(btnAnnulla);
    btnAnnulla.addEventListener("click", function () {
      console.log("ciao");
      formModifica.style.display = "none";
      formAggiungi.style.display = "block";
    });
  });
});

//modifica prenotazione
document.querySelectorAll(".btnEditPren").forEach((button) => {
  button.addEventListener("click", function () {
    const formModifica = document.querySelector(".prenotazioneModifica");
    const formAggiungi = document.querySelector(".prenotazioneAggiungi");

    formAggiungi.style.display =
      formAggiungi.style.display === "none" ? "block" : "none";
    formModifica.style.display =
      formModifica.style.display === "none" ? "block" : "none";

    const tds = this.closest("tr").querySelectorAll("td");
    const optionsStudente = formModifica.querySelectorAll(".options-studente");
    const optionsAppello = formModifica.querySelectorAll(".options-appello");
    const th = tds[0].parentNode.querySelector("th");

    const inputIdPren = document.querySelector('[name="idPrenotazione"]');
    console.log(inputIdPren + "aaa");
    inputIdPren.value = th.textContent.trim();

    for (let i = 0; i < optionsStudente.length; i++) {
      if (optionsStudente[i].textContent == tds[0].textContent.trim()) {
        optionsStudente[i].selected = true;
      }
    }
    for (let i = 0; i < optionsAppello.length; i++) {
      if (
        optionsAppello[i].textContent ==
        tds[1].textContent.trim() + " - " + tds[2].textContent.trim()
      ) {
        optionsAppello[i].selected = true;
      }
    }

    const btnAnnulla = formModifica.querySelector("input[type='button']");
    btnAnnulla.addEventListener("click", function () {
      formModifica.style.display = "none";
      formAggiungi.style.display = "block";
    });
  });
});
