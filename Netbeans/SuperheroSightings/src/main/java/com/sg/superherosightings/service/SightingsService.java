/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import java.util.Map;

/**
 *
 * @author laptop
 */
public interface SightingsService {
    
    public Sighting addSighting(Sighting sighting);

    public void deleteSighting(int sightingId);

    public void updateSighting(Sighting sighting);

    public Sighting getSightingById(int sightingId);
    
    public Map<String, String>getSightingByIdJoined(int sightingId);
    
    public List<Map<String, String>> getAllSightingsJoined();

    public List<Sighting> getAllSightings();
    
    public List<Sighting> getSightingByLocationId(int id);
    
}
