//
//  Add.swift
//  POO_Notes
//
//  Created by eleves on 2017-08-01.
//  Copyright © 2017 GrassetSucre. All rights reserved.
//

import Foundation

class Add {
    
    var dictionnary: [String: Bool]!
    var keys: [String] = []
    var values: [Bool] = []
    let userDefault = UserDefaults.standard
    
    //---------------------------
    init() {
        if userDefault.object(forKey: "data") ==  nil {
            dictionnary = [:]
            userDefault.setValue(dictionnary, forKey: "data")
        } else {
            dictionnary = userDefault.object(forKey: "data") as! [String : Bool]!
            parseDict()
        }
    }
    //---------------------------
    func parseDict() {
        keys = []
        values = []
        for (k, v) in dictionnary {
            keys.append(k)
            values.append(v)
        }
    }
    //---------------------------
    func addValue(keyToAdd: String) {
        dictionnary[keyToAdd] = false
        saveData()
    }
    //---------------------------
    func removeValue(keyToRemove: String) {
        dictionnary[keyToRemove] = nil
        saveData()
    }
    //---------------------------
    func saveData() {
        parseDict()
        userDefault.setValue(dictionnary, forKey: "data")
    }
    //--------------------------- REGARDER SI J'UTILISE LA FONCTION
    func reloadValues() {
        let i = 0
        while i < dictionnary.count{
             dictionnary[Array(dictionnary.keys)[i]] = false
        }
    }
    //---------------------------
    func removeALL () {
        dictionnary = [:]
        self.parseDict()
    }
    //---------------------------
    func countTrue () -> Int {
       var counter = 0
        
        for i in self.values {
            
            if i == true{
                counter += 1
            }
        }
        return counter
    }
    
    
}//fin de la class Add

