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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

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
public class SightingsDaoUnitTest {

    @Inject
    private SightingsDao sightingsDao;
    @Inject
    private OrganizationsDao organizationsDao;
    @Inject
    private LocationsDao locationDao;
    @Inject
    private CharactersDao charactersDao; //Inject the dao interface

    public SightingsDaoUnitTest() {

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

    @Test
    public void testAddSighting() throws ParseException {
        String oldstring = "2011/01/18 00:00";
        LocalDateTime datetime = LocalDateTime.parse(oldstring, DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
        Date myDate = new Date();

      
//Arrange
        //        Characters myCharacter = createCharacter();
        //        Location myLocation = createLocation();
        //
        //        Sighting mySighting = createSighting(myCharacter, myLocation);
        //        Date myDate = createDate();
        //        //Act
        //        mySighting = sightingsDao.addSighting(mySighting);
        ////
        ////        //Assert
        //        assert mySighting.getCharacterId() != 0;
        //        assert mySighting.getLocationId() != 0;
        //        assert mySighting.getSightingDate().equals(myDate);;

    }

//    @Test

        //Arrange
        Characters myCharacter = createCharacter();
        Location myLocation = createLocation();

        Sighting mySighting = createSighting(myCharacter, myLocation);
        Date myDate = createDate();
        //Act
        mySighting = sightingsDao.addSighting(mySighting);
//
//        //Assert
        assert mySighting.getCharacterId() != 0;
        assert mySighting.getLocationId() != 0;
        assert mySighting.getSightingDate().equals(myDate);;

    }

    @Test
    public void testGetSightingByID() throws ParseException {

        //Arrange
        Characters myCharacter = createCharacter();
        Location myLocation = createLocation();
        Sighting mySighting = createSighting(myCharacter, myLocation);
        Date myDate = createDate();
        mySighting = sightingsDao.addSighting(mySighting);

        //Act
        Sighting daoSighting = sightingsDao.getSightingById(mySighting.getSightingId());
//
//        //Assert
        assert mySighting.getCharacterId() == daoSighting.getCharacterId();
        assert mySighting.getLocationId() == daoSighting.getLocationId();
        assert mySighting.getSightingDate().equals(daoSighting.getSightingDate());;

    }

    @Test
    public void testDeletePost() {
        //Arrange
        Characters myCharacter = createCharacter();
        Location myLocation = createLocation();
        Sighting mySighting = createSighting(myCharacter, myLocation);
        Date myDate = createDate();
        mySighting = sightingsDao.addSighting(mySighting);

        //Act
        assert sightingsDao.getSightingById(mySighting.getSightingId()) != null
        sightingsDao.deleteSighting(mySighting.getSightingId());

        assert sightingsDao.getSightingById(mySighting.getSightingId()) == null;
    }

    @Test
    public void testUpdatePost() {
        //Arrange
        Characters myCharacter = createCharacter();
        Location myLocation = createLocation();
        Sighting mySighting = createSighting(myCharacter, myLocation);

        mySighting = sightingsDao.addSighting(mySighting);

        //Act
        Date myDate = new Date();
        mySighting.setSightingDate(myDate);

        Characters myCharacter2 = createCharacter();
        Location myLocation2 = createLocation();

        mySighting.setCharacterId(myCharacter2.getCharacterId());
        mySighting.setLocationId(myLocation2.getLocationID());

        sightingsDao.updateSighting(mySighting);

        Sighting daoSighting = sightingsDao.getSightingById(mySighting.getSightingId());

        assert sightingsDao.getSightingById(daoSighting.getSightingId()).getSightingId() == mySighting.getSightingId();
        assert mySighting.getCharacterId() == daoSighting.getCharacterId();
        assert mySighting.getLocationId() == daoSighting.getLocationId();

    }

    @After
    public void tearDown() {
    }

    private Characters createCharacter() { //Mo: Purposely removed the (Characters character) argument because wer're not adding, we're creating
        Characters myCharacter = new Characters();

        myCharacter.setDescription("Able to recover quickly");
        myCharacter.setIsSuperHero(true);
        myCharacter.setName("Sir Mixalot");

//      Create the List, add values, set setSuperPowerList using the value(s)
        List<String> superPowerList = new ArrayList<>();
        superPowerList.add("batman");

//        myCharacter.setSuperPowerList(superPowerList);

//      Create the List, add organization objects, set setOrganizationList using the organization(s)
        List<Organization> organizationList = new ArrayList<>();
//        Organization myOrganization = createOrganization(); //Calls the createOrganization method below which already has all the values
//        organizationList.add(myOrganization);

//        myCharacter.setOrganizationList(organizationList);
        myCharacter = charactersDao.addCharacter(myCharacter);

//
        return myCharacter;
    }

    private Organization createOrganization() {

        Organization myOrganization = new Organization();
        Location myLocation = new Location(); //Need to instantiate a location because Organization depends on it

        myOrganization.setDescription("A force to be wreckened with");
        myOrganization.setEmail("example@email.com");
        myOrganization.setIsGood(true);
        myOrganization.setPhone("555-555-5555");
        myOrganization.setOrganizationName("pettyBoop");

        myOrganization.setLocationId(myLocation.getLocationID());
//        myOrganization = organizationsDao.addOrganization(myOrganization);

        return myOrganization;
    }

    private Location createLocation() {

        Location myLocation = new Location();

        myLocation.setZip("90210");
        myLocation.setStreetNumber("447");
        myLocation.setStreetName("Grand");
        myLocation.setState("CA");
        myLocation.setLocationName("The Bat Cave");
        myLocation.setLatitude(36.778259);
        myLocation.setLongitude(-119.417931);
        myLocation.setDescription("The best location");
        myLocation.setCity("Los Angeles");

        /* Mo:
       1. create the ArrayList (to store stuff)
       2. create the object
       3. add the object to the ArrayList (storing)
         */
        List<Sighting> mySightingList = new ArrayList<>();
//        Sighting mySightings = createSighting();
//        mySightingList.add(mySightings);
        myLocation.setAssociatedSightings(mySightingList);

        //Rinse and repeat like above
        List<Organization> myLocationList = new ArrayList<>();
//        Organization myOrganizations = createOrganization();
//        myLocationList.add(myOrganizations);
//        myLocation.setAssociatedOrgs(myLocationList);

        myLocation = locationDao.addLocation(myLocation);

        return myLocation;
    }

    private Sighting createSighting(Characters myCharacter, Location myLocation) {

        Sighting mySighting = new Sighting();

        //Need to pass a Character
//        Characters newCharacter = createCharacter();
        mySighting.setCharacter(myCharacter);
        mySighting.setCharacterId(myCharacter.getCharacterId());

        //Need to pass a Location
//        Location newLocation = createLocation();
        mySighting.setLocation(myLocation);
        mySighting.setLocationId(myLocation.getLocationID());

        //Adding a Date
        mySighting.setSightingDate(createDate());

//        mySighting = sightingsDao.addSighting(mySighting);
        return mySighting;

    }

    private Date createDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr;

        java.sql.Date dateDB = null;
        try {
            dateStr = formatter.parse("2018-08-11");
            dateDB = new java.sql.Date(dateStr.getTime());

        } catch (ParseException ex) {
            Logger.getLogger(CharactersDaoUnitTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dateDB;
    }

}
