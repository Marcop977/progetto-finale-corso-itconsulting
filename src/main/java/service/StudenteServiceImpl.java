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

}
