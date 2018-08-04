/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dao.SightingDaoDbImpl;
import com.sg.superherosightings.dao.SuperheroSightingsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.service.CharactersService;
import com.sg.superherosightings.service.SHService;
import com.sg.superherosightings.service.SightingService;

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
public class SightingController {
     //Change these later to include SightingService and SightingDao
    SHService service;
    SightingService sightingService; //Change this to more specific SightingDao
    CharactersService charactersService;
    //Add Service dependency injection for Character, Location, and Organization
    
    @RequestMapping(value = {"/viewSightings"}, method = RequestMethod.GET)
    public String loadsightings(HttpServletRequest request, Model model) {
        List<Sighting> sightings = sightingService.getAllSightings();
        List<Characters> characters = charactersService.getAssociatedCharacters(sightings);
        List<Location> locations = dao.getAssociatedLocations(sightings);
        model.addAttribute("sightings", sightings);
        model.addAttribute("locations", locations);
        model.addAttribute("characters", characters);
        String sightingID = request.getParameter("sightingID");
        String viewType = (request.getParameter("viewType"));
        model.addAttribute("sightingID", sightingID);
        model.addAttribute("viewType", viewType);
        return "sightings";
    }
    
    @RequestMapping(value = {"/newSighting"}, method = RequestMethod.GET)
    public String createSighting(HttpServletRequest request, Model model) {

        return "creation";
    }
    
}
