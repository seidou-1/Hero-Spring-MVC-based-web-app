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

/**
 *
 * @sighting josesosa
 */
public interface SuperheroSightingsDao {
    

    public void addSighting(Sighting sighting);

    public void deleteSighting(int sightingId);

    public void updateSighting(Sighting sighting);

    public Sighting getSightingById(int sightingId);

    public List<Sighting> getAllSightings();

    public void addCharacter(Characters character);

    public void deleteCharacter(int characterId);

    public void updateCharacter(Characters character);

    public Characters getCharacterById(int characterId);

    public List<Characters> getCharactersBySightingId(int sightingId);

    public List<Characters> getCharactersByOrganizationId(int organizationId);

    public List<Characters> getAllCharacters();

    public void addOrganization(Organization organization);

    public void deleteOrganization(int organizationId);

    public void updateOrganization(Organization organization);

    public Organization getOrganizationById(int organizationId);

    public List<Organization> getAllOrganizations();
    
    public void addLocation(Location location);

    public void deleteLocation(int locationId);

    public void updateLocation(Location location);

    public Location getLocationById(int locationId);

    public List<Location> getAllLocations();

    public List<Sighting> getLastTenSightings();

    public List<Characters> getAssociatedCharacters(List<Sighting> sightings);

    public List<Location> getAssociatedLocations(List<Sighting> sightings);
}
    

