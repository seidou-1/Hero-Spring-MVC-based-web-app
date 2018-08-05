/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.OrganizationsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Organization;
import java.util.List;

/**
 *
 * @author laptop
 */
public class OrganizationsServiceImpl implements OrganizationsService {
    
    OrganizationsDao organizationsDao;
                                    
    public OrganizationsServiceImpl(OrganizationsDao organizationsDao) {
        this.organizationsDao = organizationsDao;
    }
  
    @Override
    public Organization addOrganization(Organization organization) {
        return organizationsDao.addOrganization(organization);
    }

    @Override
    public void deleteOrganization(int organizationId) {
        organizationsDao.deleteOrganization(organizationId);
    }

    @Override
    public void updateOrganization(Organization organization) {
        organizationsDao.updateOrganization(organization);
    }

    @Override
    public Organization getOrganizationById(int organizationId) {
        return organizationsDao.getOrganizationById(organizationId);
    }

    @Override
    public List<Organization> getAllOrganizations() {
        return organizationsDao.getAllOrganizations();
    }

    @Override
    public List<Organization> getOrganizationsByCharacter(Characters tempChar) {
        return organizationsDao.getOrganizationsByCharacter(tempChar);
    }

    @Override
    public List<Organization> getOrganizationByLocationId(int id) {
        return organizationsDao.getOrganizationByLocationId(id);
    }
    
}
