package service;

import model.Admin;
import repos.AdminDAO;
import repos.AdminDAOImpl;


public class AdminServiceImpl implements AdminService {
	
	AdminDAO dao = new AdminDAOImpl();

	@Override
	public Admin getAdminByUsern(String u, String p) {
		return this.dao.findByUser(u, p);
	}

}
