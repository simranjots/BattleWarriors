 
 class Player{

     var health :Int
     var name :String
     var selected_weapon :Int
     var score :Int
     var kills :Int
     var Weapon = [WeaponClass]()

       init(health :Int, name :String, rank :Int, selected_weapon :Int)
          {
               self.health = health
               self.name = name
               self.score = 0
               self.kills = 0
               self.selected_weapon = selected_weapon
            Weapon.append(Assault(bullet :20))
            Weapon.append(Shotgun(bullet :30))
            Weapon.append(Smg(bullet :10))
            Weapon.append(Lmg(bullet :10))
            Weapon.append(Sniper(bullet :20))

         }

           func getScore() -> Int
               {
                   return score
               }

           func setScore(score :Int)
              {
                     self.score = score
              }

             func getKills() -> Int
               {
                   return kills
               }
             func setKills(kills :Int)
              {
                     self.kills = kills
              }
              func getHealth() -> Int
               {
                   return health
               }
             func setHealth(health :Int)
              {
                     self.health = health
              }
             func getName() -> String
               {
                   return name
               }
             func setName(name :String)
              {
                     self.name = name
              }
       
    

}
