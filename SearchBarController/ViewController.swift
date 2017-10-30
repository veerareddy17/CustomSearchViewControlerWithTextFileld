//
//  ViewController.swift
//  SearchBarController
//
//  Created by SAIRAM on 30/08/17.
//  Copyright © 2017 Netberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //Mark:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    //Mark:- Properties
    var searchResults:[String] = []
    var tableviewShowArray = NSArray()
      var tabledata = ["lucques","chickendijon","godaddy","amazon","chris","ambata","bankofamerica","abelcine","AUTO + TRANSPORTATION","BILLS + UTILITIES","FOOD + DINING","HEALTH","AutoCare", "Auto Payment" , "Gas+Fuel","Electric Bill", "Internet/Television","Fast Foodd", "Gorceries" , "Restaurants","Gym Membership", "Health Insurance","auto","note-bullet","knife","heart"]
    //Mark:- Viewlifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableviewShowArray = tabledata as NSArray
        let imageView = UIImageView()
        
        let image = UIImage(named: "searchIcon")
        
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 30 , height: 30)
        searchTextField.leftViewMode = UITextFieldViewMode.always
        searchTextField.leftView = imageView
        searchTextField.addSubview(imageView)

        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
    
    }
    //Mark:-TextFieldDelegate Methode
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        searchResults = self.tabledata.filter({(text:String) -> Bool in
//            let stringMatch = text.range(of: string)
//            return stringMatch != nil
//            
//        })
       // textField.resignFirstResponder()
        
        searchResults = self.tabledata.filter({(coisas:String) -> Bool in
            let stringMatch = coisas.range(of: string)
            return stringMatch != nil
            
        })
        self.tableviewShowArray = searchResults as NSArray
        print(searchResults.description)
        
        tableView.reloadData()
        return true
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewShowArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = "\(tableviewShowArray[indexPath.row])"
        return cell
    }
}

