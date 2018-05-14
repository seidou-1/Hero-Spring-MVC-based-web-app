/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.util.Objects;

/**
 *
 * @author laptop
 */
public class Character {
    
    String name;
    String Descriptin;
    boolean isSuperHero;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescriptin() {
        return Descriptin;
    }

    public void setDescriptin(String Descriptin) {
        this.Descriptin = Descriptin;
    }

    public boolean isIsSuperHero() {
        return isSuperHero;
    }

    public void setIsSuperHero(boolean isSuperHero) {
        this.isSuperHero = isSuperHero;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.name);
        hash = 37 * hash + Objects.hashCode(this.Descriptin);
        hash = 37 * hash + (this.isSuperHero ? 1 : 0);
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
        final Character other = (Character) obj;
        if (this.isSuperHero != other.isSuperHero) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.Descriptin, other.Descriptin)) {
            return false;
        }
        return true;
    }
    
}
