//
//  Data.swift
//  Munchies1.0
//
//  Created by Nicky on 4/14/16.
//  Copyright © 2016 Nicky. All rights reserved.
//

import Foundation

class Data
{
    class User
    {
        let fname : String;
        let lname : String;
        let pnumber : String; //use regex for this
        let userImage : String; //string representing the jpeg
        let email : String; //use regex for this
        let password : String; //also use regex for this and imported Password object for security
//        let preferences : Preferences; //probably a preferences object
//        let Restaurant : UnsafeMutablePointer<Restaurant>;
        init(fname : String, lname : String, pnumber : String, userImage : String, email : String, password : String)
        {
            self.fname = fname;
            self.lname = lname;
            self.pnumber = pnumber;
            self.userImage = userImage;
            self.email = email;
            self.password = password;
        }
    }
    
    class Restaurant
    {
        let name : String;
        let address : String;
        let restImage : String; //string containing the name of the file
        let dishes : [Dish]; //rather than a list of pointers, should use array because it is not like restaurant where each restaurant is unique;
        init(name : String, address : String, restImage: String, dishes : [Dish])
        {
            self.name = name;
            self.address = address;
            self.restImage = restImage;
            self.dishes = dishes;
        }
        
        func setName(name : String)
        {
            
        }
    }
    
    class Dish
    {
        let name : String;
        let dishImage : String;
        let desc : String;
        var notes : String;
        let cookTime : Int; //number of seconds, doesn't have to show precision, only minutes
        init(name : String, dishImage : String, desc : String, notes : String, cookTime : Int)
        {
            self.name = name;
            self.dishImage = dishImage;
            self.desc = desc;
            self.notes = notes;
            self.cookTime = cookTime;
        }
    }
    
    let users = [
        User(fname: "Nicky", lname: "Huynh", pnumber: "626-297-9957", userImage: "me.jpeg", email: "nickyh1@uci.edu", password: "bottles")
    ] //hard coded for now, will gather from database in future
    
    let restaurants = [
        Restaurant(name: "Mistro", address: "90 Wildwood", restImage: "dish1.jpeg", dishes: [Dish(name: "Dish1", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes1", cookTime: 60), Dish(name: "Dish2", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes2", cookTime: 120)]),
        Restaurant(name: "Bistro", address: "91 Wildwood", restImage: "rest1.jpeg", dishes: [Dish(name: "Dish1", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes1", cookTime: 60), Dish(name: "Dish2", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes2", cookTime: 120)]),
        Restaurant(name: "Distro", address: "92 Wildwood", restImage: "rest2.jpeg", dishes: [Dish(name: "Dish2", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes3", cookTime: 60), Dish(name: "Dish3", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes4", cookTime: 120)])
    ] //hard coded for now, will gather from database in future
    
    let likes = [
        Restaurant(name: "Questro", address: "94 Wildwood", restImage: "dish1.jpeg", dishes: [Dish(name: "Dish1", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes1", cookTime: 60), Dish(name: "Dish2", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes2", cookTime: 120)]),
        Restaurant(name: "Maestro", address: "95 Wildwood", restImage: "rest1.jpeg", dishes: [Dish(name: "Dish1", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes1", cookTime: 60), Dish(name: "Dish2", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes2", cookTime: 120)]),
        Restaurant(name: "Truestro", address: "96 Wildwood", restImage: "rest2.jpeg", dishes: [Dish(name: "Dish2", dishImage: "dish1.jpeg", desc: "A delicious meal made of rocks.", notes: "Notes3", cookTime: 60), Dish(name: "Dish3", dishImage: "dish2.jpeg", desc: "A delicious meal made of seafood.", notes: "Notes4", cookTime: 120)])
    ]
}