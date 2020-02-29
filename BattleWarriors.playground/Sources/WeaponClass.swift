import Foundation

import UIKit

protocol WeaponProtocol
{
    func getWeaponName() -> String
    func fire() -> Int
    func damage() -> Int
    func fire_rate() -> Int
}

public class WeaponClass
{
    var fire_rate : Int = 0
    var damage : Int = 0
    var bullets : Int = 0
    var MAX_NUM_BULLETS : Int = 30
    
    
    func getBullets() -> Int {
        return bullets
    }
    
    func setBullets(bullets : Int) -> Void {
        self.bullets = bullets
    }
    
    func getDamage() -> Int {
        return damage
    }
    
    func setDamage(damage :Int) -> Void{
        self.damage = damage
    }
    
    func getFire_rate() -> Int {
        return fire_rate
    }
    
    func setFire_rate(fire_rate : Int) -> Void {
        self.fire_rate = fire_rate;
    }
    
    
    func reload() -> Void {
        self.setBullets(bullets: self.MAX_NUM_BULLETS)
  
    }
    
    func upgradeWeapon(this_team : Player) -> Void {
       //updating the weapon
    
        this_team.setSelected(Nselected_weapon: this_team.getSelected_weapon() + 1)
        this_team.setScore(score: this_team.getScore() - 25)
        
     }
    
}

public class  Assault : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "Assault"
    var dam : Int = 0
    
    init(bullet : Int) {
        self.bullet = bullet
        //super.init(fire_rate: 3, damage: 15, bullets: self.bullet)
    }
    
    func getWeaponName() -> String {
        return weaponName
    }
    
    func fire() -> Int {
        self.setBullets(bullets : self.getBullets()-1);
        dam = damage() * fire_rate();
        if(self.getBullets()<=0)
        {
            self.reload();
        }
        return dam;
    }
    
    func damage() -> Int {
        self.setDamage(damage: Int.random(in: 0...self.damage))
        return  self.getDamage();
    }
    
    func fire_rate() -> Int {
        self.setFire_rate(fire_rate: Int.random(in: 0...self.fire_rate));
        return  self.getFire_rate();
    }
    
}


public class WeaponCalling {
    
    var delegate : WeaponProtocol?
    
    init(Del : WeaponProtocol) {
        self.delegate = Del
    }
    
    func setWeapon(NewWeapon : WeaponProtocol) -> Void {
        self.delegate = NewWeapon
    }
    
    
}


