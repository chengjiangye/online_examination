package demo.service.impl;

import demo.model.Class;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Assistant;
import demo.service.AssistantService;

@Service
public class AssistantServiceImpl extends GenericServiceImpl<Assistant, Integer> implements AssistantService {

    @Autowired
    public AssistantServiceImpl(GenericDao<Assistant, Integer> genericDao) {
        super(genericDao);
    }

    @Override
    public Assistant login(Assistant assistant) {
        String plainPassword = assistant.getPassword();
        assistant = genericDao.query("assistant.queryAssistantByEmail", assistant.getEmail());
        if (assistant != null) {
            String encryptedPassword = assistant.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(plainPassword, encryptedPassword)) {
                return assistant;
            }
        }
        return null;
    }
}