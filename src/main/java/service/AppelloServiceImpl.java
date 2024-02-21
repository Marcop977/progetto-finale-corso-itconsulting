package service;

import java.sql.Date;
import java.util.List;

import repos.AppelloDAO;
import repos.AppelloDAOImpl;

import model.Appello;
import model.Professore;

public class AppelloServiceImpl implements AppelloService {
	
	AppelloDAO dao = new AppelloDAOImpl();

	@Override
	public List<Appello> getAppelliByIdCorso(int idCorso) {
		return this.dao.findAppByCorsoID(idCorso);
	}

	@Override
	public void addAppello(String data, int idCorso) {
		this.dao.addAppello(data, idCorso);
	}

	@Override
	public void deleteAppelloById(int idAppello) {
		this.dao.deleteAppello(idAppello);
	}

	@Override
	public void close() {
		this.dao.closeConnection();
	}

	@Override
	public List<Appello> getAppelli() {
		return this.dao.findAll();
	}

	@Override
	public List<Appello> getAppelliByProf(Professore p) {
		return this.dao.findByProf(p);
	}

	@Override
	public List<Appello> getAppelliCorsi() {
		return this.dao.findCorsiApp();
	}

	@Override
	public boolean isPrenPresente(int idAppello) {
		return this.dao.isPrenPresente(idAppello);
	}

	@Override
	public boolean isAppPresente(int idCorso, Date data) {
		return this.dao.isAppPresente(idCorso, data);
	}

	@Override
	public void updateAppello(int idAppello, Date data, String materia) {
		this.dao.updateAppello(idAppello, data, materia);
	}

//	@Override
//	public void deleteAppelloByCorso(int corsoId) {
//		this.dao.deleteAppelloByCorso(corsoId);
//	}

}
