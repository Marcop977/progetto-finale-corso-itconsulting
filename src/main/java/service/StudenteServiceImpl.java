package service;

import java.util.List;

import model.Studente;
import repos.StudenteDAO;
import repos.StudenteDAOImpl;

public class StudenteServiceImpl implements StudenteService {
	
	StudenteDAO dao = new StudenteDAOImpl();
	
	@Override
	public List<Studente> getStudenti() {
		return dao.findAll();
	}

	@Override
	public void addStudente(Studente s) {
		dao.addStudente(s);
	}

	@Override
	public void deleteStudenteById(int matricola) {
		dao.deleteStudente(matricola);
	}

	@Override
	public void close() {
		dao.closeConnection();
	}

	@Override
	public boolean isStudentePresente(String u, String p) {
		return this.dao.isPresente(u, p);
	}

	@Override
	public Studente getStudenteByUserPass(String u, String p) {
		return this.dao.findByUserPass(u, p);
	}

	@Override
	public void updateStudente(int m, String n, String c, String u, String p) {
		this.dao.updateStudente(m, n, c, u, p);
	}

	@Override
	public boolean isStudente(char tipo) {
		return this.dao.isStudente(tipo);
	}

}
