/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.SightingDao;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;
import java.util.Map;

/**
 *
 * @author laptop
 */
public class SightingsServiceImpl implements SightingsService {
    
    SightingDao sightingDao;

    public SightingsServiceImpl(SightingDao sightingDao) {
		this.sightingDao = sightingDao;
	}

	@Override
    public Sighting addSighting(Sighting sighting) {
        return sightingDao.addSighting(sighting);
    }

    @Override
    public void deleteSighting(int sightingId) {
        sightingDao.deleteSighting(sightingId);
    }

    @Override
    public void updateSighting(Sighting sighting) {
        sightingDao.updateSighting(sighting);
    }

    @Override
    public Sighting getSightingById(int sightingId) {
        return sightingDao.getSightingById(sightingId);
    }

    @Override
    public Map<String, String> getSightingByIdJoined(int sightingId) {
        return sightingDao.getSightingByIdJoined(sightingId);
    }

    @Override
    public List<Map<String, String>> getAllSightingsJoined() {
    	return sightingDao.getAllSightingsJoined();
    }

    @Override
    public List<Sighting> getAllSightings() {
        return sightingDao.getAllSightings();
    }

    @Override
    public List<Sighting> getSightingByLocationId(int id) {
        return sightingDao.getSightingByLocationId(id);
    }
    
}
