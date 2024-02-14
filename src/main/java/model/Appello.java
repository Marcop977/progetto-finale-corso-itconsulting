package model;

import java.time.LocalDate;

public class Appello {

	private LocalDate data;
	private Corso corsoId;
	public Appello(LocalDate data, Corso corsoId) {
		super();
		this.data = data;
		this.corsoId = corsoId;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
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
		return "Appello [data=" + data + ", corsoId=" + corsoId + "]";
	}
	
}
