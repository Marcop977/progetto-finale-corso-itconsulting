package service;

import java.util.List;

import model.Professore;
import model.Studente;
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

	@Override
	public void deleteProfById(int idProfessore) {
		this.dao.deleteProfessoreById(idProfessore);
	}

	@Override
	public int getIdByNameSur(String nome, String cognome) {
		return this.dao.findProfByNameSur(nome, cognome);
	}

	@Override
	public boolean isProfPresenteNome(String nome, String cognome) {
		return this.dao.isPresenteConNome(nome, cognome);
	}

	@Override
	public Professore getProfByUserPass(String u, String p) {
		return this.dao.findByUserPass(u, p);
	}

	@Override
	public boolean isProfessore(char tipo) {
		return this.dao.isProfessore(tipo);
	}

	@Override
	public void updateProfessore(int id, String u, String p, String n, String c) {
		this.dao.updateProfessore(id, u, p, n, c);
	}
	
}
