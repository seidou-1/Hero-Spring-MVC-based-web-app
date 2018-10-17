/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.LocationsDao;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;

/**
 *
 * @author laptop
 */
public class LocationsServiceImpl implements LocationsService{
    
    LocationsDao locationsDao;

    public LocationsServiceImpl(LocationsDao locationsDao) {
        this.locationsDao = locationsDao;
    }

    @Override
    public Location addLocation(Location location) {
        return locationsDao.addLocation(location);
    }

    @Override
    public void deleteLocation(int locationId) {
        locationsDao.deleteLocation(locationId);
    }

    @Override
    public void updateLocation(Location location) {
        locationsDao.updateLocation(location);
    }

    @Override
    public Location getLocationById(int locationId) {
        return locationsDao.getLocationById(locationId);
    }

    @Override
    public List<Location> getAllLocations() {
        return locationsDao.getAllLocations();
    }

    @Override
    public List<Location> getAssociatedLocations(List<Sighting> sightings) {
        return locationsDao.getAssociatedLocations(sightings);
    }
    
    
}
