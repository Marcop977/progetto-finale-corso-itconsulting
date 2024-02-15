package service;

import java.util.List;

import repos.AppelloDAO;
import repos.AppelloDAOImpl;

import model.Appello;
import model.Professore;

public class AppelloServiceImpl implements AppelloService {
	
	AppelloDAO dao = new AppelloDAOImpl();

	@Override
	public List<Appello> getAppelliById(int idAppello) {
		return this.dao.findAppById(idAppello);
	}

	@Override
	public void addAppello(Appello a) {
		this.dao.addAppello(a);
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

}
