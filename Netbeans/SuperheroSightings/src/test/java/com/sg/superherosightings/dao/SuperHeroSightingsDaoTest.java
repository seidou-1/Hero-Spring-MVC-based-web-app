/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author laptop
 */
public class SuperHeroSightingsDaoTest {
    
    private SuperheroSightingsDao dao;
    
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

    dao = ctx.getBean("superheroDao", SuperheroSightingsDao.class);
    
    //Clear out Character
        List<Characters> characters = dao.getAllCharacters();
        for (Characters currentCharacters : characters) {
            dao.deleteCharacter(currentCharacters.getCharacterId()); 
        //Notice it's getting the getters not the dao
        //i.e. getCharacterId and not getCharacterById
        //because we instantiated the DTO and passed it to the dao        
        }
    
    //Clear out Location
        List<Location> locations = dao.getAllLocations();
        for(Location currentLocation : locations){
            dao.deleteLocation(currentLocation.getLocationID());
        }
    
    //Clear out Organization
        List<Organization> organizations = dao.getAllOrganizations();
        for (Organization currentOrganization : organizations){
            dao.deleteOrganization(currentOrganization.getOrganizationId());
        }
    
    //Clear out Sighting
        List<Sighting> sightings = dao.getAllSightings();
        for (Sighting currentSighting : sightings){
            dao.deleteSighting(currentSighting.getSightingId());
        }
    
    }

   
    /*********************CHARACTERS********************/
    @Test
    public void addGetDeleteCharacter(){ //Test all 3 at once
        
        Characters myCharacters = new Characters();
        myCharacters.setDescription("Spidey senses");
        myCharacters.setIsSuperHero(true);
        myCharacters.setName("Spiderman");
        dao.addCharacter(myCharacters);
        
        //Test you can retrieve it
        Characters fromDB = dao.getCharacterById(myCharacters.getCharacterId());
        assertEquals (fromDB, myCharacters);
        
        //Test it's been removed successfully
        dao.deleteCharacter(myCharacters.getCharacterId());
        assertNull(dao.getCharacterById(myCharacters.getCharacterId()));
     
    }
    
    @Test
    public void addUpdateCharacter(){
        Characters myCharacters = new Characters();
        myCharacters.setName("Hulk");
        myCharacters.setIsSuperHero(false);
        myCharacters.setDescription("Hulk Smash");
        
        dao.addCharacter(myCharacters);
        
        myCharacters.setIsSuperHero(true);
        
        dao.updateCharacter(myCharacters);
        Characters fromDB = dao.getCharacterById(myCharacters.getCharacterId());
        assertEquals (fromDB, myCharacters);
    }
    
    @Test
    public void getAllCharacters(){
        
        Characters myCharacters = new Characters();
        myCharacters.setName("Wolverine");
        myCharacters.setDescription("Alamantium");
        myCharacters.setIsSuperHero(false); 
        dao.addCharacter(myCharacters);
        
        myCharacters.setIsSuperHero(true);
        dao.updateCharacter(myCharacters);
        Characters fromDB = dao.getCharacterById(myCharacters.getCharacterId());
        assertEquals (fromDB, myCharacters);
        
    }
    
    /***************************************************/

   
    
    
    
    
    
    
    /**********************LOCATION*********************/
    @Test
    public void addGetDeleteLocation(){
        Location myLocation = new Location();
        myLocation.setCity("Nola");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(42.11);
        myLocation.setState("ATL");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("The spot");
        
        dao.addLocation(myLocation);
        Location fromDB = dao.getLocationById(myLocation.getLocationID());
        assertEquals (fromDB, myLocation);
        
        dao.deleteLocation(myLocation.getLocationID());
        assertNull (dao.getLocationById(myLocation.getLocationID()));
        
        /*
        Pick up here and finish test methods for:
        addUpdateLocation
        getAllLocations
        */
    }
    
        
    
    /***************************************************/
    
     /*
    Mo - Add code below for search capabilities before tearDown
    */
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
