package service;

import java.sql.Date;
import java.util.List;

import model.Appello;
import model.Professore;

public interface AppelloService {
	
	List<Appello> getAppelli();
	List<Appello> getAppelliByIdCorso(int idCorso);
	List<Appello> getAppelliByProf(Professore p);
	List<Appello> getAppelliCorsi();
	void addAppello(String data, int idCorso);
	void deleteAppelloById(int idAppello);
	void updateAppello(int idAppello, Date data, String materia);
//	void deleteAppelloByCorso(int corsoId);
	boolean isPrenPresente(int idAppello);
	boolean isAppPresente(int idCorso, Date data);
	void close();

}
