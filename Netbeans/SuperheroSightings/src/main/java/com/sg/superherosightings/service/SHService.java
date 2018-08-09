/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.SuperheroSightingsDao;
import javax.inject.Inject;

/**
 *
 * @author Travz
 */
public class SHService {
    
    SuperheroSightingsDao dao;
    
//    @Inject
    public SHService(SuperheroSightingsDao dao) {
        this.dao = dao;
    }
    
    

}
