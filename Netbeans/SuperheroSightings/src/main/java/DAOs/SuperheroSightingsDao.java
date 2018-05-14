/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs;

import DTOs.Location;
import DTOs.Organization;
import DTOs.Sighting;
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

    public void addCharacter(Character character);

    public void deleteCharacter(int characterId);

    public void updateCharacter(Character character);

    public Character getCharacterById(int characterId);

    public List<Character> getCharactersBySightingId(int sightingId);

    public List<Character> getCharactersByOrganizationId(int organizationId);

    public List<Character> getAllCharacters();

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
}
    

