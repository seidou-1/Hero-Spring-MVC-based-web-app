/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.service.CharactersService;
import com.sg.superherosightings.service.LocationsService;
import com.sg.superherosightings.service.OrganizationsService;
import com.sg.superherosightings.service.SightingsService;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class SightingsController {

    SightingsService sightingsService;
    CharactersService charactersService;
    LocationsService locationsService;
    OrganizationsService organizationsService;

    public SightingsController(SightingsService sightingsService,
            CharactersService charactersService, LocationsService locationsService, OrganizationsService organizationsService) {

        this.sightingsService = sightingsService;
        this.charactersService = charactersService;
        this.locationsService = locationsService;
        this.organizationsService = organizationsService;
    }

    @RequestMapping(value = {"/viewSightings"}, method = RequestMethod.GET)
    public String loadsightings(HttpServletRequest request, Model model) {
        List<Sighting> sightings = sightingsService.getAllSightings();
        List<Characters> characters = charactersService.getAssociatedCharacters(sightings);
        List<Location> locations = locationsService.getAssociatedLocations(sightings);
        List<Location> locate = locationsService.getAllLocations();
        List<Organization> organizations = organizationsService.getAllOrganizations();
        System.out.println(organizations);
        List<Characters> heroes = charactersService.getAllHeroes();
        List<Characters> villians = charactersService.getAllVillains();

        model.addAttribute("heroes", heroes);
        model.addAttribute("villians", villians);
        model.addAttribute("locate", locate);
        model.addAttribute("sightings", sightings);
        model.addAttribute("characters", characters);
        model.addAttribute("organizations", organizations);
        model.addAttribute("locations", locations);
        String sightingID = request.getParameter("sightingID");
        String viewType = (request.getParameter("viewType"));
        model.addAttribute("sightingID", sightingID);
        model.addAttribute("viewType", viewType);
        return "sightings";
    }

    @RequestMapping(value = {"/newSighting"}, method = RequestMethod.GET)
    public String createSightingPage(HttpServletRequest request, Model model) {
        List<Location> locations = locationsService.getAllLocations();
        List<Characters> heroes = charactersService.getAllHeroes();
        List<Characters> villians = charactersService.getAllVillains();

        model.addAttribute("locations", locations);
        model.addAttribute("heroes", heroes);
        model.addAttribute("villians", villians);

        return "creation";
    }

    @RequestMapping(value = {"/newSighting"}, method = RequestMethod.POST)
    public String createSighting(HttpServletRequest request, Model model) throws Exception {

        String[] characters = request.getParameter("charID").split("_");
        int locationID = Integer.parseInt(request.getParameter("locationid"));
        String date = request.getParameter("sightingDate");
        date += ":00";

        String pattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        date = date.replace("/", "-");

        Date my_date = simpleDateFormat.parse(date);

        for (String characterID : characters) {
            Sighting newSighting = new Sighting();
            newSighting.setCharacterId(Integer.parseInt(characterID));
            newSighting.setLocationId(locationID);
            newSighting.setSightingDate(my_date);
            System.out.println(newSighting.getLocationId() + "  => " + newSighting.getCharacterId() + "  => " + newSighting.getSightingDate());

            sightingsService.addSighting(newSighting);

        }
        return "sightings";
    }

}
