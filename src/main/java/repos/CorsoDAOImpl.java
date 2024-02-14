package repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Corso;
import model.Professore;
import model.Studente;

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
			System.out.println("Esecuzione della query: " + FIND_ALL);

			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = ps.executeQuery();
			
			while (rs.next()) {
				int idCorso = rs.getInt(1);
				String materia = rs.getString("materia");
				int cattedraId = rs.getInt("cattedra");
				
				System.out.println("ID corso: " + idCorso + ", Materia: " + materia + ", ID cattedra: " + cattedraId);

				
				Professore p = findProfJoin(cattedraId); //a causa di questa riga di codice, mi stampa solo 1 record. Se la commento mi ridà tutti i corsi

				Corso c = new Corso();
				c.setIdCorso(idCorso);
				c.setMateria(materia);
				c.setCattedraId(cattedraId);
				c.setProfessore(p);
				corsi.add(c);
				System.out.println(cattedraId);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return corsi;
	}

	@Override
	public Studente findById(int idCorso) {
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

	@Override
	public Professore findProfJoin(int matricola) {
		Professore p = new Professore();
		
		try {
			this.ps1 = this.db.getConnessione().prepareStatement(FIND_PROF_JOIN);
			this.ps1.setInt(1, matricola);
			this.rs1 = ps1.executeQuery();
			this.rs1.next();
			String nome = rs1.getString("nome");
			String cognome = rs1.getString("cognome");
			p.setNome(nome);
			p.setCognome(cognome);
			System.out.println("Professore trovato: " + p.getNome() + " " + p.getCognome());

						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
	}

}
