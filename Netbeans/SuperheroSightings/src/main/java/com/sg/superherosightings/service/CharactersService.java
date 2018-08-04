/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Sighting;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface CharactersService {

    public Characters addCharacter(Characters character);

    public void deleteCharacter(int characterId);

    public void updateCharacter(Characters character);

    public Characters getCharacterById(int characterId);

    public List<Characters> getCharactersBySightingId(int sightingId);

    public List<Characters> getCharactersByOrganizationId(int organizationId);

    public List<Characters> getAllCharacters();

    public List<Characters> getAssociatedCharacters(List<Sighting> sightings);

}
