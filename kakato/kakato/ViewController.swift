//
//  ViewController.swift
//  kakato
//
//  Created by law on 2022/01/04.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var hstack: UIStackView!
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSet()
        buttonSet()
        scrollViewSet()
        
    }
    
    func scrollViewSet() {
        // scrollViewの画面表示サイズを指定
                scrollView = UIScrollView(frame: CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: 250))
                // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
                scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 250)
                // scrollViewのデリゲートになる
                scrollView.delegate = self
                // メニュー単位のスクロールを可能にする
                scrollView.isPagingEnabled = true
                // 水平方向のスクロールインジケータを非表示にする
                scrollView.showsHorizontalScrollIndicator = false
                self.view.addSubview(scrollView)
                
                // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
                let imageView1 = createImageView(x: 0, y: 0, width: self.view.frame.size.width, height: 200, image: "download-1")
                scrollView.addSubview(imageView1)
                
                let imageView2 = createImageView(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 250, image: "download-2")
                scrollView.addSubview(imageView2)
                
                let imageView3 = createImageView(x: self.view.frame.size.width*2, y: 0, width: self.view.frame.size.width, height: 250, image: "download-3")
                scrollView.addSubview(imageView3)
                
                // pageControlの表示位置とサイズの設定
                pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
                // pageControlのページ数を設定
                pageControl.numberOfPages = 3
                // pageControlのドットの色
                pageControl.pageIndicatorTintColor = UIColor.lightGray
                // pageControlの現在のページのドットの色
                pageControl.currentPageIndicatorTintColor = UIColor.black
                self.view.addSubview(pageControl)
    }
    
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
            let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
            let image = UIImage(named:  image)
            imageView.image = image
            return imageView
        }
    
    private func buttonSet() {
        hstack.layer.borderWidth = 0.5
        button1.setImage(UIImage(systemName: "house.fill"), for: .normal)
        button1.setTitle("", for: .normal)
        button2.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button2.setTitle("", for: .normal)
        button3.setImage(UIImage(systemName: "lasso.and.sparkles"), for: .normal)
        button3.setTitle("", for: .normal)
        button4.setImage(UIImage(systemName: "envelope.circle.fill"), for: .normal)
        button4.setTitle("", for: .normal)
    }
    
    
    private func navigationSet() {
        navigationItem.title = "美容院"
        
        let rBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc.badge.gearshape.fill"), style: .plain, target: self, action: #selector(rdidTapSearch))
                navigationItem.rightBarButtonItem = rBarButtonItem
        rBarButtonItem.tintColor = .lightGray
        
        let lBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(ldidTapSearch))
                navigationItem.leftBarButtonItem = lBarButtonItem
        lBarButtonItem.tintColor = .lightGray
        
    }

    @objc func rdidTapSearch() {
        performSegue(withIdentifier: "segue4", sender: nil)
    }
    
    @objc func ldidTapSearch() {
        performSegue(withIdentifier: "segue3", sender: nil)
    }
    
    @IBAction func buttonAc1(_ sender: Any) {
    }
    
    @IBAction func buttonAc2(_ sender: Any) {
    }
    
    @IBAction func buttonAc3(_ sender: Any) {
    }
    
    @IBAction func buttonAc4(_ sender: Any) {
    }
    
}



extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
