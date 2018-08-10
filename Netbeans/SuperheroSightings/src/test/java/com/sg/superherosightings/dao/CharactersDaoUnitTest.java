/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/test-applicationContext.xml"})
@Rollback
@Transactional

/*
Mo:

@RunWith(SpringJUnit4ClassRunner.class): Indicates that the class should use Spring's JUnit facilities.

@ContextConfiguration(locations = {...}): Indicates which XML files contain the ApplicationContext.

@Rollback - when each test is complete, roll back all the changes performed

@Transactional - keeps all the tests in one transaction so it can roll back 
the entire test as one transaction
*/

public class CharactersDaoUnitTest {
    
    private CharactersDao charactersDao; //Inject the dao interface
    
    public CharactersDaoUnitTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
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
