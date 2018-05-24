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
    @Inject
    public SHController(SuperheroSightingsDao dao) {
        this.dao = dao;
    }
    @RequestMapping(value = {"/", "index", ""}, method = RequestMethod.GET)
    public String loadWindow(HttpServletRequest request, Model model) {
        List<Sighting> sightings = dao.getAllSightings();
        List<Characters> characters = dao.getAssociatedCharacters(sightings);
        List<Location> locations = dao.getAssociatedLocations(sightings);
        model.addAttribute("sightings", sightings);
        model.addAttribute("locations", locations);
        model.addAttribute("characters", characters);
        return "index";
    }
    @RequestMapping(value = {"/viewSightings"}, method = RequestMethod.GET)
    public String loadsightings(HttpServletRequest request, Model model) {
        List<Sighting> sightings = dao.getAllSightings();
        List<Characters> characters = dao.getAssociatedCharacters(sightings);
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
    @RequestMapping(value = "/createHero", method = RequestMethod.POST)
    public String createHero(HttpServletRequest request, Model model) {
        Characters hero = new Characters();
        hero.setName(request.getParameter("heroName"));
        hero.setDescription(request.getParameter("description"));
        hero.setIsSuperHero(true);
        for (String e : request.getParameterValues("organizations")) {
            hero.addOrganization(e);
        }
        System.out.println(hero);
        model.addAttribute("organization", request.getParameterValues("organizations"));
        dao.addCharacter(hero);
        return "redirect:viewHeroes";
    }
    @RequestMapping(value = {"/viewHeroes"}, method = RequestMethod.GET)
    public String loadHeroes(HttpServletRequest request, Model model) {
        List<Characters> allHeroes = dao.getAllHeroes();
        dao.setCharactersOrgList(allHeroes);
        model.addAttribute("heroes", allHeroes);
        return "heroes"; 
    }
    @RequestMapping(value = {"/viewVillains"}, method = RequestMethod.GET)
    public String loadVillains(HttpServletRequest request, Model model) {
        List<Characters> allVillains = dao.getAllVillains();
        dao.setCharactersOrgList(allVillains);
        model.addAttribute("villains", allVillains);
        return "villains";
    }
    @RequestMapping(value = {"/viewOrganizations"}, method = RequestMethod.GET)
    public String loadOrganizations(HttpServletRequest request, Model model) {
        List<Organization> allOrganizations = dao.getAllOrganizations();
        
        model.addAttribute("organizations", allOrganizations);
        return "organizations";
    }
    @RequestMapping(value = {"/viewLocations"}, method = RequestMethod.GET)
    public String loadLocations(HttpServletRequest request, Model model) {
        List<Location> allLocations = dao.getAllLocations();
        
        model.addAttribute("locations", allLocations);
        return "locations";
    }
    @RequestMapping(value = {"/newSighting"}, method = RequestMethod.GET)
    public String createSighting(HttpServletRequest request, Model model) {
        
        return "creation";
    }
    
}