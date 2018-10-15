/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Power;
import com.sg.superherosightings.service.CharactersService;
import com.sg.superherosightings.service.OrganizationsService;
import java.util.List;
import javax.inject.Inject;
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
public class CharactersController {

    CharactersService charactersService;
    OrganizationsService organizationsService;

    @Inject
    public CharactersController(CharactersService charactersService, OrganizationsService organizationsService) {
        this.charactersService = charactersService;
        this.organizationsService = organizationsService;
    }

    @RequestMapping(value = "/createHero", method = RequestMethod.POST)
    public String createHero(HttpServletRequest request, Model model) {
        Characters hero = new Characters();
        hero.setName(request.getParameter("heroName"));
        hero.setDescription(request.getParameter("description"));
        hero.setIsSuperHero(true);
        hero.setPhoto(request.getParameter("userImage"));

        for (String e : request.getParameterValues("organizations")) {
            hero.addOrganization(e);
        }

        for (String e : request.getParameterValues("superPowers")) {
            hero.addPower(e);
        }

        model.addAttribute("organization", request.getParameterValues("organizations"));
        charactersService.addCharacter(hero);
        return "redirect:viewHeroes";
    }

    

    
    @RequestMapping(value = "/editHero", method = RequestMethod.POST)
    public String editHero(HttpServletRequest request, Model model) {
        Characters hero = new Characters();
        hero.setName(request.getParameter("heroName"));
        hero.setDescription(request.getParameter("description"));
        hero.setIsSuperHero(true);
        hero.setPhoto(request.getParameter("userImage"));

        for (String e : request.getParameterValues("organizations")) {
            hero.addOrganization(e);
        }

        for (String e : request.getParameterValues("superPowers")) {
            hero.addPower(e);
            System.out.print(e + " => ");
        }

        charactersService.updateCharacter(hero);
        return "redirect:viewHeroes";
    }

    @RequestMapping(value = "/deleteHero", method = RequestMethod.GET)
    public String deletHero(HttpServletRequest request, Model model) {
        int heroID = Integer.parseInt(request.getParameter("characterId"));
        charactersService.deleteCharacter(heroID);
        return "redirect:viewHeroes";
    }

    @RequestMapping(value = {"/viewHeroes"}, method = RequestMethod.GET)
    public String loadHeroes(HttpServletRequest request, Model model) {
        List<Characters> allHeroes = charactersService.getAllHeroes();
        organizationsService.setCharactersOrgList(allHeroes);

        model.addAttribute("heroes", allHeroes);

        List<Organization> allOrganizations = organizationsService.getAllOrganizations();
        model.addAttribute("organizations", allOrganizations);

        List<Power> allPowers = charactersService.getAllPowers();
        model.addAttribute("powers", allPowers);

        String display = (request.getParameter("viewType"));
        model.addAttribute("display", display);

        try {
            int id = Integer.parseInt(request.getParameter("characterId"));
            Characters hero = charactersService.getCharacterById(id);
            model.addAttribute("hero", hero);

        } catch (Exception e) {

        }

        return "heroes";
    }

    @RequestMapping(value = {"/viewVillains"}, method = RequestMethod.GET)
    public String loadVillains(HttpServletRequest request, Model model) {
        List<Characters> allVillains = charactersService.getAllVillains();
        organizationsService.setCharactersOrgList(allVillains);

        model.addAttribute("villains", allVillains);

        List<Organization> allOrganizations = organizationsService.getAllOrganizations();
        model.addAttribute("organizations", allOrganizations);

        List<Power> allPowers = charactersService.getAllPowers();
        model.addAttribute("powers", allPowers);

        String display = (request.getParameter("viewType"));
        model.addAttribute("display", display);

        try {
            int id = Integer.parseInt(request.getParameter("characterId"));
            Characters villain = charactersService.getCharacterById(id);
            model.addAttribute("villain", villain);
        } catch (Exception e) {

        }

        return "villains";
    }

}
