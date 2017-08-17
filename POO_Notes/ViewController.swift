//
//  ViewController.swift
//  POO_Notes
//
//  Created by eleves on 2017-07-20.
//  Copyright © 2017 GrassetSucre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var objAdd = Add()
    let jsonManager = JsonManager(urlToJsonFile: "http://localhost/dashboard/programmationOO2_Adriana/json_php/data.json")
    
    //---------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("===========")
        print(objAdd.dictionnary)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return objAdd.dictionnary.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        cell.textLabel!.text = objAdd.keys[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if Array(objAdd.dictionnary.values)[indexPath.row] {
            cell.backgroundColor = UIColor(red: 0.125, green: 0.251, blue: 0.6, alpha: 1.0)
            
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            objAdd.removeValue(keyToRemove: objAdd.keys[indexPath.row])
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        if !Array(objAdd.dictionnary.values)[indexPath.row] {
            objAdd.dictionnary[Array(objAdd.dictionnary.keys)[indexPath.row]] = true
        } else {
            objAdd.dictionnary[Array(objAdd.dictionnary.keys)[indexPath.row]] = false
        }
        objAdd.saveData()
        tableView.reloadData()
    }
    //---------------------
    

    
    
    //--------------- Methode pour ajouter une note à la table ---------------------//
    @IBAction func ajouterNote(_ sender: UIButton) {
        
        objAdd.addValue(keyToAdd: textField.text!)
        tableView.reloadData()
        textField.text?.removeAll()
        
    }
    
    
    //--------------- Methode pour sauvegarder les notes sur le serveur ---------------------//
    @IBAction func sauvegarderServeur(_ sender: UIButton) {
        
        print(objAdd.dictionnary)
        
        var urlToSend = "http://localhost/dashboard/programmationOO2_Adriana/json_php/add.php?json=["
        var counter = 0
        let total = objAdd.dictionnary.count
        for (a, b) in objAdd.dictionnary {
            let noSpaces = replaceChars(originalStr: a, what: " ", byWhat: "_")
            counter += 1
            if counter < total {
                urlToSend += "/\(noSpaces)/,/\(b)/!"
            } else {
                urlToSend += "/\(noSpaces)/,/\(b)/"
            }
        }
        urlToSend += "]"
        
        let session = URLSession.shared
        let urlString = urlToSend
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        let dataTask = session.dataTask(with: request as URLRequest) {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
        }
        dataTask.resume()
        
        
    }
    
    //--------------- Methode pour telecharger les notes sauvegardées sur le serveur ---------------------//
    @IBAction func telechargerNotes(_ sender: UIButton) {

        objAdd.removeALL()
        jsonManager.importJSON()
        jsonManager.parseJsonDict(objAdd: objAdd)
        objAdd.saveData()
        tableView.reloadData()
        
    }

    
    func replaceChars(originalStr: String, what: String, byWhat: String) -> String {
        return originalStr.replacingOccurrences(of: what, with: byWhat)
    }
    
    
    
    @IBAction func deselectionner(_ sender: UIButton) {
        
        for i in 0 ..< objAdd.dictionnary.count    {
            if Array( objAdd.dictionnary.values)[i] {
                objAdd.dictionnary[Array( objAdd.dictionnary.keys)[i]] = false
            }
        }
        
        tableView.reloadData()
    }

 
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//fin de la class












