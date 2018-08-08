/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dao.SuperheroSightingsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.service.SHService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Travz
 */
@Controller
public class SHController {

    SHService service;
    SuperheroSightingsDao dao;
    
    /*
    
    Pick up here. Move the request mappings to the appropriate
    classes
    */

    @Inject
    public SHController(SuperheroSightingsDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = {"/", "index", ""}, method = RequestMethod.GET)
    public String loadWindow(HttpServletRequest request, Model model) {
        List<Sighting> sightings = dao.getAllSightings();
        System.out.println(sightings);
        List<Characters> characters = dao.getAssociatedCharacters(sightings);
        List<Location> locations = dao.getAssociatedLocations(sightings);
        model.addAttribute("sightings", sightings);
        model.addAttribute("locations", locations);
        model.addAttribute("characters", characters);
        return "index";
    }

    

    

    

    
    
   

    

    

    @RequestMapping(value = {"/viewLocations"}, method = RequestMethod.GET)
    public String loadLocations(HttpServletRequest request, Model model) {
        List<Location> allLocations = dao.getAllLocations();
        model.addAttribute("locations", allLocations);
        
        
        String display = (request.getParameter("viewType"));
        model.addAttribute("display", display);

        try {
            int id = Integer.parseInt(request.getParameter("locationID"));
            Location location = dao.getLocationById(id);
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
        dao.addLocation(myLocation);

        return "redirect:viewLocations";

    }

    

//    
//    
//    
//    @RequestMapping(value = "/createHero", method = RequestMethod.POST)
//    public String createHero(HttpServletRequest request, Model model) {
//        Characters hero = new Characters();
//        hero.setName(request.getParameter("heroName"));
//        hero.setDescription(request.getParameter("description"));
//        hero.setIsSuperHero(true);
//        for (String e : request.getParameterValues("organizations")) {
//            hero.addOrganization(e);
//        }
//        System.out.println(hero);
//        model.addAttribute("organization", request.getParameterValues("organizations"));
//        dao.addCharacter(hero);
//        return "redirect:viewHeroes";
//    }
}
