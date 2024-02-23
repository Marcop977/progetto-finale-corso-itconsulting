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
			this.ps = this.db.getConnessione().prepareStatement(FIND_CORSO_APP);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idAppello = rs.getInt("idAppello");
				Date data = rs.getDate("data");
				int corsoId = rs.getInt("appello.materia");
				String nomeMateria = rs.getString("corso.materia");
				String nomeProf = rs.getString("nome");
				String cognomeProf = rs.getString("cognome");
				
				Professore p = new Professore();
				p.setNome(nomeProf);
				p.setCognome(cognomeProf);
				
				Corso c = new Corso();
				c.setMateria(nomeMateria);
				c.setIdCorso(corsoId);
				c.setProfessore(p);
				
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
	public void addAppello(String data, int idCorso) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setString(1, data);
			this.ps.setInt(2, idCorso);
			this.ps.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateAppello(int idAppello, Date data, String materia) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(UPDATE);
			this.ps.setDate(1, data);;
			this.ps.setString(2, materia);
			this.ps.setInt(3, idAppello);
			this.ps.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteAppello(int idAppello) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(DELETE_PRENOT);
			this.ps.setInt(1, idAppello);
			this.ps.executeUpdate();
			
			this.ps = this.db.getConnessione().prepareStatement(DELETE_BY_ID);
			this.ps.setInt(1, idAppello);
			this.ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
				int idAppelloDB = rs1.getInt(1);
				Date data = rs1.getDate(2);
				int materia = rs1.getInt(3);
				String nomeMateria = rs1.getString(5);
				String nomeProf = rs1.getString("nome");
				String cognomeProf = rs1.getString("cognome");
				
				Professore p = new Professore();
				p.setNome(nomeProf);
				p.setCognome(cognomeProf);
				
				Corso c = new Corso();
				c.setIdCorso(materia);
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
				int idCorso = this.rs.getInt("idcorso");
				String nomeMateria = this.rs.getString("corso.materia");
				int idAppello = this.rs.getInt("idAppello");
				Date data = this.rs.getDate("data");
				
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

	@Override
	public boolean isPrenPresente(int idAppello) {
		boolean esiste = false;
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_PRENOT);
			this.ps.setInt(1, idAppello);
			this.rs = this.ps.executeQuery();
			if (this.rs.next())
				esiste = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return esiste;
	}

	@Override
	public boolean isAppPresente(int idCorso, Date data) {
		boolean esiste = false;
		try {
			this.ps = this.db.getConnessione().prepareStatement(FIND_APP);
			this.ps.setInt(1, idCorso);
			this.ps.setDate(2, data);
			this.rs = this.ps.executeQuery();
			if (this.rs.next())
				esiste = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return esiste;
	}

//	@Override
//	public void deleteAppelloByCorso(int corsoId) {
//		try {
//			this.ps = this.db.getConnessione().prepareStatement(DELETE_BY_CORSO);
//			this.ps.setInt(1, corsoId);
//			this.ps.executeUpdate();			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

}
