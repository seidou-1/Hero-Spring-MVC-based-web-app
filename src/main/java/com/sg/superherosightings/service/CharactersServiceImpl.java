/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.CharactersDao;
import com.sg.superherosightings.dao.OrganizationsDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Power;
import com.sg.superherosightings.dto.Sighting;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author laptop
 */
public class CharactersServiceImpl implements CharactersService {

    CharactersDao charactersDao;
    OrganizationsDao organizationsDao;

    public CharactersServiceImpl(CharactersDao charactersDao, OrganizationsDao organizationsDao) {
        this.charactersDao = charactersDao;
        this.organizationsDao = organizationsDao;

    }

    @Override
    public Characters addCharacter(Characters character) {
        Characters myChar =  charactersDao.addCharacter(character);
        
        for (int org: myChar.getOrganizationIDs()) {
            charactersDao.addCharacterOrg(myChar.getCharacterId(), org);
        }
        
        for (int pow: myChar.getSuperpowerIDs()) {
            charactersDao.addCharacterPower(myChar.getCharacterId(), pow);
        }
        
        return myChar;
    }

    @Override
    public void deleteCharacter(int characterId) {
        charactersDao.deleteCharacter(characterId);
    }

    @Override
    public void updateCharacter(Characters character) {
        charactersDao.updateCharacter(character);
    }

    @Override
    public Characters getCharacterById(int characterId) {
        Characters myCharacter = charactersDao.getCharacterById(characterId);
        myCharacter.setOrganizationList(organizationsDao.getOrganizationsByCharacter(myCharacter)); 
        return myCharacter;
    }

    @Override
    public List<Characters> getCharactersBySightingId(int sightingId) {
        return charactersDao.getCharactersBySightingId(sightingId);
    }

    @Override
    public List<Characters> getCharactersByOrganizationId(int organizationId) {
        return charactersDao.getCharactersByOrganizationId(organizationId);
    }

    @Override
    public List<Characters> getAllCharacters() {
        return charactersDao.getAllCharacters();
    }

    @Override
    public List<Characters> getAssociatedCharacters(List<Sighting> temp) {
        List<Characters> helperCharacterList = new ArrayList<Characters>();

        for (Sighting sight : temp) {
            Characters charact = getCharacterById(sight.getCharacterId());
            helperCharacterList.add(charact);
            sight.setCharacter(charact);
        }
        return helperCharacterList;
    }

    @Override
    public List<Characters> getAllVillains() {
        return charactersDao.getAllVillains();
    }

    @Override
    public List<Characters> getAllHeroes() {
        List<Characters> myHeroes = charactersDao.getAllHeroes();

        return myHeroes;
    }

    @Override
    public List<Power> getSuperPowersByCharacter(Characters tempChar) {
        return charactersDao.getSuperPowersByCharacter(tempChar);
    }

    @Override
    public void setCharactersSPList(List<Characters> temp) {
        charactersDao.setCharactersSPList(temp);
    }

    @Override
    public List<Power> getAllPowers() {
        return charactersDao.getAllPowers();
    }

}
