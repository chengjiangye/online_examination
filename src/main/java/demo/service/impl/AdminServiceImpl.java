package demo.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Admin;
import demo.service.AdminService;

@Service
public class AdminServiceImpl extends GenericServiceImpl<Admin, Integer> implements AdminService {

    @Autowired
    public AdminServiceImpl(GenericDao<Admin, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public Admin login(Admin admin) {
        String plainPassword = admin.getPassword();
        admin = genericDao.query("admin.queryAdminByEmail", admin.getEmail());
        if (admin != null) {
            String encryptedPassword = admin.getPassword();
            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            if (strongPasswordEncryptor.checkPassword(plainPassword, encryptedPassword)) {
                return admin;
            }
        }
        return null;
    }
}