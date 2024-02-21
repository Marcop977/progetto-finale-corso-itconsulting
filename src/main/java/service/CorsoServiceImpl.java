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
	public void addCorso(String materia, int cattedra) {
		this.dao.addCorso(materia, cattedra);
	}

	@Override
	public void deleteCorsoById(int idCorso) {
		this.dao.deleteCorsoById(idCorso);
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

	@Override
	public boolean isCPresente(String materia) {
		return this.dao.isCPresente(materia);
	}

	@Override
	public void deleteCorsoByCattedra(int cattedra) {
		this.dao.deleteCorsoByCattedra(cattedra);
	}

	@Override
	public void updateCorso(int idCorso, String materia, int cattedra) {
		this.dao.updateCorso(idCorso, materia, cattedra);
	}

//	@Override
//	public List<Corso> getbyProf(int cattedra) {
//		return this.dao.findByProfId(cattedra);
//	}

//	@Override
//	public Professore findByJoin(int matricola) {
//		return this.dao.findProfJoin(matricola);
//	}

}
