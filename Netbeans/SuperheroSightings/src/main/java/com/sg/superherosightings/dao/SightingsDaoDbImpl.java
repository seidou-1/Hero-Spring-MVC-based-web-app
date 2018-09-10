/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * @author laptop
 */
public class SightingsDaoDbImpl implements SightingsDao{
    
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    //Prepared Statements
     private static final String SQL_INSERT_SIGHTING
            = "insert into `Sighting` ( LocationID, CharacterID, SightingDate)" + "values (?, ?, ?)";

    private static final String SQL_DELETE_SIGHTING
            = "delete from Sighting where SightingID = ?";

    private static final String SQL_UPDATE_SIGHTING
            = "update Sighting set LocationId = ?, CharacterID = ?, SightingDate = ? " + "where SightingID =  ?";

    private static final String SQL_SELECT_SIGHTING
            = "select * from Sighting where SightingID = ?";

    private static final String SQL_SELECT_SIGHTING_BY_SIGHTINGDATE
            = "select * from Sighting where SightingDate = ?";

    private static final String SQL_SELECT_ALL_SIGHTINGS
            = "select * from `Sighting`";

//    private static final String SQL_SELECT_LAST_TEN_SIGHTINGS
//            = "select * FROM Sighting ORDER BY SightingID DESC LIMIT 10";
    
    /*************IMAGES******************/
    //Create seperate Images Dao later
    private static final String SQL_SELECT_ALL_SIGHTINGS_JOINED
            = "select sight.SightingID, sight.SightingDate,  chara.CharacterID, chara.CharacterName, loc.LocationName, loc.LocationID, loc.Latitude, loc.Longitude from `Location` loc"
            + " inner join `Sighting` sight on loc.LocationID =  sight.LocationID"
            + " inner join `Characters` chara on sight.CharacterID = chara.CharacterID";

    private static final String SQL_SELECT_SIGHTINGS_BY_SIGHTINGID
            = "select sight.SightingID, sight.SightingDate,  chara.CharacterID, chara.CharacterName, loc.LocationName, loc.LocationID, loc.Latitude, loc.Longitude from `Location` loc"
            + " inner join `Sighting` sight on loc.LocationID =  sight.LocationID"
            + " inner join `Characters` chara on sight.CharacterID = chara.CharacterID"
            + " where sight.sightingID = ?";
    
    private static final String SQL_SELECT_SIGHTING_BY_LOCATION_ID
            = "select * from Sighting where LocationId = ?";
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Sighting addSighting(Sighting sighting) {
        jdbcTemplate.update(SQL_INSERT_SIGHTING,
                sighting.getLocationId(),
                sighting.getCharacterId(),
                sighting.getSightingDate());
//                sighting.getSightingId());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        sighting.setSightingId(newId);
        return sighting;

    }
 
    @Override
    public void deleteSighting(int sightingId) {
        jdbcTemplate.update(SQL_DELETE_SIGHTING, sightingId);
    }

    @Override
    public void updateSighting(Sighting sighting) {
        jdbcTemplate.update(SQL_UPDATE_SIGHTING,
                sighting.getLocationId(),
                sighting.getCharacterId(),
                sighting.getSightingDate(),
                sighting.getSightingId());
    }

    @Override
    public Sighting getSightingById(int sightingId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SIGHTING,
                    new SightingsDaoDbImpl.SightingMapper(), sightingId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given sighting id - we just 
            // want to return null in this case
            return null;
        }
    }

    @Override
    public Map<String, String> getSightingByIdJoined(int sightingId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SIGHTINGS_BY_SIGHTINGID,
                    new SightingsDaoDbImpl.JoinedSightingMapper(), sightingId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just 
            // want to return null in this case
            return null;
        }
    }

    @Override
    public List<Map<String, String>> getAllSightingsJoined() {
        try {
            return jdbcTemplate.query(SQL_SELECT_ALL_SIGHTINGS_JOINED,
                    new SightingsDaoDbImpl.JoinedSightingMapper());
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just 
            // want to return null in this case
            return null;
        }
    }

    @Override
    public List<Sighting> getAllSightings() {
        return jdbcTemplate.query(SQL_SELECT_ALL_SIGHTINGS,
                new SightingsDaoDbImpl.SightingMapper());
    }

    @Override
    public List<Sighting> getSightingByLocationId(int locationId) {
        try {
            return jdbcTemplate.query(SQL_SELECT_SIGHTING_BY_LOCATION_ID,
                    new SightingsDaoDbImpl.SightingMapper(), locationId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just
            // want to return null in this case
            return null;
        }
    }
    
    private static final class SightingMapper implements RowMapper<Sighting> {

        public Sighting mapRow(ResultSet rs, int rowNum) throws SQLException {
            Sighting sighting = new Sighting();
            sighting.setSightingId(rs.getInt("SightingID"));
            sighting.setLocationId(rs.getInt("LocationID"));
            sighting.setCharacterId(rs.getInt("CharacterID"));
            sighting.setSightingDate((rs.getTimestamp("SightingDate"))); //took out .toLocalDate()

            return sighting;
        }
    }

    private static final class JoinedSightingMapper implements RowMapper<Map<String, String>> {

        public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
            Map<String, String> sightings = new HashMap<>();

            sightings.put("SightingID", rs.getString("SightingID"));
            sightings.put("SightingDate", rs.getTimestamp("SightingDate").toString());
            sightings.put("CharacterID", rs.getString("CharacterID"));
            sightings.put("CharacterName", rs.getString("CharacterName"));
            sightings.put("LocationID", rs.getString("LocationID"));
            sightings.put("LocationName", rs.getString("LocationName"));
            sightings.put("latitude", rs.getString("Latitude"));
            sightings.put("longitude", rs.getString("Longitude"));

            return sightings;
        }

        public Map<String, Object> mapRow(ResultSet rs) throws SQLException {
            Map<String, Object> sightings = new HashMap<>();

            sightings.put("SightingID", rs.getString("SightingID"));
            sightings.put("SightingDate", rs.getTimestamp("SightingDate").toString());
            sightings.put("CharacterID", rs.getString("CharacterID"));
            sightings.put("CharacterName", rs.getString("CharacterName"));
            sightings.put("LocationID", rs.getString("LocationID"));
            sightings.put("LocationName", rs.getString("LocationName"));
            sightings.put("latitude", rs.getString("Latitude"));
            sightings.put("longitude", rs.getString("Longitude"));

            return sightings;
        }

    }
    
}
