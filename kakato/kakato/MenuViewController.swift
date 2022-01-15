//
//  MenuViewController.swift
//  kakato
//
//  Created by law on 2022/01/09.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let itemList = ["シャンプー","トリートメント","リンス","ヘアーオイル","ワックス","化粧水","カラーシャンプ"]
    private let cellId = "cellId"
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // メニューの位置を取得する
        let menuPos = self.menuView.layer.position
        // 初期位置を画面の外側にするため、メニューの幅の分だけマイナスする
        self.menuView.layer.position.x = -self.menuView.frame.width
        // 表示時のアニメーションを作成する
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.menuView.layer.position.x = menuPos.x
        },
            completion: { bool in
        })

    }
    
    
    

    // メニューエリア以外タップ時の処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1 {
                UIView.animate(
                    withDuration: 0.2,
                    delay: 0,
                    options: .curveEaseIn,
                    animations: {
                        self.menuView.layer.position.x = -self.menuView.frame.width
                },
                    completion: { bool in
                        self.dismiss(animated: true, completion: nil)
                }
                )
            }
        }
    }
    

}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     
    // Sectioのタイトル
    func tableView(_ tableView: UITableView,
                       titleForHeaderInSection section: Int) -> String? {
        
        return "販売リスト"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemList[indexPath.row])
    }
}
