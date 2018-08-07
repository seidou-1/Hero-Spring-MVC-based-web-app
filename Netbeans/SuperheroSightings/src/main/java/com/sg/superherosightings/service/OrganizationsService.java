/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Organization;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface OrganizationsService {
    
    public Organization addOrganization(Organization organization);
    
    public void deleteOrganization(int organizationId);
    
    public void updateOrganization(Organization organization);
    
    public Organization getOrganizationById(int organizationId);
    
    public List<Organization> getAllOrganizations();
    
    public List<Organization> getOrganizationsByCharacter(Characters tempChar);
    
    public List<Organization> getOrganizationByLocationId(int locationId);
    
    
}
