/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Sighting;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class LocationsDaoDbImpl implements LocationsDao {
    
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private static final String SQL_INSERT_LOCATION
            = "insert into Location (LocationName, Description, Latitude, Longitude, StreetNumber, StreetName, City, State, ZipCode )" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_LOCATION
            = "delete from Location where LocationID = ?";

    private static final String SQL_UPDATE_LOCATION
            = "UPDATE Location SET LocationName = ?, Description = ?, Latitude = ?, Longitude = ?, StreetNumber = ?, StreetName = ?, City = ?, State = ?, ZipCode = ?  " + " WHERE LocationID = ? ";

    private static final String SQL_SELECT_LOCATION
            = "select * from Location where LocationId = ?";

    private static final String SQL_SELECT_LOCATION_BY_CHARACTER
            = ""; // revisit after checking out join statements;

    private static final String SQL_SELECT_ALL_LOCATIONS
            = "select * from Location";
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Location addLocation(Location location) {
        jdbcTemplate.update(SQL_INSERT_LOCATION,
                location.getLocationName(),
                location.getDescription(),
                location.getLatitude(),
                location.getLongitude(),
                location.getStreetNumber(),
                location.getStreetName(),
                location.getCity(),
                location.getState(),
                location.getZip());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        location.setLocationID(newId);

        return location;

    }

    @Override
    public void deleteLocation(int locationId) {
        jdbcTemplate.update(SQL_DELETE_LOCATION, locationId);
    }

    @Override
    public void updateLocation(Location location) {
        jdbcTemplate.update(SQL_UPDATE_LOCATION,
                location.getLocationName(),
                location.getDescription(),
                location.getLatitude(),
                location.getLongitude(),
                location.getStreetNumber(),
                location.getStreetName(),
                location.getCity(),
                location.getState(),
                location.getZip(),
                location.getLocationID());

    }

    @Override
    public Location getLocationById(int locationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_LOCATION,
                    new LocationsDaoDbImpl.LocationMapper(), locationId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just 
            // want to return null in this case
            return null;
        }
    }

    @Override
    public List<Location> getAllLocations() {
        return jdbcTemplate.query(SQL_SELECT_ALL_LOCATIONS,
                new LocationsDaoDbImpl.LocationMapper());
    }

    // HELPER METHODS???
    @Override
    public List<Location> getAssociatedLocations(List<Sighting> temp) {
        List<Location> helperLocationList = new ArrayList<Location>();

        for (Sighting sight : temp) {
            Location local = getLocationById(sight.getLocationId());
            helperLocationList.add(local);
            sight.setLocation(local);
        }
        return helperLocationList;
    }

    private static final class LocationMapper implements RowMapper<Location> {

        public Location mapRow(ResultSet rs, int rowNum) throws SQLException {
            Location local = new Location();
            local.setLocationID(rs.getInt("LocationID"));
            local.setLocationName(rs.getString("LocationName"));
            local.setDescription(rs.getString("Description"));
            local.setLatitude(rs.getDouble("Latitude"));
            local.setLongitude(rs.getDouble("Longitude"));
            local.setStreetNumber(rs.getString("StreetNumber"));
            local.setStreetName(rs.getString("StreetName"));
            local.setCity(rs.getString("City"));
            local.setState(rs.getString("State"));
            local.setZip(rs.getString("ZipCode"));

            return local;

        }
    }

}
