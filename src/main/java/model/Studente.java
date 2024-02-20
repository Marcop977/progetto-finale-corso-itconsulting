package model;

public class Studente {
	
	private int matricola;
	private String username;
	private String password;
	private char tipoUtente = 's';
	private String nome;
	private String cognome;
	
	public Studente() {}
		
	public Studente(int matricola, String username, String password, char tipoUtente, String nome, String cognome) {
		super();
		this.matricola = matricola;
		this.username = username;
		this.password = password;
		this.tipoUtente = tipoUtente;
		this.nome = nome;
		this.cognome = cognome;
	}
	public int getMatricola() {
		return matricola;
	}
	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public char getTipoUtente() {
		return tipoUtente;
	}
	public void setTipoUtente(char tipoUtente) {
		this.tipoUtente = tipoUtente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	@Override
	public String toString() {
		return "Studente [username=" + username + ", password=" + password + ", tipoUtente=" + tipoUtente + ", nome="
				+ nome + ", cognome=" + cognome + "]";
	}
	
	

}
