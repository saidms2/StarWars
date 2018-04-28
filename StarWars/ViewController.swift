//
//  ViewController.swift
//  StarWars
//
//  Created by Said Moustaoui (Étudiant) on 18-04-21.
//  Copyright © 2018 Said Moustaoui (Étudiant). All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonneEndpoint = "people/1/"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var masslabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let getPersonneURL = URL(string: baseURL + getPersonneEndpoint)!
        Alamofire.request(getPersonneURL).responseJSON
            { response in
                
                //if response.result == .success{
                if response.result.isSuccess{
                    print("success")
                }
                else{
                    print("NO...success")
                }
                let jason = response.value
                print(jason)
                
                
        }
        
        let person = Person(name: "jean", height:188)
        let person2 = Person("jean")

        //print (person)
        print (person.getName())
        
        nameLabel.text = person.name
        masslabel.text = "\(person.mass)"
        heightLabel.text = "\(person.height)"
        hairColorLabel.text = person.hairColor.rawValue
        
        print (person2.getName())
        
        }
    
}

enum HairColor: String {
    case light = "light"
    case brown  = "brown"
    case black  = "black"
    case blond  = "blond"
}

struct Person {
    var name = "Unknown"
    var height = 0
    var mass  = 0
    var hairColor : HairColor = .black
    var skinColor = "Unknown"
    var eyeColor = "Unknown"
    var gender = "Unknown"
    var homeworld = "Unknown"
    
    init(name : String, height : Int) {
        self.name = name
        self.height = height
        
    }
    
    init(_ name : String) {
        self.name = name
        
    }
    
    func getName() -> String {
        return self.name
    }
    
}
