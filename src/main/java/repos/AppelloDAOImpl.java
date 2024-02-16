package repos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Appello;
import model.Corso;
import model.Professore;

import model.Corso;

public class AppelloDAOImpl implements AppelloDAO {
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	ResultSet rs;
	PreparedStatement ps1;
	ResultSet rs1;
	PreparedStatement ps2;
	ResultSet rs2;

	@Override
	public List<Appello> findAll() {
		List<Appello> appelli = new ArrayList<>();
		
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idAppello = rs.getInt(1);
				Date data = rs.getDate(2);
				Corso c = (Corso) rs.getObject(3);
				
				Appello a = new Appello();
				a.setIdAppello(idAppello);
				a.setData(data);
				a.setCorsoId(c);
				
				appelli.add(a);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return appelli;
	}

	@Override
	public Appello findById(int idAppello) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAppello(Appello a) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAppello(Appello a) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAppello(int idAppello) {
		// TODO Auto-generated method stub

	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Appello> findAppByCorsoID(int idCorso) {
		List<Appello> appelli = new ArrayList<>();
		
		try {
			this.ps1 = db.getConnessione().prepareStatement(FIND_BY_ID);
			this.ps1.setInt(1, idCorso);
			this.rs1 = ps1.executeQuery();
			
			while (rs1.next()) {
				int idCorsoDB = rs1.getInt(2);
				String nomeMateria = rs1.getString(1);
				int idProfessore = rs1.getInt(5);
				String nomeProf = rs1.getString(3);
				String cognomeProf = rs1.getString(4);
				String username = rs1.getString(6);
				String password = rs1.getString(7);
				Date data = rs1.getDate(8);
				int idAppelloDB = rs1.getInt(9);
				
				Professore p = new Professore();
				p.setIdProfessore(idProfessore);
				p.setNome(nomeProf);
				p.setCognome(cognomeProf);
				p.setUsername(username);
				p.setPassword(password);
				
				Corso c = new Corso();
				c.setIdCorso(idCorsoDB);
				c.setMateria(nomeMateria);
				c.setProfessore(p);
				
				Appello a = new Appello();
				a.setIdAppello(idAppelloDB);
				a.setCorsoId(c);
				a.setData(data);
				
				appelli.add(a);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appelli;
	}
	
	@Override
	public List<Appello> findByProf(Professore p) {
		List<Appello> appelli = new ArrayList<>();
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_BY_PROF);
			this.ps.setInt(1, p.getIdProfessore());
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idCorso = this.rs.getInt(1);
				String nomeMateria = this.rs.getString(2);
				int idAppello = this.rs.getInt(3);
				Date data = this.rs.getDate(4);
				
				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(nomeMateria);
				c.setProfessore(p);
				
				Appello a = new Appello();
				a.setCorsoId(c);
				a.setData(data);
				a.setIdAppello(idAppello);
				
				appelli.add(a);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return appelli;
	}

	@Override
	public List<Appello> findCorsiApp() {
		List<Appello> appelli = new ArrayList<>();
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_CORSO_APP);
			this.rs = this.ps.executeQuery();
			
			while (this.rs.next()) {
				int idCorso = this.rs.getInt(1);
				String nomeMateria = this.rs.getString(2);
				String nomeProf = this.rs.getString(3);
				String cognomeProf = this.rs.getString(4);
				int idAppello = this.rs.getInt(5);
				Date data = this.rs.getDate(6);
//				Corso c = (Corso) this.rs.getObject(7);
				
				Professore p = new Professore();
				p.setNome(nomeProf);
				p.setCognome(cognomeProf);
				
				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(nomeMateria);
				c.setProfessore(p);
				
				Appello a = new Appello();
				a.setData(data);
				a.setIdAppello(idAppello);
				a.setCorsoId(c);
				
				appelli.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return appelli;
	}

}
