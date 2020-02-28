import Foundation

import UIKit

class Team {
    
    var teama : Int = 0, teamb : Int = 0
    var color : String = "", team_name :String = ""
    var x :Int = 1000 , y : Int = 1000
    var x_axis : Int = 0 , y_axis : Int = 0
    var radius : Int , member : Int
    var lose , winner : Bool
    var player = [Player]()
    
    init(color :  String, team_name : String, mem : Int, play : Player){
        self.color = color
        self.team_name = team_name
        self.member = mem
        player.append(play)
        self.radius = 10 * mem
        self.lose = false
        self.winner = true
        
        
    }
    
    
    func getMember() -> Int{
        
        return member
    }
    
    func setMember(sMember : Int) ->Void{
        
        self.member = sMember
    }
    
    func getColor() -> String {
        return color
    }
    
    func setColor(scolor : String) -> Void {
        self.color = scolor
    }
    
    func getTeam_Name() -> String {
        return team_name
    }
    
    func setTeam_Name(sTeam_name : String) -> Void {
        self.team_name = sTeam_name
    }
    
    func isLose() -> Bool {
        return lose
    }
    
    func setLose(sLose : Bool) -> Void {
        self.lose = sLose
    }
    
    func isWinner() -> Bool {
        return winner
    }
    
    func setWinner(sWinner : Bool) -> Void {
        self.winner = sWinner
    }
    
    func getRadius() -> Int {
        return radius
    }
    
    func setRadius(sRadius  : Int) -> Void {
        self.radius = sRadius
    }
    
    func getX_axis() -> Int {
        return x_axis
    }
    func setX_axis(sX_axis : Int) ->  Void{
        self.x_axis = sX_axis
    }
    
    func getY_axis() -> Int {
        return y_axis
    }
    func setY_axis(sY_axis : Int) ->  Void{
        self.y_axis = sY_axis
    }
    func location_x_axis() -> Int {
        let n = Int.random(in: 1 ... x)
        return n
    }
    func location_y_axis() -> Int {
        let n = Int.random(in: 1 ... y)
        return n
    }
    
    func moveTeam() -> Void {
        if self.getX_axis() > 20  {
            self.setX_axis(sX_axis: self.getX_axis() - Int.random(in: 1 ... 50))
        } else {
            setX_axis(sX_axis: 0)
        }
        
        if self.getY_axis() > 20  {
            self.setY_axis(sY_axis: self.getX_axis() - Int.random(in: 1 ... 50))
        } else {
            setY_axis(sY_axis: 0)
        }
    }
    
    func battleTeam(otherTeam : Team) -> Team {
        
        print("\(self.getTeam_Name()) started attackig \(otherTeam.getTeam_Name())")
        print("\(self.getTeam_Name()) has \(self.getMember()) members and\(otherTeam.getTeam_Name()) has \(otherTeam.getMember()) members")
        while self.getMember() > -1 && otherTeam.getMember() > -1 {
            if self.getMember() > 0 {
                teama = self.getMember() - 1;
            }else{
                break
            }
            if otherTeam.getMember() > 0 {
                teama = otherTeam.getMember() - 1;
            }else{
                break
            }
        }
        let this_team = self.player.randomElement()
        let another_team = otherTeam.player.randomElement()
        print("\(this_team!.getName()) figthing with \(another_team!.getName())")
        
        if this_team!.getScore() > 25 || another_team!.getScore() > 25 {
            if this_team!.getScore() > 25{
                this_team!.Weapon.first!.upgradeWeapon(this_team: this_team!)
               
                let tempobj = this_team!.Weapon[this_team!.getSelected_weapon()]
                let someCharacter: Int = this_team!.getSelected_weapon()
                
                switch someCharacter {
                case 1 :
                         let Assualtobj = tempobj as? Assault
                         
                    print("\(this_team!.getName()) has upgraded the weapon to \(Assualtobj!.getWeaponName())")
                    break
                case 2 :
                    let Smgobj = tempobj as? Smg
                  print("\(this_team!.getName()) has upgraded the weapon to \(Smgobj!.getWeaponName())")
                    break
                case 3 :
                   let Shotgunobj = tempobj as? Shotgun
                    print("\(this_team!.getName()) has upgraded the weapon to \(Shotgunobj!.getWeaponName())")
                    break
                case 4 :
                    let Lmgobj = tempobj as? Lmg
                    print("\(this_team!.getName()) has upgraded the weapon to \(Lmgobj!.getWeaponName())")
                    break
                case 5 :
                    let Sniperobj = tempobj as? Sniper
                    print("\(this_team!.getName()) has upgraded the weapon to \(Sniperobj!.getWeaponName())")
                    break
                default :
                    print("No more weapon")
                }
              
                
                
            }else {
                another_team!.Weapon.first!.upgradeWeapon(this_team: another_team!)
                
                let tempobj2 = another_team!.Weapon[another_team!.getSelected_weapon()]
                let someCharacter2: Int = another_team!.getSelected_weapon()
                
                
                switch someCharacter2 {
                case 1 :
                    let Assualtobj2 = tempobj2 as? Assault
                    
                    print("\(another_team!.getName()) has upgraded the weapon to \(Assualtobj2!.getWeaponName())")
                    break
                case 2 :
                    let Smgobj2 = tempobj2 as? Smg
                    print("\(another_team!.getName()) has upgraded the weapon to \(Smgobj2!.getWeaponName())")
                    break
                case 3 :
                    let Shotgunobj2 = tempobj2 as? Shotgun
                    print("\(another_team!.getName()) has upgraded the weapon to \(Shotgunobj2!.getWeaponName())")
                    break
                case 4 :
                    let Lmgobj2 = tempobj2 as? Lmg
                    print("\(another_team!.getName()) has upgraded the weapon to \(Lmgobj2!.getWeaponName())")
                    break
                case 5 :
                    let Sniperobj2 = tempobj2 as? Sniper
                    print("\(another_team!.getName()) has upgraded the weapon to \(Sniperobj2!.getWeaponName())")
                    break
                default :
                    print("No more weapon")

                
                
            }
          }
        }
        
        return otherTeam
    }
    
