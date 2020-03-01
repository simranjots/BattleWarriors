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
            print("in main while again")
            for var l in 0..<teams.count{
                print("inside first for")
                var n = l + 1
                for var m in n..<teams.count{
                    
                    print("inside second for")
                    print(l)
                    print(m)
                    print(n)
                    print(teams.count)
//                    if(m >= teams.count)
//                    {
//                        m = teams.count - 1
//                    }
                    let x1 : Int = teams[l].getX_axis()
                    let y1 : Int = teams[l].getY_axis()
                    let x2 : Int = teams[m].getX_axis()
                    let y2 : Int = teams[m].getY_axis()
                    print("found axis")
                    
                    let xAxis = x2 - x1
                    let yAxis = y2 - y1
                    
                    let sqrtvalue : Double = Double(((xAxis * xAxis) + (yAxis * yAxis)))
                    let distance = sqrtvalue.squareRoot()
                    
                    if distance <=  Double(teams[l].getRadius() + teams[m].getRadius())
                    {
                        print("\(teams[l].getTeam_Name()) is nearby to \(teams[m].getTeam_Name())")
                        var Loser = teams[l].battleTeam(otherTeam : teams[m])
                        //let index = teams.index(of : Loser)
                        //teams.remove(at: 2)
                    
                            print("inside remove")
                            print(teams.count)
                        for lt in 0..<teams.count
                        {
                            let t = teams[lt]
                            print(t.getTeam_Name())
                            print(Loser.getTeam_Name())
                            if(t.getTeam_Name() == Loser.getTeam_Name())
                            {
                                print("inside if")
                                print(lt)
                                print(teams.count)
                                teams.remove(at: lt)
                                print("removed")
                                break
                            }
                        }
                        
                       // var index = teams[Loser]
                        
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

let main : Main = Main()
main.createTeam()
main.teamNearby()
 

