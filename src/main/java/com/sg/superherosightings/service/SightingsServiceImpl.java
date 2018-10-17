/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.SightingsDao;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import java.util.Map;

/**
 *
 * @author laptop
 */
public class SightingsServiceImpl implements SightingsService {
    
    SightingsDao sightingsDao;
    
    public SightingsServiceImpl(SightingsDao sightingsDao) {
		this.sightingsDao = sightingsDao;
	}

	@Override
    public Sighting addSighting(Sighting sighting) {
        return sightingsDao.addSighting(sighting);
    }

    @Override
    public void deleteSighting(int sightingId) {
        sightingsDao.deleteSighting(sightingId);
    }

    @Override
    public void updateSighting(Sighting sighting) {
        sightingsDao.updateSighting(sighting);
    }

    @Override
    public Sighting getSightingById(int sightingId) {
        return sightingsDao.getSightingById(sightingId);
    }

    @Override
    public Map<String, String> getSightingByIdJoined(int sightingId) {
        return sightingsDao.getSightingByIdJoined(sightingId);
    }

    @Override
    public List<Map<String, String>> getAllSightingsJoined() {
    	return sightingsDao.getAllSightingsJoined();
    }

    @Override
    public List<Sighting> getAllSightings() {
        return sightingsDao.getAllSightings();
    }

    @Override
    public List<Sighting> getSightingByLocationId(int id) {
        return sightingsDao.getSightingByLocationId(id);
    }
    
}
