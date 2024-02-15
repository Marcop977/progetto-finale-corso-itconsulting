package service;

import java.util.List;

import model.Professore;

public interface ProfessoreService {
	
	List<Professore> getProfessori();
	void close();

}
