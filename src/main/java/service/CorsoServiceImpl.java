package service;

import java.util.List;

import model.Corso;
import model.Professore;
import repos.CorsoDAO;
import repos.CorsoDAOImpl;

public class CorsoServiceImpl implements CorsoService {
	
	CorsoDAO dao = new CorsoDAOImpl();

	@Override
	public List<Corso> getCorsi() {
		return this.dao.findAll();
	}

	@Override
	public void addCorso(Corso c, Professore p) {
		this.dao.addCorso(c, p);
	}

	@Override
	public void deleteCorsoById(int idCorso) {
		this.dao.deleteCorso(idCorso);
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

	@Override
	public Professore findByJoin(int matricola) {
		return this.dao.findProfJoin(matricola);
	}

}
