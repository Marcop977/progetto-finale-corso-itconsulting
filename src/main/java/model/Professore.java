package model;

public class Professore {
	
	private int idProfessore;
	private String username;
	private String password;
	private char tipoUtente;
	private String nome;
	private String cognome;
	
	public Professore() {}
	
	public Professore(int idProfessore, String username, String password, char tipoUtente, String nome,
			String cognome) {
		super();
		this.idProfessore = idProfessore;
		this.username = username;
		this.password = password;
		this.tipoUtente = tipoUtente;
		this.nome = nome;
		this.cognome = cognome;
	}
	public int getIdProfessore() {
		return idProfessore;
	}

	public void setIdProfessore(int idProfessore) {
		this.idProfessore = idProfessore;
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
		return "Professore [idProfessore=" + idProfessore + ", username=" + username + ", password=" + password
				+ ", tipoUtente=" + tipoUtente + ", nome=" + nome + ", cognome=" + cognome + "]";
	}

}
