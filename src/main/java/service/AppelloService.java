package service;

import java.util.List;

import model.Appello;
import model.Professore;

public interface AppelloService {
	
	List<Appello> getAppelli();
	List<Appello> getAppelliById(int idAppello);
	List<Appello> getAppelliByProf(Professore p);
	void addAppello(Appello a);
	void deleteAppelloById(int idAppello);
	void close();

}
