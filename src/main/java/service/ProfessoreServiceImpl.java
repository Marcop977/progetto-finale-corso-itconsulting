package service;

import java.util.List;

import model.Professore;

import repos.ProfessoreDAO;

import repos.ProfessoreDAOImpl;

public class ProfessoreServiceImpl implements ProfessoreService {
	
	ProfessoreDAO dao = new ProfessoreDAOImpl();

	@Override
	public List<Professore> getProfessori() {
		return this.dao.findAll();
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

	@Override
	public void addProfessore(Professore p) {
		this.dao.addProfessore(p);
	}

	@Override
	public boolean isProfPresente(String u, String p) {
		return this.dao.isPresente(u, p);
	}
	
}
