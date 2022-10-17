package com.jpalibrom;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.UtilJPA.EntityManagerFactorySingleton;

import com.jpalibom.marse.LibroStock;

import com.jpalibom.marse.TABLE2;

public class Servicio {
	
	@SuppressWarnings("unchecked")
	public List<TABLE2> consultaTC() {
		List<TABLE2> result=null;
		
		EntityManager em = EntityManagerFactorySingleton.getInstance()
		.createEntityManager();
		
		
		String qlString="SELECT ct FROM TABLE2 ct";
		Query pacientquery =  em.createQuery(qlString);
		result = pacientquery.getResultList();
		return result;				
	}
	
	@SuppressWarnings("unchecked")
	public
	List<LibroStock> consulta() {
		List<LibroStock> result=null;
		
		EntityManager em = EntityManagerFactorySingleton.getInstance()
		.createEntityManager();
		
		
		String qlString="SELECT l FROM LibroStock l";
		Query pacientquery =  em.createQuery(qlString);
		result = pacientquery.getResultList();
		return result;		
		
	}

	public LibroStock alta(LibroStock nuevostck) {
		// TODO Auto-generated method stub
		EntityManager em = EntityManagerFactorySingleton.getInstance()
		.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(nuevostck);
		em.getTransaction().commit();
		em.close();
		
		return nuevostck;
	}

	public void baja(int parseInt) {
		// TODO Auto-generated method stub
		EntityManager em = EntityManagerFactorySingleton.getInstance()
		.createEntityManager();
		
		em.getTransaction().begin();
		
		LibroStock nuevlibrostock = new LibroStock();
		nuevlibrostock.setId(parseInt);
		
		em.remove(em.contains(nuevlibrostock) ? nuevlibrostock : em.merge(nuevlibrostock));
		em.getTransaction().commit();
		em.close();

	}

	public LibroStock modifica(LibroStock nuevlibrostock) {
		// TODO Auto-generated method stub
		EntityManager em = EntityManagerFactorySingleton.getInstance()
		.createEntityManager();
		
		em.getTransaction().begin();
		
		nuevlibrostock = em.merge(nuevlibrostock);
		em.getTransaction().commit();
		em.close();
		
		return nuevlibrostock;		
		
	}
	

}
