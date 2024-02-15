package model;

public class Corso {
	
	private int idCorso;
	private String materia;
	private Professore professore;
	
	public Corso() {}
	public Corso(int idCorso, String materia, Professore professore) {
		super();
		this.idCorso = idCorso;
		this.materia = materia;
		this.professore = professore;
	}
	
	public Professore getProfessore() {
		return professore;
	}
	public void setProfessore(Professore professore) {
		this.professore = professore;
	}
	public int getIdCorso() {
		return idCorso;
	}
	public void setIdCorso(int idCorso) {
		this.idCorso = idCorso;
	}
	public String getMateria() {
		return materia;
	}
	public void setMateria(String materia) {
		this.materia = materia;
	}
	@Override
	public String toString() {
		return "Corso [idCorso=" + idCorso + ", materia=" + materia + ", professore=" + professore + "]";
	}

	
}
