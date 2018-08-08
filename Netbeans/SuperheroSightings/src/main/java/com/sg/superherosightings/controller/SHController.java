/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dao.SuperheroSightingsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Location;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.service.CharactersService;
import com.sg.superherosightings.service.LocationsService;
import com.sg.superherosightings.service.SightingsService;
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

    CharactersService charactersService;
    SightingsService sightingsService;
    LocationsService locationsService;
    
    /*
    
    Pick up here. Move the request mappings to the appropriate
    classes
    */

    @Inject
    public SHController(CharactersService charactersService, SightingsService sightingsService, LocationsService locationsService) {
        this.charactersService = charactersService;
        this.sightingsService = sightingsService;
        this.locationsService = locationsService;
    }

    @RequestMapping(value = {"/", "index", ""}, method = RequestMethod.GET)
    public String loadWindow(HttpServletRequest request, Model model) {
        List<Sighting> sightings = sightingsService.getAllSightings();
        System.out.println(sightings);
        List<Characters> characters = charactersService.getAssociatedCharacters(sightings);
        List<Location> locations = locationsService.getAssociatedLocations(sightings);
        model.addAttribute("sightings", sightings);
        model.addAttribute("locations", locations);
        model.addAttribute("characters", characters);
        return "index";
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
