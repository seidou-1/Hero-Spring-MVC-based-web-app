/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import java.text.ParseException;
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
        //Mo: using the above annotations, no need to clear out each Dao
    }
    
    public void testAddCharacter() throws ParseException {
        
        //Arrange
        
        
        //Act
        
        
        //Assert
    }
    
    @After
    public void tearDown() {
    }

    //Methods below to create the object with the setter values
    
    private Characters addCharacter (Characters character){
        Characters myCharacter = new Characters();
        
        myCharacter.setDescription("Able to recover quickly");
        myCharacter.setIsSuperHero(true);
        myCharacter.setName("Sir Mixalot");
//        myCharacter.setOrganizationList(organizationsByCharacter);
        
        return myCharacter;
    }
}
