/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Photo;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import java.util.Map;

/**
 *
 * @sighting josesosa
 */
public interface SuperheroSightingsDao {

    /*
    Mo - changed the return type of the create methods from void to the object 
    i.e. addCharacters was void and changed it to "public Characters addCharacter"
    
    Same for Location, Sighting, and Organization
    
     */
    

    

    public Organization addOrganization(Organization organization);

    public void deleteOrganization(int organizationId);

    public void updateOrganization(Organization organization);

    public Organization getOrganizationById(int organizationId);

    public List<Organization> getAllOrganizations();

    public Location addLocation(Location location);

    public void deleteLocation(int locationId);

    public void updateLocation(Location location);

    public Location getLocationById(int locationId);

    public List<Location> getAllLocations();

    
    public List<Location> getAssociatedLocations(List<Sighting> sightings);

    public List<Characters> getAllHeroes();

    public List<Characters> getAllVillains();

    public Photo addImage(Photo image);

    public Photo getImageByID(int imageID);

    public List<Organization> getOrganizationsByCharacter(Characters tempChar);

    public void setCharactersOrgList(List<Characters> temp);

    public List<String> getSuperPowersByCharacter(Characters tempChar);

    public void setCharactersSPList(List<Characters> temp);

    public List<Organization> getOrganizationByLocationId(int id);

    

    }
