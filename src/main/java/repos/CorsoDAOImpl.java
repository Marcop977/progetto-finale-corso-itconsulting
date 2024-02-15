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

public class CorsoDAOImpl implements CorsoDAO {
	
	Connessione db = new Connessione();
	PreparedStatement ps;
	PreparedStatement ps1;
	ResultSet rs;
	ResultSet rs1;

	@Override
	public List<Corso> findAll() {
		List<Corso> corsi = new ArrayList<>();
		
		try {
			this.ps = db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idCorso = this.rs.getInt(1);
				int idProfessore = this.rs.getInt(2);
				String nomeMateria = this.rs.getString(3);
				String nomeProf = this.rs.getString(4);
				String cognomeProf = this.rs.getString(5);
				
				Professore p1 = new Professore();
				p1.setIdProfessore(idProfessore);
				p1.setNome(nomeProf);
				p1.setCognome(cognomeProf);

				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(nomeMateria);
				c.setProfessore(p1);
				
				corsi.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return corsi;
	}

	@Override
	public Corso findById(int idCorso) {
		return null;
	}

	@Override
	public void addCorso(Corso c, Professore p) {
		try {
			this.ps = this.db.getConnessione().prepareStatement(ADD);
			this.ps.setString(1, c.getMateria());
			this.ps.setInt(2, p.getIdProfessore());
			this.ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateCorso(Corso c) {

	}

	@Override
	public void deleteCorso(int idCorso) {
		// TODO Auto-generated method stub

	}

	@Override
	public void closeConnection() {
		try {
			 if (this.rs != null) {
		            this.rs.close();
		        }
		        if (this.ps != null) {
		            this.ps.close();
		        }
		        if (this.db != null && this.db.getConnessione() != null) {
		            this.db.getConnessione().close();
		        }
		 } catch (SQLException e) {
		        e.printStackTrace();
		 }	

	}




//	@Override
//	public Professore findProfJoin(int matricola) {
//		Professore p = new Professore();
//		
//		try {
//			this.ps1 = this.db.getConnessione().prepareStatement(FIND_PROF_JOIN);
//			this.ps1.setInt(1, matricola);
//			this.rs1 = ps1.executeQuery();
//			this.rs1.next();
//			String nome = rs1.getString("nome");
//			String cognome = rs1.getString("cognome");
//			p.setNome(nome);
//			p.setCognome(cognome);
//			System.out.println("Professore trovato: " + p.getNome() + " " + p.getCognome());
//
//						
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return p;
//	}

}
