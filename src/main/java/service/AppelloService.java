package service;

import java.util.List;

import model.Appello;

public interface AppelloService {
	
	List<Appello> getAppelli();
	void addAppello(Appello a);
	void deleteAppelloById(int idAppello);
	void close();

}
