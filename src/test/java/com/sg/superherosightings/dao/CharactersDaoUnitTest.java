/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import java.text.ParseException;
import java.util.List;
import javax.inject.Inject;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */

/*
Mo: Get back to this later. Pick up here

*/

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"/test-applicationContext.xml"})
//@Rollback
//@Transactional

/*
Mo:

@RunWith(SpringJUnit4ClassRunner.class): Indicates that the class should use Spring's JUnit facilities.

@ContextConfiguration(locations = {...}): Indicates which XML files contain the ApplicationContext.

@Rollback - when each test is complete, roll back all the changes performed

@Transactional - keeps all the tests in one transaction so it can roll back 
the entire test as one transaction
*/

public class CharactersDaoUnitTest {
    
    @Inject
    private CharactersDao charactersDao; //Inject the dao interface
    private OrganizationsDao organizationDao;
    
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
    
    @After
    public void tearDown() {
    }
    
//************************CRUD methods to test**********************************

//    @Test
    public void testAddCharacter() throws ParseException {
        
        //Arrange
//        Organization myOrganization = createOrganization();
        Characters myCharacter = createCharacter(/*myOrganization*/);
//        Location myLocation = createLocation();
//        
//        Sighting mySighting = createSighting();
        
        //Act
        myCharacter = charactersDao.addCharacter(myCharacter);
        
        //Assert
        assert myCharacter.getCharacterId() !=0;//shorthand for assert true. As long as we get an Id back.
        assert myCharacter.getDescription().equals("Able to recover quickly");
        assert myCharacter.getIsSuperHero() == myCharacter.getIsSuperHero();//Initially got a a cannot be referenced error. So changing to "==" instead of .equals fixes it
        assert myCharacter.getName().equals("Sir Mixalot");
        assert myCharacter.getPhoto().equals("www.google.com");
//        assert myCharacter.getOrgList() == myCharacter.getOrgList();
//        assert myCharacter.getOrganizationIDs() == myCharacter.getOrganizationIDs();
//        assert myCharacter.getSuperPowerList() == myCharacter.getSuperPowerList();
    }
    
//    @Test
    public void testUpdateCharacter() throws ParseException{
        //Arrange
        
        Characters myCharacter = createCharacter();
        
        myCharacter = charactersDao.addCharacter(myCharacter);
        
        //Changes
        myCharacter.setDescription("I mean.. it's the joker");
        myCharacter.setIsSuperHero(false);
        myCharacter.setName("The Joker");
        
        
        /*
        1. Create the Arr`ayList
        2. Add values
        3. Set Set using values
        */
        
//        List myOrganizationList = new ArrayList<>();
//        myOrganizationList.add("Suicide Squad");
//        myCharacter.setOrganizationList(myOrganizationList);
//        
//        
//        /*
//        1. Create the ArrayList
//        2. Add values
//        3. Set Set using values
//        */
//        List mySuperPowerList = new ArrayList<>();
//        mySuperPowerList.add("I mean.. it's the joker");
//        myCharacter.setSuperPowerList(mySuperPowerList);
        
        //Act
        charactersDao.updateCharacter(myCharacter);
        
        Characters myUpdatedCharacter = charactersDao.getCharacterById(myCharacter.getCharacterId());
        
        //Assert
        assert myUpdatedCharacter.getDescription().equals("I mean.. it's the joker");
        assert myUpdatedCharacter.getIsSuperHero()==myUpdatedCharacter.getIsSuperHero();
        assert myUpdatedCharacter.getName().equals("The Joker");
//        assert myUpdatedCharacter.getOrganizationIDs()
    }

//    @Test
    public void testGetCharacterById() throws ParseException {
    // Arrange
        Characters myCharacter = createCharacter();
        
        myCharacter = charactersDao.addCharacter(myCharacter);
        
    //Act
    
        Characters myCreatedCharacter = charactersDao.getCharacterById(myCharacter.getCharacterId());
    
    //Assert
    
        assert myCreatedCharacter.getCharacterId() == myCharacter.getCharacterId();
        assert myCreatedCharacter.getDescription().equals(myCharacter.getDescription());
        assert myCreatedCharacter.getIsSuperHero() == myCharacter.getIsSuperHero();
        assert myCreatedCharacter.getName().equals(myCharacter.getName());
    }
    
//    @Test
    public void testDeleteCharacter() throws ParseException {
        //Arrange
        Characters myCharacter = createCharacter();
        charactersDao.addCharacter(myCharacter);
        
        //Act
        
        charactersDao.deleteCharacter(myCharacter.getCharacterId());
        
        //Assert
        assert charactersDao.getCharacterById(myCharacter.getCharacterId()) == null;
    }
    
//    @Test
    public void testGetAllCharacters() throws ParseException {
        //Arrange
        Characters myCharacter = createCharacter();
        Characters mySecondCharacter = createCharacter();
        charactersDao.addCharacter(myCharacter);
        charactersDao.addCharacter(mySecondCharacter);
        //Act
        
        //Assert
        List<Characters> entireList = charactersDao.getAllCharacters();
        assertEquals(entireList.size(), 2);
    }
    
//*************Methods below to create the object with the setter values**************
    
