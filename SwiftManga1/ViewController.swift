//
//  ViewController.swift
//  SwiftManga1
//
//  Created by Naoki Arakawa on 2019/02/17.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var countLabel: UILabel!
    
    
    @IBOutlet var runnerImageView: UIImageView!
    
    var imageArray : Array<UIImage> = []
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    var updateCount = 0
    
    var stopCount = 0
    
    
    @IBOutlet weak var runButton: UIButton!
    
    //経過時間
    var countUp = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "0"
        let image0 = UIImage(named: "dash0.png")!
        let image1 = UIImage(named: "dash1.png")!
        let image2 = UIImage(named: "dash2.png")!
        let image3 = UIImage(named: "dash3.png")!
        let image4 = UIImage(named: "dash4.png")!
        let image5 = UIImage(named: "dash5.png")!
        
        imageArray = [image0, image1, image2, image3, image4, image5]
       
    
    }
    
    
    @IBAction func run(_ sender: Any) {
        
        //ストップボタンを押した回数を０にする
        stopCount = 0
        
        //スタートボタンを無効にする
        runButton.isEnabled  = false
        
        //タイマーをスタートさせる
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (Timer) in
            
            //カウントアップをしていく
            self.countUp += 1
            
            
            //その数字をラベルに反映
            self.countLabel.text = String(self.countUp)
            
        })
        
    //runnerImageViewに画像を１秒ごとに反映していく
    //タンスの中から画像を取り出して、UIImageViewに反映していく
   
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
        
            if self.updateCount > 5 {
                
                self.updateCount = 0
                self.runnerImageView.image = UIImage(named: "dash0.png")
                
                
            } else {
                
                self.runnerImageView.image = self.imageArray[self.updateCount]
                
            }
            
              self.updateCount += 1
            
            
        })
    
    
    }
    

    @IBAction func stop(_ sender: Any) {
    
        //スタートボタンを有効にする
        runButton.isEnabled = true
       
        
        //タイマーをストップさせる
        timer1.invalidate()
        timer2.invalidate()
        
        //ストップボタンが押された回数をカウントする
        stopCount += 1
        
        if stopCount >= 2 {
            
            self.countLabel.text = "0"
            
            self.runnerImageView.image = UIImage(named: "dash0.png")
            
            countUp = 0
            
            
        }
        
    
    
    }
    
    
    
    
}

