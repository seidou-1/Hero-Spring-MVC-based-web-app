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
    

    //Locations prepared statements
    

    //Images prepared statements
    

    

    
    /**
     * ********************SIGHTING**************************
     */
    
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
    
    /**
     * ********************LOCATION**************************
     */
    
    
    
    

    
    // Photo methods
    

    /**
     * ********************Mapper Below**************************
     */
    


    
    
    

}
