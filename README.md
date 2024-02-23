## Applicativo Web per la gestione di un'università

L'applicativo si basa su 3 tipi di utenze: gli studenti, i professori e gli amministratori identificabili al login dai propri ruoli.

### Front-end

Il front-end dell'intero sito è realizzato in Bootstrap, CSS e JavaScript.
Troviamo uno swiper, una modale per il login e degli alert.
Tutti i campi richiedono di essere compilati mediante un controlla campi realizzato in JavaScript.

### Back-end

Per quanto riguarda il back-end, per migliorare la sicurezza e l'efficacia del codice, è stato utilizzato il pattern MVC, in una variante simile a come quando si progetta in Spring Boot, creando quindi un Model, una Presentation, una Repository che raccoglie il DAO e un Service.

Partendo dal lato admin, sarà possibile visualizzare, aggiungere, modificare ed eliminare gli studenti, i professori, i corsi, gli appelli e le prenotazioni, senza alcun tipo di vincolo limitante, il che significa che eliminando un professore verranno eliminati anche i corsi, gli appelli e le prenotazioni correlati.
Uguale per lo studente, per i corsi e per gli appelli.

Accedendo invece come professore, sarà possibile visualizzare una lista dei propri corsi, con la possibilità di inserire uno o più appelli.
Se si cerca di inserire lo stesso appello, apparirà un messaggio di errore.
L'operazione verrà infatti bloccata sia lato back-end, mediante una query che fa una select e mi restituisce un booleano se il record esiste già, sia sul front-end mediante messaggio di errore.
Tutto ciò verrà quindi gestito in Java e Javascript.. difatti se il record risulta già presente, verrà salvato nella request un messaggio di errore, e che verrà poi ripreso in JavaScript che realizzerà il messaggio di errore dinamicamente attraverso il DOM.
Accanto al bottone per inserire un nuovo appello al corso correlato, c'è anche il bottone per visualizzare tutti gli appelli correlati al corso.
Accanto a ciascun appello, cliccando su "Visualizza prenotazioni", ci sarà invece la possibilità di visualizzare tutte le prenotazioni effettuate dagli studenti, o anche dall'admin.

Accedendo infine come studente, sarà possibile visualizzare la lista dei corsi; per ciascun corso sarà possibile visualizzare gli appelli correlati e per ciascun appello effettuare una prenotazione.
Anche qui c'è il blocco dell'operazione, sia back-end che front-end, se lo studente cerca di effettuare 2 volte la medesima prenotazione.
La seconda volta quest'ultimo verrà indirizzato su una schermata di errore che lo avviserà che la prenotazione è stata già effettuata, invitandolo a farne un'altra o a tornare alla home.
Questo tipo di schermata è presente non solo se lo studente cerca di fare 2 volte la stessa operazione, ma anche se sia lui che il professore si trovano dinnanzi ad una pagina senza record, cioè senza corsi, senza appelli o senza prenotazioni. Ciascuno con il testo e l'icona di Bootstrap appropriati.

Tutte le operazioni di ciascuna utenza sono state effettuate su un'unica JSP, cioè quella correlata all'utenza.
Ad esempio, nel caso dell'admin, ogni sezione sarà raggiungibile mediante il click del bottone in alto, ad esso correlato.
Ognuno di questi bottoni ha una proprietà, che è collegata ad una classe appartenente ad ogni tabella.
Se viene cliccato un bottone, la tabella correlata apparirà e tutte le altre scompariranno.
Lo stesso avviene al refresh della pagina.
Ovvero, sull'azione di submit, viene salvata nella request la tabella che abbiamo attualmente dinnanzi.
Questo appunto per far sì che al refresh non si passi ad un'altra tabella piuttosto che rimanere su quella attuale e vedere i record aggiornarsi in tempo reale.

Le date sono in formato dd/MM/yyyy.
Infine, tutti i record sono ordinati con il Comparator: gli appelli e le prenotazioni per data, i corsi per nome della materia, gli studenti e i professori per cognome.
