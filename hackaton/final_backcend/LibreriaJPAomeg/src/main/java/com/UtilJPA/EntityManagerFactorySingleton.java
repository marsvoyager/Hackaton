package com.UtilJPA;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerFactorySingleton {
	
	private static EntityManagerFactory emf;
	private EntityManagerFactorySingleton() {
		emf = Persistence.createEntityManagerFactory("TEST_PERSISTENCE_JPA") ;
	}
	public static EntityManagerFactory getInstance() {
		if(emf == null) {
			new EntityManagerFactorySingleton();
		}
		return emf;
	}
	
}
