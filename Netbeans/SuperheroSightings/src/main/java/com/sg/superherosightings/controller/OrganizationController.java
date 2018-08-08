/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.service.LocationsService;
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
        LocationsService locationsService;

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
        
  @RequestMapping(value = {"/viewLocations"}, method = RequestMethod.GET)
    public String loadLocations(HttpServletRequest request, Model model) {
        List<Location> allLocations = locationsService.getAllLocations();
        model.addAttribute("locations", allLocations);
        
        
        String display = (request.getParameter("viewType"));
        model.addAttribute("display", display);

        try {
            int id = Integer.parseInt(request.getParameter("locationID"));
            Location location = locationsService.getLocationById(id);
            model.addAttribute("location", location);
        } catch (Exception e) {

        }
        
        
        return "locations";
    }      
        
  @RequestMapping(value = {"/newLocation"}, method = RequestMethod.POST)
    public String createLocation(HttpServletRequest request, Model model) {
        Location myLocation = new Location();
        myLocation.setLocationName(request.getParameter("locationNameJSP"));
        myLocation.setDescription(request.getParameter("descriptionNameJSP"));
        myLocation.setLatitude(Double.parseDouble(request.getParameter("latitudeJSP")));
        myLocation.setLongitude(Double.parseDouble(request.getParameter("longitudeJSP")));
        myLocation.setStreetNumber(request.getParameter("streetNumberJSP"));
        myLocation.setStreetName(request.getParameter("streetNameJSP"));
        myLocation.setCity(request.getParameter("cityJSP"));
        myLocation.setState(request.getParameter("stateJSP"));
        myLocation.setZip(request.getParameter("zipJSP"));

        model.addAttribute("location", request.getParameterValues("locations"));
        locationsService.addLocation(myLocation);

        return "redirect:viewLocations";

    }      
}