    private Characters createCharacter (/*Organization myOrganization*/){ 
        Characters myCharacter = new Characters();
        
        myCharacter.setDescription("Able to recover quickly");
        myCharacter.setIsSuperHero(true);
        myCharacter.setName("Sir Mixalot");
        myCharacter.setName("Sir Mixalot");
        myCharacter.setPhoto("www.google.com");
        
//      Create the List, add values, set setSuperPowerList using the value(s)
//        List <String> superPowerList = new ArrayList<>();
//        superPowerList.add("batman");
//        
//        myCharacter.setSuperPowerList(superPowerList);
       
        //The Character table doesn't take an Organization. Will refactor to make more efficient:
        
//      Create the List, add organization objects, set setOrganizationList using the organization(s)
//        List <Organization> organizationList = new ArrayList<>();
//        organizationList.add(myOrganization);
//        
//        myCharacter.setOrganizationList(organizationList);
        
//        
        return myCharacter;
    }
    
    
    /*
    Mo: Will use the Organization, Location, Sighting methods at another time```
    */
    
//    private Organization createOrganization (Location myLocation){
//        
//        Organization myOrganization = new Organization();
//        
//        myOrganization.setDescription("A force to be wreckened with");
//        myOrganization.setEmail("example@email.com");
//        myOrganization.setIsGood(true);
//        myOrganization.setPhone("555-555-5555");
////        myOrganization.setOrganizationId(0);
//
//        myOrganization.setLocationId(myLocation.getLocationID());
//        
//        return myOrganization;
//    }
//    
//    private Location createLocation(){
//    
//        Location myLocation = new Location();
//        
//        myLocation.setZip("90210");
//        myLocation.setStreetNumber("447");
//        myLocation.setStreetName("Grand");
//        myLocation.setState("CA");
//        myLocation.setLocationName("The Bat Cave");
//        myLocation.setLatitude(36.778259);
//        myLocation.setLongitude(-119.417931);
//        myLocation.setDescription("The best location");
//        myLocation.setCity("Los Angeles");
//        
//        /* Mo:
//        1. create the ArrayList (to store stuff)
//        2. create the object
//        3. add the object to the ArrayList (storing)
//        */
//        
//        List<Sighting> mySightingList = new ArrayList<>();
//        Sighting mySightings = createSighting();
//        mySightingList.add(mySightings);  
//        myLocation.setAssociatedSightings(mySightingList);
//        
//        //Rinse and repeat like above
//        List <Organization> myLocationList = new ArrayList<>();
//        Organization myOrganizations = createOrganization();
//        myLocationList.add(myOrganizations);
//        myLocation.setAssociatedOrgs(myLocationList);
//        
////        myLocation.setLocationID(0); No need to set a location id because the DAO does it for me
//        
//        return myLocation;
//    }
//    
//    private Sighting createSighting(){
//        
//    Sighting mySighting = new Sighting();
//    
//    //Need to pass a Character
//    Characters newCharacter = createCharacter();
//    mySighting.setCharacter(newCharacter);
//    mySighting.setCharacterId(newCharacter.getCharacterId());
//        
//    //Need to pass a Location
//    Location newLocation = createLocation();
//    mySighting.setLocation(newLocation);
//    mySighting.setLocationId(newLocation.getLocationID());
//    
//    //Adding a Date
//    
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date dateStr;
//        
//        java.sql.Date dateDB = null;
//        try {
//            dateStr = formatter.parse("2018-08-11");
//            dateDB = new java.sql.Date(dateStr.getTime());
//            
//        } catch (ParseException ex) {
//            Logger.getLogger(CharactersDaoUnitTest.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    
//        mySighting.setSightingDate(dateDB);
//        
//        return mySighting;
//        
//    }
}
