package com.bridgelabz.hibApp.UTIL;

import com.bridgelabz.hibApp.DAO.DemoDao;
import com.bridgelabz.hibApp.DTO.DemoDto;

public class testerinsert {

	public static void main(String[] args) {
		DemoDto dt = new DemoDto();
		dt.setBrand("manoj");
		dt.setPrice(3000.00);
		dt.setColor("yelow");
		
		DemoDto dt2 = new DemoDto();
		dt2.setBrand("sunil");
		dt2.setPrice(3000.00);
		dt2.setColor("green");
		
		DemoDao dao = new DemoDao();
		dao.save(dt);
		DemoDao dao1 = new DemoDao();
		dao1.save(dt2);
		System.out.println("Sucessfully inserted");


	}
}
