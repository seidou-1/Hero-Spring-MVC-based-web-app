/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.controller;

import com.sg.superherosightings.service.SHService;
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

    @Inject
    public SHController(SHService service) {
        this.service = service;
    }

    @RequestMapping(value = {"/", "index", ""}, method = RequestMethod.GET)
    public String loadWindow(HttpServletRequest request, Model model) {
        return "index";
    }

    @RequestMapping(value = {"/viewSightings"}, method = RequestMethod.GET)
    public String loadstars(HttpServletRequest request, Model model) {
        return "sightings";
    }

    @RequestMapping(value = {"/viewHeroes"}, method = RequestMethod.GET)
    public String loadHeroes(HttpServletRequest request, Model model) {
        return "heroes";
    }

    @RequestMapping(value = {"/viewVillains"}, method = RequestMethod.GET)
    public String loadVillains(HttpServletRequest request, Model model) {
        return "villains";
    }

    @RequestMapping(value = {"/viewOrganizations"}, method = RequestMethod.GET)
    public String loadOrganizations(HttpServletRequest request, Model model) {
        return "organizations";
    }

    @RequestMapping(value = {"/viewLocations"}, method = RequestMethod.GET)
    public String loadLocations(HttpServletRequest request, Model model) {
        return "locations";
    }

    @RequestMapping(value = {"/newSighting"}, method = RequestMethod.GET)
    public String createSighting(HttpServletRequest request, Model model) {
        return "creation";
    }

}
