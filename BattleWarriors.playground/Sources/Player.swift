 
 public class Player{

     var health :Int
     var name :String
     var selected_weapon :Int
     var score :Int
     var kills :Int
     var weaponname :String = ""
     var jAss: Assault =  Assault(bullet: 20)
     var ass : WeaponCalling
              
     var weapon = [WeaponClass]()
    
       init(health :Int, name :String, rank :Int, selected_weapon :Int)
          {
               self.health = health
               self.name = name
               self.score = 0
               self.kills = 0
               self.selected_weapon = selected_weapon
               self.ass = WeaponCalling(Del: jAss)
         }
    
          
   
            public func getWeaponName() -> String
                  {
                   
                      return weaponname
                  }

             public func setWeaponName(sWeaponName :String)
                 {
                        self.weaponname = sWeaponName
                 }
         public func getScore() -> Int
               {
                
                   return score
               }

          public func setScore(score :Int)
              {
                     self.score = score
              }

            public func getKills() -> Int
               {
                   return kills
               }
            public func setKills(kills :Int)
              {
                     self.kills = kills
              }
            public func getHealth() -> Int
               {
                   return health
               }
            public func setHealth(health :Int)
              {
                     self.health = health
              }
           public func getName() -> String
               {
                   return name
               }
            public func setName(name :String)
              {
                     self.name = name
              }
    
   public func getSelected_weapon() -> Int {
        if selected_weapon > 4 {
            
        }
        return selected_weapon
    }
    
   public func setSelected(Nselected_weapon : Int) -> Void {
        self.selected_weapon = Nselected_weapon
    }
    

}
