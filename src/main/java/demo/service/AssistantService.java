package demo.service;

import demo.model.Assistant;

public interface AssistantService extends GenericService<Assistant, Integer> {

    Assistant login(Assistant assistant);
}