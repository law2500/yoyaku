//
//  ViewComtroller2.swift
//  kakato
//
//  Created by law on 2022/01/05.
//

import UIKit

class ViewComtroller2: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button4.layer.cornerRadius = 10
        button5.layer.cornerRadius = 10
        button6.layer.cornerRadius = 10
        
        
        
    }
    @IBAction func buttonAc1(_ sender: Any) {
    }
    @IBAction func buttonAc2(_ sender: Any) {
    }
    @IBAction func buttonAc3(_ sender: Any) {
    }
    @IBAction func buttonAc4(_ sender: Any) {
    }
    @IBAction func buttonAc5(_ sender: Any) {
    }
    @IBAction func buttonAc6(_ sender: Any) {
    
        
        let alert: UIAlertController = UIAlertController(title: "予約キャンセル", message: "予約をキャンセルしてよろしいですか？", preferredStyle:  UIAlertController.Style.alert)

        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                
                (action: UIAlertAction!) -> Void in
                print("Cancel")
            })
        
        
        
        
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
       

        present(alert, animated: true, completion: nil)
    }
}
