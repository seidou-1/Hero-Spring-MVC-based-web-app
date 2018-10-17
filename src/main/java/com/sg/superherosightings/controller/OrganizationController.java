/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.service.OrganizationsService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author laptop
 */
@Controller
public class OrganizationController {
    
        OrganizationsService organizationsService;
        
public OrganizationController(OrganizationsService organizationsService) {
        this.organizationsService = organizationsService;
		}

  @RequestMapping(value = {"/viewOrganizations"}, method = RequestMethod.GET)
    public String loadOrganizations(HttpServletRequest request, Model model) {
        List<Organization> allOrganizations = organizationsService.getAllOrganizations();
        model.addAttribute("organizations", allOrganizations);

        String display = (request.getParameter("viewType"));
        model.addAttribute("display", display);

        try {
            int id = Integer.parseInt(request.getParameter("organizationId"));
            Organization organization = organizationsService.getOrganizationById(id);
            model.addAttribute("organization", organization);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "organizations";
    }
        
  @RequestMapping(value = {"/newOrganization"}, method = RequestMethod.POST)
    public String createOrganization(HttpServletRequest request, Model model) {
        Organization myOrganization = new Organization();

        myOrganization.setOrganizationName(request.getParameter("organizationNameJSP"));
        myOrganization.setDescription(request.getParameter("organizationDescription"));
        myOrganization.setLocationId(Integer.parseInt(request.getParameter("locationId")));

        return "redirect:viewOrganizations";
    }      
        
      
}
