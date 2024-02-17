package service;

import java.util.List;

import model.Professore;

public interface ProfessoreService {
	
	List<Professore> getProfessori();
	void addProfessore(Professore p);
	boolean isProfPresente(String u, String p);
	void close();

}
