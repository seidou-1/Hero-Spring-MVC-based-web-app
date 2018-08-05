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
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @sighting josesosa
 */
public class SuperheroSightingsDbDao implements SuperheroSightingsDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    // Prepared statements for MySql, basically the query that will be run in MySql throught the Spring, JDBC hocus pocus

    // Sighting prepared statements
   
    // Character prepared statements
   

    //Organizations prepared statements
    private static final String SQL_INSERT_ORGANIZATION
            = "insert into Organization (OrganizationName, LocationID, Description )" + " values (?, ?, ?)";

    private static final String SQL_DELETE_ORGANIZATION
            = "delete from Organization where OrganizationID = ?";

    private static final String SQL_UPDATE_ORGANIZATION
            = "update Organization set OrganizationName = ?, LocationID = ?, Description = ?" + "where OrganizationID = ?";

    private static final String SQL_SELECT_ORGANIZATION
            = "select * from Organization where OrganizationId = ?";

    private static final String SQL_SELECT_ORGANIZATIONS_BY_CHARACTER
            = ""; // revisit after checking out join statements;

    private static final String SQL_SELECT_ALL_ORGANIZATIONS
            = "select * from Organization";

    //Locations prepared statements
    

    //Images prepared statements
    private static final String SQL_INSERT_IMAGE
            = "insert into `Images` (Name, ImageType, Image) " + " values (?, ?, ?)";

    private static final String SQL_SELECT_IMAGE
            = "select * from `Images` where ImageID = ?";

    private static final String SQL_SELECT_ORGANIZATION_BY_LOCATION_ID
            = "select * from Organization where LocationId = ?";

    

    private static final String SQL_SELECT_ORGANIZATIONS_BY_CHARACTERID
            = "select org.OrganizationId , org.OrganizationName , org.LocationID , org.Description from Organization org"
            + " Join Character_Organization corg on org.OrganizationId  = corg.OrganizationId where CharacterId = ?";

    private static final String SQL_SELECT_SUPERPOWERS_BY_CHARACTERID
            = "select sp.SuperpowerId , sp.SuperPowerType from Superpower sp"
            + " Join Character_SuperPower cs on sp.SuperpowerID  = cS.SuperpowerId where CharacterId = ?";

    

    
    /**
     * ********************SIGHTING**************************
     */
    
    
    

    @Override
    public List<Organization> getOrganizationByLocationId(int locationId) {
        try {
            return jdbcTemplate.query(SQL_SELECT_ORGANIZATION_BY_LOCATION_ID,
                    new SuperheroSightingsDbDao.OrganizationMapper(), locationId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just
            // want to return null in this case
            return null;
        }
    }
    
    /**
     * ********************CHARACTERS**************************
     */
    

    /**
     * ********************HEROES**************************
     */
    

    /**
     * ********************VILLAINS**************************
     */
    

    /**
     * ********************ORGANIZATION**************************
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Organization addOrganization(Organization organization) {
        jdbcTemplate.update(SQL_INSERT_ORGANIZATION,
                organization.getOrganizationName(),
                organization.getLocationId(),
                organization.getDescription());

        /*
        Query the database for the ID that was just assigned to the new row in the DB
         */
        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        //Set the new id value on the Organization object and return it
        organization.setOrganizationId(newId);
        return organization;
    }

    @Override
    public void deleteOrganization(int organizationId) {
        jdbcTemplate.update(SQL_DELETE_ORGANIZATION, organizationId);
    }

    @Override
    public void updateOrganization(Organization organization) {
        jdbcTemplate.update(SQL_UPDATE_ORGANIZATION,
                organization.getOrganizationName(),
                organization.getLocationId(),
                organization.getDescription(),
                organization.getOrganizationId());
    }

    @Override
    public Organization getOrganizationById(int organizationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_ORGANIZATION, new OrganizationMapper(), organizationId);
        } catch (EmptyResultDataAccessException ex) {

            return null;
        }
    }

    @Override
    public List<Organization> getAllOrganizations() {
        return jdbcTemplate.query(SQL_SELECT_ALL_ORGANIZATIONS, new OrganizationMapper());
    }

    /**
     * ********************LOCATION**************************
     */
    
    
    @Override
    public List<Organization> getOrganizationsByCharacter(Characters tempChar) {
        List<Organization> helperOrganizationList = jdbcTemplate.query(SQL_SELECT_ORGANIZATIONS_BY_CHARACTERID,
                new OrganizationMapper(), tempChar.getCharacterId());
        return helperOrganizationList;
    }

    @Override
    public void setCharactersOrgList(List<Characters> temp) {
        List<String> helperOrganizationStringList = new ArrayList<String>();

        for (Characters charact : temp) {
            charact.setOrganizationList(getOrganizationsByCharacter(charact));

        }

    }

    @Override
    public List<String> getSuperPowersByCharacter(Characters tempChar) {
        List<String> helperSuperPowerList = jdbcTemplate.query(SQL_SELECT_SUPERPOWERS_BY_CHARACTERID,
                new SuperPowerMapper(), tempChar.getCharacterId());
        return helperSuperPowerList;
    }

    @Override
    public void setCharactersSPList(List<Characters> temp) {

        for (Characters charact : temp) {
            charact.setSuperPowerList(getSuperPowersByCharacter(charact));

        }
    }

    // Photo methods
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Photo addImage(Photo image) {
        jdbcTemplate.update(SQL_INSERT_IMAGE,
                image.getName(),
                image.getType());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID", Integer.class);

        image.setImageID(newId);

        return image;

    }

    @Override
    public Photo getImageByID(int imageID) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_IMAGE,
                    new ImageMapper(), imageID);
        } catch (Exception ex) {
//            EmptyResultDataAccessException
            System.out.println("I had an exception");

            return null;
        }
    }

    /**
     * ********************Mapper Below**************************
     */
    private static final class OrganizationMapper implements RowMapper<Organization> {

        public Organization mapRow(ResultSet rs, int rowNum) throws SQLException {
            Organization organization = new Organization();
            organization.setOrganizationId(rs.getInt("OrganizationId"));
            organization.setOrganizationName(rs.getString("OrganizationName"));
            organization.setLocationId(rs.getInt("LocationId"));
            organization.setDescription(rs.getString("Description"));

            /*
            Mo - No need for these anymore:
            
            Location location;
            List<Characters> memberList;
             */
            return organization;

        }
    }

    


    
    private static final class ImageMapper implements RowMapper<Photo> {

        public Photo mapRow(ResultSet rs, int rowNum) throws SQLException {
            Photo img = new Photo();
            img.setImageID(rs.getInt("ImageID"));
            img.setName(rs.getString("Name"));
            img.setType(rs.getString("ImageType"));

            Blob myImage = rs.getBlob(4);
            int length = (int) myImage.length();

            return img;

        }
    }

    private static final class SuperPowerMapper implements RowMapper<String> {

        public String mapRow(ResultSet rs, int rowNum) throws SQLException {
            String superPower;
            superPower = rs.getString("SuperPowerType");

            return superPower;
        }
    }

}
