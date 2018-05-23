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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
        for (Location currentLocation : locations) {
            dao.deleteLocation(currentLocation.getLocationID());
        }

        //Clear out Organization
        List<Organization> organizations = dao.getAllOrganizations();
        for (Organization currentOrganization : organizations) {
            dao.deleteOrganization(currentOrganization.getOrganizationId());
        }

        //Clear out Sighting
        List<Sighting> sightings = dao.getAllSightings();
        for (Sighting currentSighting : sightings) {
            dao.deleteSighting(currentSighting.getSightingId());
        }

    }

    /**
     * *******************CHARACTERS*******************
     */
    @Test
    public void addGetDeleteCharacter() { //Test all 3 at once

        Characters myCharacters = new Characters();
        myCharacters.setDescription("Spidey senses");
        myCharacters.setIsSuperHero(true);
        myCharacters.setName("Spiderman");
        dao.addCharacter(myCharacters);

        //Test you can retrieve it
        Characters fromDB = dao.getCharacterById(myCharacters.getCharacterId());
        assertEquals(fromDB, myCharacters);

        //Test it's been removed successfully
        dao.deleteCharacter(myCharacters.getCharacterId());
        assertNull(dao.getCharacterById(myCharacters.getCharacterId()));

    }

    @Test
    public void addUpdateCharacter() {
        Characters myCharacters = new Characters();
        myCharacters.setName("Hulk");
        myCharacters.setIsSuperHero(false);
        myCharacters.setDescription("Hulk Smash");

        dao.addCharacter(myCharacters);

        myCharacters.setIsSuperHero(true);

        dao.updateCharacter(myCharacters);
        Characters fromDB = dao.getCharacterById(myCharacters.getCharacterId());
        assertEquals(fromDB, myCharacters);
    }

    @Test
    public void getAllCharacters() {

        Characters myCharacters = new Characters();
        myCharacters.setName("Wolverine");
        myCharacters.setDescription("Alamantium");
        myCharacters.setIsSuperHero(true);
        dao.addCharacter(myCharacters);

        Characters myCharacters2 = new Characters();
        myCharacters2.setName("Iron Man");
        myCharacters2.setDescription("Tony Starks");
        myCharacters2.setIsSuperHero(true);
        dao.addCharacter(myCharacters2);

        List<Characters> entireList = dao.getAllCharacters();
        assertEquals(entireList.size(), 2);

    }

    /**
     * ************************************************
     */
