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
			this.ps = this.db.getConnessione().prepareStatement(FIND_ALL);
			this.rs = this.ps.executeQuery();
			
			while (rs.next()) {
				int idAppello = rs.getInt(1);
				Date data = rs.getDate("data");
				int corsoId = rs.getInt("materia"); // materia (foreign key)
				
				
				Professore p = new Professore();
				this.ps1 = this.db.getConnessione().prepareStatement(FIND_CORSO_JOIN); //dalla query ottengo il professore
				this.ps1.setInt(1, corsoId);
				this.rs1 = ps1.executeQuery();
				this.rs1.next();
				String nome = rs1.getString("nome");
				String cognome = rs1.getString("cognome");
				p.setNome(nome);
				p.setCognome(cognome);
				System.out.println("Professore trovato: " + p.getNome() + " " + p.getCognome());
			
				Corso c = new Corso();
				this.ps1 = this.db.getConnessione().prepareStatement(FIND_CORSO_JOIN); //dalla stessa query ottengo anche le proprietà della materia
				this.ps1.setInt(1, corsoId); //mi servono le proprietà del corso di quell'appello
				this.rs1 = ps1.executeQuery();
				this.rs1.next();
				String nomeMateria = this.rs1.getString("materia"); // materia (nome corso)
				c.setMateria(nomeMateria);
				c.setProfessore(p);		//aggiungo il professore al corso, in modo tale da poter accedere alle sue proprietà
				
				Appello a = new Appello();
				a.setIdAppello(idAppello);
				a.setData(data);
				a.setCorsoId(c);		//aggiungo il corso all'appello, in modo tale da poter accedere alle sue proprietà
				
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

}
