Use `SuperheroSightings`;

select sp.SuperpowerId , sp.SuperPowerType from Superpower sp
           Join Character_SuperPower cs on sp.SuperpowerID  = cS.SuperpowerId where CharacterId = '3';