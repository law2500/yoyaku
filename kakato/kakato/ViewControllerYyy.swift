//
//  ViewControllerYyy.swift
//  kakato
//
//  Created by law on 2022/01/05.
//

import UIKit

class ViewControllerYyy: UIViewController {
    
    var day = ""
    var yyyy = ""
    var color: UIColor = .white
    
    
    private let cellId = "cellId"
    
    private let yyy = ["9:00","9:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}


extension  ViewControllerYyy: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yyy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = yyy[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        yyyy = yyy[indexPath.row]
        
        
        let alert: UIAlertController = UIAlertController(title: "予約受付", message: "\(day)の\(yyyy)に予約しますか？", preferredStyle:  UIAlertController.Style.alert)

            // ② Actionの設定
            // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
            // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
            // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
            self.navigationController?.popToRootViewController(animated: true)
            
            
            })
            // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("Cancel")
            })

            // ③ UIAlertControllerにActionを追加
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)

            // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
    }
    
}
