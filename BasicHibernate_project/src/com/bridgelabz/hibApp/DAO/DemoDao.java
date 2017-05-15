package com.bridgelabz.hibApp.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import com.bridgelabz.hibApp.DTO.DemoDto;

public class DemoDao {

	public void save(DemoDto demodto) {
		System.out.println("Saving dto");
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure();
     
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();

		Transaction tx = session.beginTransaction();
		session.save(demodto);

		tx.commit();
		session.close();
		factory.close();
	}

}
