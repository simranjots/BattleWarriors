import Foundation

import UIKit


public class Main {
    
    
    init(){
        
    }

    //Other class Object
    var teams = [Team]()

    
    var member : Int = Int.random(in: 5...20)

    

    let max_team_members : Int = 20;



    public func createTeam() -> Void {

        let a = "A", b = "B", c = "C", d = "D",e = "E"

        
        teams.append(Team (color :  "Black" , team_name : "Team A", mem : member, play : self.createPlayer(p: a)))
        teams.append(Team (color :  "Blue", team_name : "Team B", mem : member, play : self.createPlayer(p: b)))
        teams.append(Team (color :  "Red", team_name : "Team C", mem : member, play : self.createPlayer(p: c)))
        teams.append(Team (color :  "Grey", team_name : "Team D", mem : member, play : self.createPlayer(p: d)))
        teams.append(Team (color :  "Green", team_name : "Team E", mem : member, play : self.createPlayer(p: e)))

    }

    

    public func createPlayer (p : String) -> Array<Player> {

    member = Int.random(in: 5...20)

        var players = [Player]()

        for i in 0..<member {
            
        let stringIndex = String(i)
            
        players.append(Player(health: 100, name: "Player " + stringIndex + p, rank: 1,selected_weapon: 0))
        
        }
     
        return players

    }


   public func teamNearby() -> Void {
        
        while teams.count > 1 {
            var l = 0
            while l < teams.count{
                 var m = 1
                while m < teams.count{
                    let x1 : Double = teams[l].getX_axis()
                    let y1 : Double = teams[l].getY_axis()
                    let x2 : Double = teams[m].getX_axis()
                    let y2 : Double = teams[m].getY_axis()
            
                    let distance = sqrt((x2 - x1) * (x2 -  x1) + (y2 - y1) * (y2 - y1))
                    if distance <= (teams[l].getRadius() + teams[m].getRadius()) && l != m
                    {
                        
                        print("\(teams[l].getTeam_Name()) is nearby to \(teams[m].getTeam_Name())")
                        let Loser = teams[l].battleTeam(otherTeam : teams[m])
                        if Loser.getTeam_Name() == teams[l].getTeam_Name() {
                            teams.remove(at: l)
                        
                        }
                        else
                        {
                            teams.remove(at: m)
                            
                        }
                    }
                    else
                    {
                        break
                    }
                   
            m = l + 1
       }
               for j in 0..<teams.count{
                        teams[j].moveTeam()
                   }
                                  
       l += 1
 }
            
                 if teams.count <= 1 {
                    print("winner is \(teams[0].getTeam_Name())")
                  break
            }
        }
    }
    
}

let main : Main = Main()
main.createTeam()
main.teamNearby()
 

