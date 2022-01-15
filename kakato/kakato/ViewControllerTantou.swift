//
//  ViewControllerTantou.swift
//  kakato
//
//  Created by law on 2022/01/05.
//

import UIKit

class ViewControllerTantou: UIViewController {
    
    private let cellId = "cellId"
    private let tantou = ["田中","鈴木","佐藤","後藤","佐々木"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
}


extension ViewControllerTantou: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tantou.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = tantou[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let alat: UIAlertController = UIAlertController(title: "wert", message: "asdfgh", preferredStyle: UIAlertController.Style.alert)
        
        let ko: UIAlertAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { UIAlertAction in
            print("ok")
        }
        
        let hu: UIAlertAction = UIAlertAction(title: "rt", style: UIAlertAction.Style.default) { UIAlertAction in
            print("bhu")
        }
        alat.addAction(ko)
        alat.addAction(hu)
        
        present(alat, animated: true, completion: nil)
    }
}
