import Foundation

import UIKit

class Team {
    
    var  temp : String = ""
    var this_team : Int = 0, another_team : Int = 0
    var teama : Int = 0 ,teamb : Int = 0
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
        this_team = Int.random(in: 0 ... teama)
        another_team = Int.random(in: 0 ... teamb)
        
        
        
        return otherTeam
    }
    
    
    
    
    
    
    
    
    
}
