package service;

import model.Admin;

public interface AdminService {

	Admin getAdminByUsern(String username, String password);
}
