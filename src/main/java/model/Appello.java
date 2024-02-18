package model;

import java.sql.Date;

public class Appello {

	private int idAppello;
	private Date data;
	private Corso corsoId;
	
	public Appello() {}
	
	public Appello(int idAppello, Date data, Corso corsoId) {
		super();
		this.idAppello = idAppello;
		this.data = data;
		this.corsoId = corsoId;
	}
	
	public int getIdAppello() {
		return idAppello;
	}

	public void setIdAppello(int idAppello) {
		this.idAppello = idAppello;
	}

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Corso getCorsoId() {
		return corsoId;
	}
	public void setCorsoId(Corso corsoId) {
		this.corsoId = corsoId;
	}
	@Override
	public String toString() {
		return "Appello [idAppello=" + idAppello + ", data=" + data + ", corsoId=" + corsoId + "]";
	}
	
}
