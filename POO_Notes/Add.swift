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
    var motCle: [String] = []
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
        motCle = []
        values = []
        for (k, v) in dictionnary {
            motCle.append(k)
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
    //---------------------------
    func reloadValues() {
        
        let i = 0
        while i < dictionnary.count{
             dictionnary[Array(dictionnary.keys)[i]] = false
        }
        
        
        
//        for c in 0 ..< (b as! NSArray).count
//        {
//            var newString = "\""
//            newString +=  ((b as! NSArray)[c] as! String)
//            newString += "\""
//            CSV += newString + ","
//        }
        
        
        
        
        
    }
    
}//fin de la class Add

