//
//  SummaryViewController.swift
//  LearnUITableView
//
//  Created by Amman on 11/17/21.
//

import UIKit

class SummaryViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arr: [[String]] = [["Some job", "Another job", "Some 3rd job"],["a1","b1","c1"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                   = tblView.dequeueReusableCell(withIdentifier: "SummaryViewCell", for: indexPath)
        let list                   = arr[indexPath.row]
        cell.textLabel?.text       = "Workboard " + String(indexPath.row + 1)
        cell.detailTextLabel?.text = "This is workboard " + String(indexPath.row + 1)
        return cell
    }
    

    
    @IBAction func addArray(_ sender: UIButton) {
        arr.append([])
        setEditing(true, animated: true)
        tblView.reloadData()
        if isEditing {
            
        } else {
            //sender.setTitle("Add Item", for: .normal)
        }
    }
    
    @IBOutlet var tblView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate   = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowDetail":
            if let row = tblView.indexPathForSelectedRow?.row {
                let viewController = segue.destination as! ViewController
                viewController.arr = arr[row]
            }
        /*case "AddArray":
            if let row = tblView.indexPathForSelectedRow?.row {
                let viewController = segue.destination as! ViewController
                viewController.arr.append("str")
            }*/
        default:
            print("Unexpected segue identifier")
        }
    }
}
