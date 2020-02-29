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
        
        let this_team = self.player.randomElement()
        let another_team = otherTeam.player.randomElement()
        print("\(this_team!.getName()) figthing with \(another_team!.getName())")
        
        if this_team!.getScore() > 25 || another_team!.getScore() > 25 {
            if this_team!.getScore() > 25{
                this_team!.weapon.first!.upgradeWeapon(this_team: this_team!)
               
                this_team!.setWeaponName(sWeaponName: "Assault")
                  print("\(this_team!.getName()) has upgraded the weapon to \(this_team!.ass.delegate!.getWeaponName())")
                  
            }else {
                       
                another_team!.weapon.first!.upgradeWeapon(this_team: another_team!)
            
                another_team!.setWeaponName(sWeaponName: "Assault")
               print("\(another_team!.getName()) has upgraded the weapon to \(another_team!.ass.delegate!.getWeaponName())")
                
        }
        }
        
        print("\(this_team!.getName()) has weapon \(this_team!.ass.delegate!.getWeaponName()) and \(another_team!.getName()) has weapon \(another_team!.ass.delegate!.getWeaponName())")
        // Second While
        while another_team!.getHealth() > 1 {
            
            if this_team!.getHealth() > 1 {
                
                another_team!.setHealth(health: another_team!.getHealth() - this_team!.ass.delegate!.fire())
                
                print("\(this_team!.getName()) Attacking \(another_team!.getName())")
                
            }
            
            print("\(another_team!.getName()) Hp is \(another_team!.getHealth())")
            
            if another_team!.getHealth() > 1 {
                this_team!.setHealth(health: this_team!.getHealth() - another_team!.ass.delegate!.fire())
                print("\(another_team!.getName()) Attacking \(this_team!.getName())")
            }
            
             print("\(this_team!.getName()) Hp is \(this_team!.getHealth())")
            
            if this_team!.getHealth() < 0 {
                break;
            }
        }// second While
        
        //If this player died
        if this_team!.getHealth() < 0 {
            print("\(this_team!.getName()) Dies !!!")
            // Health )
            this_team!.setHealth(health: 0)
            
            //updating the radius
            
            if self.getRadius() > 0 {
                self.setRadius(sRadius: self.getRadius() - 1)
            }else{
                self.setRadius(sRadius: 0)
            }
            //reducing members
            self.setMember(sMember: self.getMember() - 1)
            // setting the Kills
            another_team!.setKills(kills: another_team!.getKills() + 1)
            
            print("\(another_team!.getName()) Killed  \(another_team!.getKills()) opponent Player")
            //setting Score
            if another_team!.getKills() > 0 {
                another_team!.setScore(score: 100 * another_team!.getKills())
                
            print("\(another_team!.getName()) Score is \(another_team!.getScore())")
                
            }
            
            // Showing remaining members
            print("\(self.getTeam_Name()) remaining members are \(self.getMember())")
            
        }
        
        // If other Player Died
        
        else{
            
            print("\(another_team!.getName()) Dies !!!")
            // Health )
            another_team!.setHealth(health: 0)
            
            //updating the radius
            
            if otherTeam.getRadius() > 0 {
                otherTeam.setRadius(sRadius: otherTeam.getRadius() - 1)
            }else{
                otherTeam.setRadius(sRadius: 0)
            }
            //reducing members
            otherTeam.setMember(sMember: otherTeam.getMember() - 1)
            // setting the Kills
            this_team!.setKills(kills: this_team!.getKills() + 1)
            
            print("\(this_team!.getName()) Killed  \(this_team!.getKills()) opponent Player")
            //setting Score
            if this_team!.getKills() > 0 {
                this_team!.setScore(score: 100 * this_team!.getKills())
                
            print("\(this_team!.getName()) Score is \(this_team!.getScore())")
                
            }
            
            // Showing remaining members
            print("\(otherTeam.getTeam_Name()) remaining members are \(otherTeam.getMember())")
        }
        if self.getMember() < -1 {
            break
        }else if otherTeam.getMember() < -1 {
            break
        }else{
            continue
        }
    }//first While
        if self.getMember() == 0 {
            self.setLose(sLose: true)
            self.setWinner(sWinner: false)
            return self
        }else{
            otherTeam.setLose(sLose: true)
            otherTeam.setWinner(sWinner: false)
            return otherTeam
        }
    
}//Battle Team
 
}
   
