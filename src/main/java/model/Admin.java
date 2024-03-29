package model;

public class Admin {
	
	private int idAdmin;
	private String username;
	private String password;
	private char tipoUtente = 'a';
	private String nome;
	private String cognome;
	public Admin() {}
	
	public Admin(int idAdmin, String username, String password, char tipoUtente, String nome, String cognome) {
		super();
		this.idAdmin = idAdmin;
		this.username = username;
		this.password = password;
		this.tipoUtente = tipoUtente;
		this.nome = nome;
		this.cognome = cognome;
	}
	public int getIdAdmin() {
		return idAdmin;
	}
	public void setIdAdmin(int idAdmin) {
		this.idAdmin = idAdmin;
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
	
}
