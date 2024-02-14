package service;

import java.util.List;

import model.Corso;
import model.Professore;

public interface CorsoService {

	List<Corso> getCorsi();
	void addCorso(Corso c, Professore p);
	void deleteCorsoById(int idCorso);
//	Professore findByJoin(int matricola);
	void close();
}
