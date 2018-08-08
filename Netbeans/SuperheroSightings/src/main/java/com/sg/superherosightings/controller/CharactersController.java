/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.service.CharactersService;
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

@Inject
public CharactersController(CharactersService charactersService) {
		this.charactersService = charactersService;
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
        model.addAttribute("organization", request.getParameterValues("organizations"));
        charactersService.addCharacter(hero);
        return "redirect:viewHeroes";
    }

    
}
