package model;

public class Corso {
	
	private int idCorso;
	private String materia;
	private int cattedraId;
	private Professore professore;
	
	public Corso() {}
	public Corso(int idCorso, String materia, int cattedraId) {
		super();
		this.idCorso = idCorso;
		this.materia = materia;
		this.cattedraId = cattedraId;
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
	public int getCattedraId() {
		return cattedraId;
	}
	public void setCattedraId(int cattedraId) {
		this.cattedraId = cattedraId;
	}
	@Override
	public String toString() {
		return "Corso [materia=" + materia + ", cattedraId=" + cattedraId + "]";
	}
	
}
