package model;

public class Prenotazione {
	
	private Studente studPrenotato;
	private Appello appPrenotato;
	public Prenotazione(Studente studPrenotato, Appello appPrenotato) {
		super();
		this.studPrenotato = studPrenotato;
		this.appPrenotato = appPrenotato;
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
