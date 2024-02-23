package service;

import java.util.List;

import model.Corso;

public interface CorsoService {

	List<Corso> getCorsi();
	List<Corso> getByProf(int cattedra);
	void addCorso(String materia, int cattedra);
	void updateCorso(int idCorso, String materia, int cattedra);
	void deleteCorsoById(int idCorso);
	void deleteCorsoByCattedra(int cattedra);
	boolean isCPresente(String materia);
	void close();
}
