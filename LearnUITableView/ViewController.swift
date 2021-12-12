//
//  ViewController.swift
//  LearnUITableView
//
//  Created by Amman on 11/17/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                   = tblView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath)
        let list                   = arr[indexPath.row]
        cell.textLabel?.text       = arr[indexPath.row]
        cell.detailTextLabel?.text = "This is item # " + String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            let row = indexPath.row
            arr[row].append("str")
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        arr.append(textFld.text!)
        setEditing(true, animated: true)
        tblView.reloadData()
        if isEditing {
            
        } else {
            //sender.setTitle("Add Item", for: .normal)
        }
    }
    
    @IBOutlet var textFld : UITextField!
    @IBOutlet var tblView : UITableView!
    
    var arr : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate   = self
        for i in arr {
            print(i)
        }
    }


}

