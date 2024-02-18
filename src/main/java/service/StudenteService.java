package service;

import java.util.List;

import model.Studente;

public interface StudenteService {
	
	List<Studente> getStudenti();
	void addStudente(Studente s);
	Studente getStudenteByUserPass(String u, String p);
	void deleteStudenteById(int matricola);
	boolean isStudentePresente(String u, String p);
	void close();

}
