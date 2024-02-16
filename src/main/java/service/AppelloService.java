package service;

import java.util.List;

import model.Appello;
import model.Professore;

public interface AppelloService {
	
	List<Appello> getAppelli();
	List<Appello> getAppelliByIdCorso(int idCorso);
	List<Appello> getAppelliByProf(Professore p);
	List<Appello> getAppelliCorsi();
	void addAppello(Appello a);
	void deleteAppelloById(int idAppello);
	void close();

}
