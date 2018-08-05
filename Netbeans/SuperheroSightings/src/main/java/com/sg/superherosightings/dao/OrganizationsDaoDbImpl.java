/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Organization;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */
public class OrganizationsDaoDbImpl implements OrganizationsDao{
    
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

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
    
    private static final String SQL_SELECT_ORGANIZATION_BY_LOCATION_ID
            = "select * from Organization where LocationId = ?";

    private static final String SQL_SELECT_ORGANIZATIONS_BY_CHARACTERID
            = "select org.OrganizationId , org.OrganizationName , org.LocationID , org.Description from Organization org"
            + " Join Character_Organization corg on org.OrganizationId  = corg.OrganizationId where CharacterId = ?";

    
    
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
            return jdbcTemplate.queryForObject(SQL_SELECT_ORGANIZATION, new OrganizationsDaoDbImpl.OrganizationMapper(), organizationId);
        } catch (EmptyResultDataAccessException ex) {

            return null;
        }
    }

    @Override
    public List<Organization> getAllOrganizations() {
        return jdbcTemplate.query(SQL_SELECT_ALL_ORGANIZATIONS, new OrganizationsDaoDbImpl.OrganizationMapper());
    }    
    
    @Override
    public List<Organization> getOrganizationsByCharacter(Characters tempChar) {
        List<Organization> helperOrganizationList = jdbcTemplate.query(SQL_SELECT_ORGANIZATIONS_BY_CHARACTERID,
                new OrganizationsDaoDbImpl.OrganizationMapper(), tempChar.getCharacterId());
        return helperOrganizationList;
    }
    
    @Override
    public List<Organization> getOrganizationByLocationId(int locationId) {
        try {
            return jdbcTemplate.query(SQL_SELECT_ORGANIZATION_BY_LOCATION_ID,
                    new OrganizationsDaoDbImpl.OrganizationMapper(), locationId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just
            // want to return null in this case
            return null;
        }
    }
    
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
    
}
