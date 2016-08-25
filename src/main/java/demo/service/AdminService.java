package demo.service;

import demo.model.Admin;

public interface AdminService extends GenericService<Admin, Integer> {
    Admin login(Admin admin);
}