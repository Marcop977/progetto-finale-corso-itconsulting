package service;

import java.util.List;

import model.Studente;

public interface StudenteService {
	
	List<Studente> getStudenti();
	void addStudente(Studente s);
	void deleteStudenteById(int matricola);
	void close();

}