//    
    /**
     * ********************LOCATION********************
     */
    @Test
    public void addGetDeleteLocation() {
        Location myLocation = new Location();
        myLocation.setCity("Nola");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("ATL");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");

        dao.addLocation(myLocation);
        Location fromDB = dao.getLocationById(myLocation.getLocationID());
        assertEquals(fromDB, myLocation);

        dao.deleteLocation(myLocation.getLocationID());
        assertNull(dao.getLocationById(myLocation.getLocationID()));

    }

    @Test
    public void addUpdateLocation() {
        Location myLocation = new Location();

        myLocation.setLocationName("Place");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setStreetNumber("2332");
        myLocation.setStreetName("Hero St.");
        myLocation.setCity("queens");
        myLocation.setState("NY");
        myLocation.setZip("39023");

        dao.addLocation(myLocation);

        myLocation.setCity("nyc");

        dao.updateLocation(myLocation);

        Location fromDB = dao.getLocationById(myLocation.getLocationID());
        assertEquals(fromDB, myLocation);

    }

    @Test
    public void getAllLocations() {
        Location myLocation = new Location();
        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");

        dao.addLocation(myLocation);

        Location myLocation2 = new Location();
        myLocation2.setCity("ny");
        myLocation2.setDescription("boogie down");
        myLocation2.setLatitude(13.33);
        myLocation2.setLongitude(43.22);
        myLocation2.setLocationName("bx");
        myLocation2.setState("new york");
        myLocation2.setStreetName("the plaza");
        myLocation2.setStreetNumber("122");
        myLocation2.setZip("10302");

        dao.addLocation(myLocation2);

        List<Location> entireList = dao.getAllLocations();
        assertEquals(entireList.size(), 2);

    }

    /**
     * ********************ORGANIZATION********************
     */
    @Test
    public void addGetDeleteOrganization() {
        /*Since Organization has a foreignkey to Location, I will create
        a location object first to get the LocationID created      
         */

        Location myLocation = new Location();
        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");

        dao.addLocation(myLocation);

        Location fromDB = dao.getLocationById(myLocation.getLocationID());
//        assertEquals (fromDB, myLocation);

        Organization myOrganization = new Organization();
        myOrganization.setOrganizationName("The Avengers");
        myOrganization.setDescription("A bunch of awesome superheroes");
        myOrganization.setLocationId(fromDB.getLocationID());
        dao.addOrganization(myOrganization);

//        Organization mySecond = new Organization();
//        mySecond.setOrganizationName("The Avengers");
//        mySecond.setDescription("A bunch of awesome superheroes");
//        mySecond.setLocationId(fromDB.getLocationID());
//        dao.addOrganization(mySecond);
//        
//          List<Organization> entireList = dao.getAllOrganizations();
//        assertEquals(entireList.size(), 2);
        //Test retrieval
        Organization fromDatabase = dao.getOrganizationById(myOrganization.getOrganizationId());
        assertEquals(fromDatabase, myOrganization);

        //Test removal - we need to delete the child first (organization) before the parent
        dao.deleteOrganization(myOrganization.getOrganizationId());

        dao.deleteLocation(myLocation.getLocationID());

        assertNull(dao.getOrganizationById(myOrganization.getOrganizationId()));
    }

    @Test
    public void addGetUpdateOrganization() {

        Location myLocation = new Location();
        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");

        dao.addLocation(myLocation);

        Location fromDB = dao.getLocationById(myLocation.getLocationID());

        Organization myOrganization = new Organization();
        myOrganization.setDescription("describe");
        myOrganization.setOrganizationName("namee");
        myOrganization.setLocationId(fromDB.getLocationID());

        dao.addOrganization(myOrganization);

        myOrganization.setDescription("new description");

        dao.updateOrganization(myOrganization);
        Organization fromDatabase = dao.getOrganizationById(myOrganization.getOrganizationId());
        assertEquals(fromDatabase, myOrganization);

    }

    @Test
    public void getAllOrganizations() {
        Location myLocation = new Location();
        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");

        dao.addLocation(myLocation);

        Location fromDatabase = dao.getLocationById(myLocation.getLocationID());

        Organization myOrganization = new Organization();
        myOrganization.setOrganizationName("X-Force");
        myOrganization.setDescription("DeadPool's Organization");
        myOrganization.setLocationId(fromDatabase.getLocationID());

        dao.addOrganization(myOrganization);

        Organization myOrganization2 = new Organization();
        myOrganization2.setOrganizationName("X-Force 2");
        myOrganization2.setDescription("DeadPool's Organization 2");
        myOrganization2.setLocationId(fromDatabase.getLocationID());

        dao.addOrganization(myOrganization2);

        List<Organization> entireList = dao.getAllOrganizations();
        assertEquals(entireList.size(), 2);

    }

    /**
     * ************************************************
     */
    /**
     * ********************SIGHTING********************
     */
    @Test
    public void addGetDeleteSighting() throws ParseException {
        //Create location
        //Create character
        //These are both fk's

        //Create sighting
        Location myLocation = new Location();

        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");
        dao.addLocation(myLocation);

        Location LocationFromDb = dao.getLocationById(myLocation.getLocationID());

        Characters myCharacters = new Characters();
        myCharacters.setName("Hulk");
        myCharacters.setIsSuperHero(false);
        myCharacters.setDescription("Hulk Smash");
        dao.addCharacter(myCharacters);

        Characters CharactersFromDb = dao.getCharacterById(myCharacters.getCharacterId());

        Sighting mySighting = new Sighting();

        mySighting.setCharacter(myCharacters);
        mySighting.setCharacterId(CharactersFromDb.getCharacterId());
        mySighting.setLocation(myLocation);
        mySighting.setLocationId(LocationFromDb.getLocationID());

//        String date = request.getParameter("date");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        mySighting.setSightingDate(dateDB);

        dao.addSighting(mySighting);

        Sighting sightingFromDb = dao.getSightingById(mySighting.getSightingId());
        assertEquals(mySighting, sightingFromDb);

        //Test it's been removed successfully
        dao.deleteSighting(mySighting.getSightingId());
        assertNull(dao.getSightingById(mySighting.getSightingId()));

    }

    @Test
    public void addGetUpdateSighting() throws ParseException {
        //Create location
        //Create character
        //These are both fk's

        //Create sighting
        Location myLocation = new Location();

        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");
        dao.addLocation(myLocation);

        Location LocationFromDb = dao.getLocationById(myLocation.getLocationID());

        Characters myCharacters = new Characters();
        myCharacters.setName("Hulk");
        myCharacters.setIsSuperHero(false);
        myCharacters.setDescription("Hulk Smash");
        dao.addCharacter(myCharacters);

        Characters CharactersFromDb = dao.getCharacterById(myCharacters.getCharacterId());

        Sighting mySighting = new Sighting();

        mySighting.setCharacter(myCharacters);
        mySighting.setCharacterId(CharactersFromDb.getCharacterId());
        mySighting.setLocation(myLocation);
        mySighting.setLocationId(LocationFromDb.getLocationID());

//        String date = request.getParameter("date");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        mySighting.setSightingDate(dateDB);
        
        dao.addSighting(mySighting);
        
        //make a change to the date:
        java.util.Date newDateStr = formatter.parse("2018-01-20");
        mySighting.setSightingDate(newDateStr);
        
        //Call update method
        dao.updateSighting(mySighting);

    }
    @Test
    public void getAllSightings() throws ParseException{
        //Create location
        //Create character
        //These are both fk's

        //Create sighting
        Location myLocation = new Location();

        myLocation.setCity("queens");
        myLocation.setDescription("Nice city");
        myLocation.setLatitude(34.22);
        myLocation.setLongitude(34.22);
        myLocation.setState("NY");
        myLocation.setStreetName("Hero St.");
        myLocation.setStreetNumber("2332");
        myLocation.setZip("39023");
        myLocation.setLocationName("Place");
        dao.addLocation(myLocation);

        Location LocationFromDb = dao.getLocationById(myLocation.getLocationID());

        Characters myCharacters = new Characters();
        myCharacters.setName("Hulk");
        myCharacters.setIsSuperHero(false);
        myCharacters.setDescription("Hulk Smash");
        dao.addCharacter(myCharacters);

        Characters CharactersFromDb = dao.getCharacterById(myCharacters.getCharacterId());

        Sighting mySighting = new Sighting();

        mySighting.setCharacter(myCharacters);
        mySighting.setCharacterId(CharactersFromDb.getCharacterId());
        mySighting.setLocation(myLocation);
        mySighting.setLocationId(LocationFromDb.getLocationID());

//        String date = request.getParameter("date");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        mySighting.setSightingDate(dateDB);
        
        dao.addSighting(mySighting);
        
        List<Sighting> entireList = dao.getAllSightings();
        assertEquals(entireList.size(), 1);
        
    }

    /**
     * ************************************************
     */
    /*
    Mo:
    These remaining dao methods can be excluded from test:
    public List<Sighting> getLastTenSightings();

    public List<Characters> getAssociatedCharacters(List<Sighting> sightings);

    public List<Location> getAssociatedLocations(List<Sighting> sightings);
    
    Add code below for search capabilities before tearDown
     */
    @After
    public void tearDown() {
    }

}
