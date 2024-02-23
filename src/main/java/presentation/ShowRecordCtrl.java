package presentation;

import java.util.List;

import model.Appello;
import model.Corso;
import model.Prenotazione;
import model.Professore;
import model.Studente;
import service.AppelloService;
import service.AppelloServiceImpl;
import service.CorsoService;
import service.CorsoServiceImpl;
import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;
import service.ProfessoreService;
import service.ProfessoreServiceImpl;
import service.StudenteService;
import service.StudenteServiceImpl;

public class ShowRecordCtrl {
	StudenteService serviceStud = new StudenteServiceImpl();
	ProfessoreService serviceProf = new ProfessoreServiceImpl();
	CorsoService serviceCorso = new CorsoServiceImpl();
	AppelloService serviceApp = new AppelloServiceImpl();
	PrenotazioneService servicePren = new PrenotazioneServiceImpl();

	public List<Studente> mostraStudenti(){
		return serviceStud.getStudenti();
	}
	
	public List<Professore> mostraProfessori(){
		return serviceProf.getProfessori();
	}
	
	public List<Corso> mostraCorsi(){
		return serviceCorso.getCorsi();
	}
	
	public List<Corso> mostraCorsiByProf(int cattedra) {
		return serviceCorso.getByProf(cattedra);
	}
	
	public List<Appello> mostraAppelli(){
		return serviceApp.getAppelli();
	}
	
	public List<Prenotazione> mostraPrenotazioni(){
		return servicePren.getPrenotazioni();
	}
}
