/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.CharactersDao;
import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Power;
import com.sg.superherosightings.dto.Sighting;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author laptop
 */
public class CharactersServiceImpl implements CharactersService{
    
    CharactersDao charactersDao;

    public CharactersServiceImpl(CharactersDao charactersDao) {
        this.charactersDao = charactersDao;
    }
    
    

    @Override
    public Characters addCharacter(Characters character) {
        return charactersDao.addCharacter(character);
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
        return charactersDao.getCharacterById(characterId);
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
        return charactersDao.getAllHeroes();
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
