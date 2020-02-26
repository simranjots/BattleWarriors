import Foundation

import UIKit

protocol WeaponProtocol
{
    func getWeaponName() -> String
    func fire() -> Int
    func damage() -> Int
    func fire_rate() -> Int
}

class WeaponClass
{
    var fire_rate : Int = 0
    var damage : Int = 0
    var bullets : Int = 0
    var MAX_NUM_BULLETS : Int = 30
    
    
    init(fire_rate : Int, damage : Int, bullets : Int){
        self.bullets = bullets
        self.damage = damage
        self.bullets = bullets
    }
    
    
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
    
    
    func reload() -> Int {
        self.setBullets(bullets: self.MAX_NUM_BULLETS)
        return self.getBullets()
    }
    
    //  func upgradeWeapon(Team team,int this_team) -> Void {
    //updating the weapon
    // team.getPlayer().get(0).get(this_team).setSelected_weapon(team.getPlayer().get(0).get(this_team).getSelected_weapon() + 1);
    //team.getPlayer().get(0).get(this_team).setScore(team.getPlayer().get(0).get(this_team).getScore() - 25);
    // }
    
}



class  Lmg : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "LMG"
    
    init(bullet : Int) {
        self.bullet = bullet
        super.init(fire_rate: 2, damage: 35, bullets: self.bullet)
    }
    
    func getWeaponName() -> String {
        return weaponName
    }
    
    func fire() -> Int {
        self.setBullets(bullets : self.getBullets()-1);
        if(self.getBullets()<=0)
        {
            self.reload();
        }
        return self.getBullets();
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

class  Assault : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "Assault"
    var dam : Int = 0
    
    init(bullet : Int) {
        self.bullet = bullet
        super.init(fire_rate: 3, damage: 15, bullets: self.bullet)
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

class  Shotgun : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "Shotgun"
    var dam : Int = 0
    
    init(bullet : Int) {
        self.bullet = bullet
        super.init(fire_rate: 3, damage: 25, bullets: self.bullet)
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

class  Smg : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "SMG"
    
    init(bullet : Int) {
        self.bullet = bullet
        super.init(fire_rate: 3, damage: 30, bullets: self.bullet)
    }
    
    func getWeaponName() -> String {
        return weaponName
    }
    
    func fire() -> Int {
        self.setBullets(bullets : self.getBullets()-1);
        if(self.getBullets()<=0)
        {
            self.reload();
        }
        return self.getBullets();
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

class  Sniper : WeaponClass, WeaponProtocol{
    var bullet : Int
    var weaponName : String = "Sniper"
    
    init(bullet : Int) {
        self.bullet = bullet
        super.init(fire_rate: 2, damage: 50, bullets: self.bullet)
    }
    
    func getWeaponName() -> String {
        return weaponName
    }
    
    func fire() -> Int {
        self.setBullets(bullets : self.getBullets()-1);
        if(self.getBullets()<=0)
        {
            self.reload();
        }
        return self.getBullets();
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




