/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dto;

import java.util.Objects;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author laptop
 */
public class Characters {
    int characterId;
    @NotEmpty(message = "Vio-Lation. You need to enter values for this.")

    String name;
    @NotEmpty(message = "Damn Daniel you forgot the Name?")
    @Length(max = 50, message = "First Name must be no more than 50 characters in length.")

    String description;
    @NotEmpty(message = "You must supply a value for Description.")
    @Length(max = 100, message = "First Name must be no more than 50 characters in length.")

    boolean isSuperHero;
    @NotEmpty(message = "Man is this a superhero or not?")
    
    public Characters(){
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Mo - There was a type here. Fixed it from "isIsSuperHero" to "getSuperHero"
    public boolean getIsSuperHero() {
        return isSuperHero;
    }

    public void setIsSuperHero(boolean isSuperHero) {
        this.isSuperHero = isSuperHero;
    }

    public int getCharacterId() {
        return characterId;
    }

    public void setCharacterId(int characterId) {
        this.characterId = characterId;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + this.characterId;
        hash = 97 * hash + Objects.hashCode(this.name);
        hash = 97 * hash + Objects.hashCode(this.description);
        hash = 97 * hash + (this.isSuperHero ? 1 : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Characters other = (Characters) obj;
        if (this.characterId != other.characterId) {
            return false;
        }
        if (this.isSuperHero != other.isSuperHero) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.description, other.description)) {
            return false;
        }
        return true;
    }
    
    

    
    
}
