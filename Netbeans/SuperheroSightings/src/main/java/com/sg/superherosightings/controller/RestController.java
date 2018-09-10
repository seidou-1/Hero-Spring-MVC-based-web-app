/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;


import com.sg.superherosightings.dao.CharactersDao;
import com.sg.superherosightings.dao.LocationsDao;
import com.sg.superherosightings.dao.SightingsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Rich
 */
@CrossOrigin
@Controller
public class RestController {

    private SightingsDao sightingsDao;
    private CharactersDao characterDao;
    private LocationsDao locationDao;

//    private SuperheroSightingsDao dao;


    /*
    Mo: At some point will replace SuperheroSightingsDao with appropriate
    dependency injection
     */
    @Inject
    public RestController(SightingsDao sightingsDao, CharactersDao characterDao, LocationsDao locationDao) {
        this.sightingsDao = sightingsDao;
        this.characterDao = characterDao;
        this.locationDao = locationDao;
    }
//
//    //----------------------------------------------------------------- CHARACTERS  
////CREATE CHARACTER ENDPOINT
//    @RequestMapping(value = "/character", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.CREATED)
//    @ResponseBody
//    public Characters addCharacter(@RequestBody Characters character) {
//        return sightingsDao.addCharacter(character);
//    }
//
////    //CREATE IMAGE ENDPOINT
////    @RequestMapping(value = "/AddImage", method = RequestMethod.POST)
////    @ResponseStatus(HttpStatus.CREATED)
////    @ResponseBody
////    public Photo addImage(@RequestBody Photo image) {
////        return sightingsDao.addImage(image);
////    }
////    
////    RETRIEVE CHARACTER ENDPOINT
//    @RequestMapping(value = "/image/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Photo getImage(@PathVariable("id") long id) {
//        return sightingsDao.getImageByID((int) id);
//    }
//
//// DELETE CHARACTER ENDPOINT
//    @RequestMapping(value = "/character/{id}", method = RequestMethod.DELETE)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void deleteCharacter(@PathVariable("id") long id) {
//        sightingsDao.deleteCharacter((int) id);
//    }
//
//// UPDATE CHARACTER ENDPOINT
//    @RequestMapping(value = "/character/{id}", method = RequestMethod.PUT)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void updateCharacter(@PathVariable("id") long id, @RequestBody Characters character) {
//        // favor the path variable over the id in the object if they differ
//        character.setCharacterId((int) id);
//        sightingsDao.updateCharacter(character);
//    }
//
// GET ALL CHARACTERS ENDPOINT

