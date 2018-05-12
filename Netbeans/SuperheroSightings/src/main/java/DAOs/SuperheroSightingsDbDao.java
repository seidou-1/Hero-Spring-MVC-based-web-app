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
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @sighting josesosa
 */
public class SuperheroSightingsDbDao implements SuperheroSightingsDao {
    
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private static final String SQL_INSERT_SIGHTING
    = "insert into Sightings ( LocationID, CharacterID, SightingDate +  values (?, ?, ?, )";

    private static final String SQL_DELETE_SIGHTING
        = "delete from Sightings where SightingID = ?";

    private static final String SQL_UPDATE_SIGHTING
        = "update Sightings set LocationId = ?, CharacterID = ? " + "where SightingID =  ?";

    private static final String SQL_SELECT_SIGHTING
        = "select * from Sightings where SightingID = ?";

    private static final String SQL_SELECT_SIGHTING_BY_SIGHTINGDATE =
            "select * from Sightings where SightingDate = ?"; 

    private static final String SQL_SELECT_ALL_SIGHTINGS
        = "select * from Sightings";
    
    private static final String SQL_INSERT_CHARACTER
    = "insert into Character (Name, Description, IsSuperHero " + " values (?, ?, ?";

private static final String SQL_DELETE_CHARACTER
    = "delete from Character where CharacterID = ?";

private static final String SQL_UPDATE_CHARACTER
    = "update Character set Name = ?, Description = ?, IsSuperHero = ?, "+ " CharacterID =  ?";

private static final String SQL_SELECT_CHARACTER
    = "select * from Character where CharacterId = ?";

private static final String SQL_SELECT_CHARACTERS_BY_ORGANIZATION
    = ""; // revisit after checking out join statements;

private static final String SQL_SELECT_CHARACTERS_BY_ORGANIZATION
    = ""; 

private static final String SQL_SELECT_ALL_CHARACTERS
    = "select * from authors";

    @Override
    public void addSighting(Sighting sighting) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteSighting(int sightingId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateSighting(Sighting sighting) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Sighting getSightingById(int sightingId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sighting> getAllSightings() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addCharacter(Character character) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteCharacter(int characterId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateCharacter(Character character) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Character getCharacterById(int characterId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Character> getCharactersBySightingId(int sightingId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Character> getCharactersByOrganizationId(int organizationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Character> getAllCharacters() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addOrganization(Organization organization) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteOrganization(int organizationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateOrganization(Organization organization) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Organization getOrganizationById(int organizationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Organization> getAllOrganizations() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addLocation(Location location) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteLocation(int locationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateLocation(Location location) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Location getLocationById(int locationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Location> getAllLocations() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
