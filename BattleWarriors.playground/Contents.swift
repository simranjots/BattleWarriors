import Foundation

import UIKit



var main : Main = [Main]()

main.createTeam()
main.teamNearby()

class Main {

    //Other class Object
    var teams = [Team]()

    var Loser : Team = [Team]()

    var member : Int

    var distance : Double

    let max_team_members : Int = 20;



    public func createTeam() -> Void {

        var a = "A", b = "B", c = "C", d = "D",e = "E"

        
        //teams.append(Team (color :  "Black", team_name : "Team A", mem : self.member, play : self.createPlayer(p: a))
//        teams.append(Team (color :  "Blue", team_name : "Team B", mem : self.member, play : self.createPlayer(p: b))
//        teams.append(Team (color :  "Red", team_name : "Team C", mem : self.member, play : self.createPlayer(p: c))
//        teams.append(Team (color :  "Grey", team_name : "Team D", mem : self.member, play : self.createPlayer(p: d))
//        teams.append(Team (color :  "Green", team_name : "Team E", mem : self.member, play : self.createPlayer(p: e))

    }

    

    public func createPlayer (p : String) -> Array<Player> {

    self.member = Int.random(in: 5...20)

    var players = [Player?](repeating: nil, count: member)

        for i in 0..<players.count {    //get input variables;
        let stringIndex = String(i)
            players[i] = Player(health: 100, name: "Player " + stringIndex + a, rank: 1,selected_weapon: 0);

            players.append(players[i])
    }
        return players

    }


   public func teamNearby() -> Void {
        
        while teams.count > 1 {
            
            for l in 0..<teams.count{
                
                for m in l + 1..<teams.count{
                    
                    var x1 : Int = teams[l].getX_axis()
                    var y1 : Int = teams[l].getY_axis()
                    var x2 : Int = teams[m].getX_axis()
                    var y2 : Int = teams[m].getY_axis()
                    
                    distance = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
                    
                    if distance <= (teams[l].getRadius() + teams[m].getRadius())
                    {
                        Loser = teams[l].battleTeam(teams[m])
                        let index = teams.firstIndex(of: Loser)
                        
                        teams.remove(at : index)
                    }
                    
                    
                }
                
                
            }
            
            for l in 0..<teams.count{
                for m in l + 1..<teams.count{
                    
                    teams[l].moveTeam()
                    teams[m].moveTeam()
            
                }
            }


            if teams.count < 0 {
                  break
            }
        }
    }
    
}