    @RequestMapping(value = "/getCharacters", method = RequestMethod.GET)
    @ResponseBody
    public List<Characters> getAllCharacters() {
        return characterDao.getAllCharacters();
    }
//
////RETRIEVE CHARACTER ENDPOINT
//    @RequestMapping(value = "/character/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Characters getCharacter(@PathVariable("id") long id) {
//        return sightingsDao.getCharacterById((int) id);
//    }
//
////----------------------Sighting
//// 
////--------------------------------------------------------------------  SIGHTING
//// CREATE SIGHTING ENDPOINT
//    @RequestMapping(value = "/sightings", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.CREATED)
//    @ResponseBody
//    public Sighting addSighting(@RequestBody Sighting sighting) {
//        return sightingsDao.addSighting(sighting);
//    }
////DELETE SIGHTING ENDPOINT
//
//    @RequestMapping(value = "/sighting/{id}", method = RequestMethod.DELETE)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void deleteSighting(@PathVariable("id") long id) {
//        sightingsDao.deleteSighting((int) id);
//    }
//
//// UPDATE SIGHTING ENDPOINT
//    @RequestMapping(value = "/sighting/{id}", method = RequestMethod.PUT)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void updateSighting(@PathVariable("id") long id, @RequestBody Sighting sighting) {
//        sighting.setSightingId((int) id);
//        sightingsDao.updateSighting(sighting);
//    }
//
////GET ALL SIGHTINGS ENDPOINT
//    @RequestMapping(value = "/sightings", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Map<String, String>> getAllSightings() {
//        List<Map<String, String>> sightings = sightingsDao.getAllSightingsJoined();
//        return sightings;
//    }
//
////RETRIEVE SIGHTING ENDPOINT
////    @RequestMapping(value = "/sighting/{id}", method = RequestMethod.GET)
////    @ResponseBody
////    public Sighting getSighting(@PathVariable("id") long id) {
////        return sightingsDao.getSightingById((int) id);
////    }
////    
//    @RequestMapping(value = "/sightings/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, String> getJoinedSighting(@PathVariable("id") long id) {
//        return sightingsDao.getSightingByIdJoined((int) id);
//    }
//
//
////----------------------------------------------------------------- LOCATION
//// CREATE LOCATION ENDPOINT
//    @RequestMapping(value = "/locations", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.CREATED)
//    @ResponseBody
//    public Location addLocation(@RequestBody Location location) {
//        return sightingsDao.addLocation(location);
//    }
//
////DELETE LOCATION ENDPOINT
//    @RequestMapping(value = "/locations/{id}", method = RequestMethod.DELETE)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void deleteLocation(@PathVariable("id") long id) {
//        sightingsDao.deleteLocation((int) id);
//    }
//
////UPDATE LOCATION ENDPOINT
//    @RequestMapping(value = "/locations/{id}", method = RequestMethod.PUT)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void updateLocation(@PathVariable("id") long id, @RequestBody Location location) {
////        location.setLocationId((int) id);
//        sightingsDao.updateLocation(location);
//    }
//
//GET ALL LOCATIONS ENDPOINT

    @RequestMapping(value = "/getLocations", method = RequestMethod.GET)
    @ResponseBody
    public List<Location> getAllLocations() {
        return locationDao.getAllLocations();
    }
    
    @RequestMapping(value = "/locations", method = RequestMethod.GET)
    @ResponseBody
    public List<Location> getLocations() {
        return locationDao.getAllLocations();
    }
//    
//    
//
//RETRIEVE LOCATIONS ENDPOINT
    @RequestMapping(value = "/locations/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Location  getLocation(@PathVariable("id") int id) {

        Location locale = locationDao.getLocationById(id);
       
//        List<Organization> orgs = organizationDao.getOrganizationByLocationId(id);
//        List<Sighting> sights = locationDao.getSightingByLocationId(id);
//        
//        locale.setAssociatedOrgs(orgs);
//        locale.setAssociatedSightings(sights);

        return locale;
    }
//
////------------------------------------------------------------------------ ORGANIZATIONS
//// CREATE ORGANIZATIONS ENDPOINT
//    @RequestMapping(value = "/organizations", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.CREATED)
//    @ResponseBody
//    public Organization addOrganization(@RequestBody Organization organization) {
//        return sightingsDao.addOrganization(organization);
//    }
//
////DELETE ORGANIZATION ENDPOINT
//    @RequestMapping(value = "/organizations/{id}", method = RequestMethod.DELETE)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void deleteOrganization(@PathVariable("id") long id) {
//        sightingsDao.deleteOrganization((int) id);
//    }
//
////UPDATE ORGANIZATION ENDPOINT
//    @RequestMapping(value = "/organizations/{id}", method = RequestMethod.PUT)
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void updateOrganization(@PathVariable("id") long id, @RequestBody Organization organization) {
//        organization.setOrganizationId((int) id);
//        sightingsDao.updateOrganization(organization);
//    }
//
////GET ALL ORGANIZATION ENDPOINT
//    @RequestMapping(value = "/organizations", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Organization> getAllOrganizations() {
//        return sightingsDao.getAllOrganizations();
//    }
//
////RETRIEVE ORGANIZATION ENDPOINT
//    @RequestMapping(value = "/organizations/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Organization getOrganization(@PathVariable("id") long id) {
//        return sightingsDao.getOrganizationById((int) id);
//    }
//

}
