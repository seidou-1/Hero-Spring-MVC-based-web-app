/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import DAOs.SuperheroSightingsDao;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author laptop
 */
public class SuperHeroSightingsDaoTest {
    
    public SuperHeroSightingsDaoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        
         ApplicationContext ctx
  = new ClassPathXmlApplicationContext("test-applicationContext.xml");

    dao = ctx.getBean("SuperheroSightingsDao", SuperheroSightingsDao.class);
    
    //Clear out Character
    
    //Clear out Location
    
    //Clear out Organization
    
    //Clear out Sighting
    
    
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
