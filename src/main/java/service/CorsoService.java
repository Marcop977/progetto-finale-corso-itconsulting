package service;

import java.util.List;

import model.Corso;
import model.Professore;

public interface CorsoService {

	List<Corso> getCorsi();
	void addCorso(String materia, int cattedra);
	void deleteCorsoById(int idCorso);
	boolean isCPresente(String materia);
//	Professore findByJoin(int matricola);
	void close();
}
