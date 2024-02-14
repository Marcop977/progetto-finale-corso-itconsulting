package model;

public class Prenotazione {
	
	private int idPrenotazione;
	private Studente studPrenotato;
	private Appello appPrenotato;
	
	public Prenotazione(int idPrenotazione, Studente studPrenotato, Appello appPrenotato) {
		super();
		this.idPrenotazione = idPrenotazione;
		this.studPrenotato = studPrenotato;
		this.appPrenotato = appPrenotato;
	}
	
	public int getIdPrenotazione() {
		return idPrenotazione;
	}
	public void setIdPrenotazione(int idPrenotazione) {
		this.idPrenotazione = idPrenotazione;
	}
	public Studente getStudPrenotato() {
		return studPrenotato;
	}
	public void setStudPrenotato(Studente studPrenotato) {
		this.studPrenotato = studPrenotato;
	}
	public Appello getAppPrenotato() {
		return appPrenotato;
	}
	public void setAppPrenotato(Appello appPrenotato) {
		this.appPrenotato = appPrenotato;
	}
	@Override
	public String toString() {
		return "Prenotazione [studPrenotato=" + studPrenotato + ", appPrenotato=" + appPrenotato + "]";
	}
	
}
