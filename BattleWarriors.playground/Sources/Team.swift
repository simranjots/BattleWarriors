import Foundation

import UIKit

public class Team {
    
    var teama : Int = 0, teamb : Int = 0
    var color : String = "", team_name :String = ""
    var x :Int = 1000 , y : Int = 1000
    var x_axis : Int = 0 , y_axis : Int = 0
    var radius : Int , member : Int
    var lose , winner : Bool
    var player = [Player]()
    
  public init(color :  String, team_name : String, mem : Int, play : Array<Player>){
        self.color = color
        self.team_name = team_name
        self.member = mem
        self.player = play
        self.radius = 10 * mem
        self.lose = false
        self.winner = true
        
    }
    
    
    public func getMember() -> Int{
        
        return member
    }
    
    public func setMember(sMember : Int) ->Void{
        
        self.member = sMember
    }
    
   public func getColor() -> String {
        return color
    }
    
   public func setColor(scolor : String) -> Void {
        self.color = scolor
    }
    
   public func getTeam_Name() -> String {
        return team_name
    }
    
   public func setTeam_Name(sTeam_name : String) -> Void {
        self.team_name = sTeam_name
    }
    
   public func isLose() -> Bool {
        return lose
    }
    
   public func setLose(sLose : Bool) -> Void {
        self.lose = sLose
    }
    
   public func isWinner() -> Bool {
        return winner
    }
    
   public func setWinner(sWinner : Bool) -> Void {
        self.winner = sWinner
    }
    
   public func getRadius() -> Int {
        return radius
    }
    
   public func setRadius(sRadius  : Int) -> Void {
        self.radius = sRadius
    }
    
   public func getX_axis() -> Int {
        return x_axis
    }
  public func setX_axis(sX_axis : Int) ->  Void{
        self.x_axis = sX_axis
    }
    
   public func getY_axis() -> Int {
        return y_axis
    }
   public func setY_axis(sY_axis : Int) ->  Void{
        self.y_axis = sY_axis
    }
   public func location_x_axis() -> Int {
        let n = Int.random(in: 1 ... x)
        return n
    }
   public func location_y_axis() -> Int {
        let n = Int.random(in: 1 ... y)
        return n
    }
    
   public func moveTeam() -> Void {
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
    
   public func battleTeam(otherTeam : Team) -> Team {
        
        print("\(self.getTeam_Name()) started attackig \(otherTeam.getTeam_Name())")
        print("\(self.getTeam_Name()) has \(self.getMember()) members and \(otherTeam.getTeam_Name()) has \(otherTeam.getMember()) members")
       
    while self.player.count > 0 && otherTeam.player.count > 0 {
            print("Inside")
  print("Start 1")
        print(self.player.count)
        print(otherTeam.player.count)
        let randomindex = Int.random(in : 0..<self.player.count)
        let otherrandomIndex = Int.random(in : 0..<otherTeam.player.count)
        print(randomindex)
        print(otherrandomIndex)
        print(self.player.count)
        print(otherTeam.player.count)
        let this_team = self.player[randomindex]
        let another_team = otherTeam.player[otherrandomIndex]
        
        print("\(this_team.getName()) figthing with \(another_team.getName())")
        
        print("\(this_team.getName()) has weapon \(this_team.ass.delegate!.getWeaponName()) and \(another_team.getName()) has weapon \(another_team.ass.delegate!.getWeaponName())")
        // Second While
        while another_team.getHealth() > 1 {
            
            if this_team.getHealth() > 1 {
            
                print("assault fire \(this_team.ass.delegate!.fire())")
                another_team.setHealth(health: another_team.getHealth() - this_team.ass.delegate!.fire())
                
                print("\(this_team.getName()) Attacking \(another_team.getName())")
                
            }
            
            print("\(another_team.getName()) Hp is \(another_team.getHealth())")
            
            if another_team.getHealth() > 1 {
                this_team.setHealth(health: this_team.getHealth() - another_team.ass.delegate!.fire())
                print("\(another_team.getName()) Attacking \(this_team.getName())")
            }
            
             print("\(this_team.getName()) Hp is \(this_team.getHealth())")
            
            if this_team.getHealth() < 0 {
                break;
            }
        }// second While
        
        //If this player died
        if this_team.getHealth() < 0 {
            print("\(this_team.getName()) Dies !!!")
            // Health )
            this_team.setHealth(health: 0)
            
            //updating the radius
            
            if self.getRadius() > 0 {
                self.setRadius(sRadius: self.getRadius() - 1)
            }else{
                self.setRadius(sRadius: 0)
            }
            //reducing members
            self.setMember(sMember: self.getMember() - 1)
            for p1 in 0...self.player.count
            {
                let dyingP1 = self.player[p1]
                if(dyingP1.name == this_team.name)
                {
                    self.player.remove(at: p1)
                    break
                }
                
            }
            
            // setting the Kills
            another_team.setKills(kills: another_team.getKills() + 1)
            
            print("\(another_team.getName()) Killed  \(another_team.getKills()) opponent Player")
            //setting Score
            if another_team.getKills() > 0 {
                another_team.setScore(score: 100 * another_team.getKills())
                
            print("\(another_team.getName()) Score is \(another_team.getScore())")
                
            }
            
            // Showing remaining members
            print("\(self.getTeam_Name()) remaining members are \(self.player.count)")
            
            
        }
        
        // If other Player Died
        
        else
        {
            print("\(another_team.getName()) Dies !!!")
            // Health )
            another_team.setHealth(health: 0)
            
            //updating the radius
            
            if otherTeam.getRadius() > 0 {
                otherTeam.setRadius(sRadius: otherTeam.getRadius() - 1)
            }else{
                otherTeam.setRadius(sRadius: 0)
            }
            //reducing members
            otherTeam.setMember(sMember: otherTeam.getMember() - 1)
            for p2 in 0...otherTeam.player.count
            {
                let dyingP2 = otherTeam.player[p2]
                if(dyingP2.name == another_team.name)
                {
                    otherTeam.player.remove(at: p2)
                    break
                }
                
            }
            // setting the Kills
            this_team.setKills(kills: this_team.getKills() + 1)
            
            print("\(this_team.getName()) Killed  \(this_team.getKills()) opponent Player")
            //setting Score
            if this_team.getKills() > 0 {
                this_team.setScore(score: 100 * this_team.getKills())
                
            print("\(this_team.getName()) Score is \(this_team.getScore())")
                
            }
            
            // Showing remaining members
            print("\(otherTeam.getTeam_Name()) remaining members are \(otherTeam.player.count)")
        }
        print("outside if")
        if self.player.count <= 0 {
            print("team a break")
            break
        }else if otherTeam.player.count <= 0 {
            print("team b break")
            break
        }else{
            continue
        }
    }//first While
    print("outside while")
    if self.player.count == 0 {
            self.setLose(sLose: true)
            self.setWinner(sWinner: false)
        print("returning a")
            return self
        }else{
            otherTeam.setLose(sLose: true)
            otherTeam.setWinner(sWinner: false)
        print("returning b")
            return otherTeam
        }
    
}//Battle Team
 
}
   
