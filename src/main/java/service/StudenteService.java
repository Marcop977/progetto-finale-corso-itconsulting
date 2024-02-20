package service;

import java.util.List;

import model.Studente;

public interface StudenteService {
	
	List<Studente> getStudenti();
	boolean isStudente(char tipo);
	void addStudente(Studente s);
	void updateStudente(int m, String n, String c, String u, String p);
	Studente getStudenteByUserPass(String u, String p);
	void deleteStudenteById(int matricola);
	boolean isStudentePresente(String u, String p);
	void close();

}
