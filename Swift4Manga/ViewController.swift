//
//  ViewController.swift
//  Swift4Manga
//
//  Created by Yuta Fujii on 2017/07/11.
//  Copyright © 2017年 Yuta Fujii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var runnnerImageView: UIImageView!
    
    //配列
    var imageArray = [UIImage]()
    
    //経過時間用のタイマー
    var timer1 = Timer()
    //画像を配列(タンス)から出すスピード
    var timer2 = Timer()
    var ti = Timer()
    //経過時間
    var countUp = 0
    var updateCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        
        imageArray = [image0!,image1!,image2!,image3!,image4!,image5!]
        
        
    }
    @IBAction func start(_ sender: Any) {
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            self.countUp = self.countUp + 1
            
            self.countLabel.text = String(self.countUp)
            
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            //タンスの中から画像を取り出して、UIImageViewの画像へ反映していく
            
            if(self.updateCount > 5){
                
                self.updateCount = 0
                self.runnnerImageView.image = UIImage(named: "dash0.png")
            }else{
                
                self.runnnerImageView.image = self.imageArray[self.updateCount]
                
            }
            self.updateCount = self.updateCount + 1
            
        })
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

