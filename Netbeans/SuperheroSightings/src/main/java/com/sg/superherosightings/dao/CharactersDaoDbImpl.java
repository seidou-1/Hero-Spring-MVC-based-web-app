/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Characters;
import com.sg.superherosightings.dto.Power;
import com.sg.superherosightings.dto.Sighting;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */
public class CharactersDaoDbImpl implements CharactersDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_INSERT_CHARACTER
            = "insert into Characters (CharacterName, Description, IsSuperHero )" + " values (?, ?, ?)";

    private static final String SQL_DELETE_CHARACTER
            = "delete from Characters where CharacterID = ?";

    private static final String SQL_UPDATE_CHARACTER
            = "update Characters set CharacterName = ?, Description = ?, IsSuperHero = ? " + "where CharacterID = ?";

    private static final String SQL_SELECT_CHARACTER
            = "select * from Characters where CharacterId = ?";

    private static final String SQL_SELECT_CHARACTERS_BY_ORGANIZATION
            = ""; // revisit after checking out join statements;

    private static final String SQL_SELECT_ALL_CHARACTERS
            = "select * from Characters";

    //Isolate characters
    private static final String SQL_SELECT_ALL_HEROES
            = "select * from `Characters` where isSuperHero = 1";

    private static final String SQL_SELECT_ALL_VILLAINS_JOIN_BY_SIGHTINGDATE
            = "Select `CharacterName`, `SightingDate`, Characters.CharacterID from `Sighting`\n"
            + "\n"
            + "join  Characters\n"
            + "\n"
            + "On Characters.CharacterID = Sighting.CharacterID\n"
            + "\n"
            + "WHERE Characters.CharacterID = '?' and Characters.IsSuperHero='0'\n"
            + "\n"
            + "ORDER BY `SightingDate` DESC\n"
            + "\n"
            + "Limit 1;";

    private static final String SQL_SELECT_ALL_POWERS
            = "select * from `SuperPower`";

    private static final String SQL_SELECT_SUPERPOWERS_BY_CHARACTERID
            = "select sp.SuperpowerId , sp.SuperPowerType from Superpower sp"
            + " Join Character_SuperPower cs on sp.SuperpowerID  = cS.SuperpowerId where CharacterId = ?";

    private static final String SQL_SELECT_HEROES_JOIN_BY_SIGHTINGDATE
            = "Select `CharacterName`, `SightingDate`, Characters.CharacterID from `Sighting`\n"
            + "\n"
            + "join  Characters\n"
            + "\n"
            + "On Characters.CharacterID = Sighting.CharacterID\n"
            + "\n"
            + "WHERE Characters.CharacterID = '?' and Characters.IsSuperHero='1'\n"
            + "\n"
            + "ORDER BY `SightingDate` DESC\n"
            + "\n"
            + "Limit 1;";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Characters addCharacter(Characters character) {
        jdbcTemplate.update(SQL_INSERT_CHARACTER,
                character.getName(),
                character.getDescription(),
                character.getIsSuperHero());

        /*
        The above creates the character
        
        The below queries the db for the id that was just assigned
        to the new row
         */
        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        //This sets the new id value on the Characters object and returns it
        character.setCharacterId(newId);
        return character;
    }

    @Override
    public void deleteCharacter(int characterId) {
        jdbcTemplate.update(SQL_DELETE_CHARACTER, characterId);
    }

    @Override
    public void updateCharacter(Characters character) {
        jdbcTemplate.update(SQL_UPDATE_CHARACTER,
                character.getName(),
                character.getDescription(),
                character.getIsSuperHero(),
                character.getCharacterId());
    }

    @Override
    public Characters getCharacterById(int characterId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_CHARACTER,
                    new CharactersDaoDbImpl.CharactersMapper(), characterId);
        } catch (EmptyResultDataAccessException ex) {
            // there were no results for the given contact id - we just 
            // want to return null in this case
            return null;
        }
    }

    @Override
    public List<Characters> getCharactersBySightingId(int sightingId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Characters> getCharactersByOrganizationId(int organizationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Characters> getAllCharacters() {
        return jdbcTemplate.query(SQL_SELECT_ALL_CHARACTERS,
                new CharactersDaoDbImpl.CharactersMapper());
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
        return jdbcTemplate.query(SQL_SELECT_ALL_VILLAINS_JOIN_BY_SIGHTINGDATE,
                new CharactersMapper());
    }

    @Override
    public List<Characters> getAllHeroes() {
        return jdbcTemplate.query(SQL_SELECT_HEROES_JOIN_BY_SIGHTINGDATE,
                new CharactersMapper());
    }

    @Override
    public List<Power> getSuperPowersByCharacter(Characters tempChar) {
        List<Power> helperSuperPowerList = jdbcTemplate.query(SQL_SELECT_SUPERPOWERS_BY_CHARACTERID,
                new CharactersDaoDbImpl.SuperPowerMapper(), tempChar.getCharacterId());
        return helperSuperPowerList;
    }

    @Override
    public void setCharactersSPList(List<Characters> temp) {

        for (Characters charact : temp) {
            charact.setSuperPowerList(getSuperPowersByCharacter(charact));

        }
    }

    @Override
    public List<Power> getAllPowers() {

        return jdbcTemplate.query(SQL_SELECT_ALL_POWERS,
                new SuperPowerMapper());

    }

    private static final class CharactersMapper implements RowMapper<Characters> {

        public Characters mapRow(ResultSet rs, int rowNum) throws SQLException {
            Characters charact = new Characters();
            charact.setCharacterId(rs.getInt("CharacterID"));
            charact.setName(rs.getString("CharacterName"));
            charact.setDescription(rs.getString("Description"));
            charact.setIsSuperHero(rs.getBoolean("IsSuperHero"));
            charact.setMostRecentSightingDate(rs.getDate("SightingDate"));

            return charact;

        }
    }

    

    private static final class SuperPowerMapper implements RowMapper<Power> {

        public Power mapRow(ResultSet rs, int rowNum) throws SQLException {
            Power newPower = new Power();
            newPower.setPowerType(rs.getString("SuperPowerType"));
            newPower.setPowerId(Integer.parseInt(rs.getString("SuperpowerID")));

            return newPower;
        }
    }

}
