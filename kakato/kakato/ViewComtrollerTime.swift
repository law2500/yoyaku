//
//  ViewComtrollerTime.swift
//  kakato
//
//  Created by law on 2022/01/05.
//

import UIKit

class ViewComtrollerTime: UIViewController {
    
    private let cellId = "cellId"
    private  var day = ""
    
    let yyy = ["3月1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","20日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日","31日"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segue = segue.destination as! ViewControllerYyy
        segue.day = day
    }
    
    
    
}

extension ViewComtrollerTime: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yyy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = yyy[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        day = yyy[indexPath.row]
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
}
