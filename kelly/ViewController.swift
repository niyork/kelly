//
//  ViewController.swift
//  kelly
//
//  Created by macOS6 on 10/5/18.
//  Copyright © 2018 macOS6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var k1: UIImageView!
    @IBOutlet weak var k2: UIImageView!
    @IBOutlet weak var k3: UIImageView!
    @IBOutlet weak var k4: UIImageView!
    @IBOutlet weak var k5: UIImageView!
    @IBOutlet weak var k6: UIImageView!
    @IBOutlet weak var k7: UIImageView!
    @IBOutlet weak var k8: UIImageView!
    @IBOutlet weak var k9: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    var score = 0
  var counter = 0
    var timer = Timer()
  var   hideKennyTimer = Timer()
    var highest = 0
    var kennyArray = [UIImageView]()
    @IBOutlet weak var buttonBasla: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "score : \(score)"
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        
        k1.isUserInteractionEnabled = true
        k2.isUserInteractionEnabled = true
        k3.isUserInteractionEnabled = true
        k4.isUserInteractionEnabled = true
        k5.isUserInteractionEnabled = true
        k6.isUserInteractionEnabled = true
        k7.isUserInteractionEnabled = true
        k8.isUserInteractionEnabled = true
        k9.isUserInteractionEnabled = true
        
        k1.addGestureRecognizer(recognizer1)
        k2.addGestureRecognizer(recognizer2)
        k3.addGestureRecognizer(recognizer3)
        k4.addGestureRecognizer(recognizer4)
        k5.addGestureRecognizer(recognizer5)
        k6.addGestureRecognizer(recognizer6)
        k7.addGestureRecognizer(recognizer7)
        k8.addGestureRecognizer(recognizer8)
        k9.addGestureRecognizer(recognizer9)
        
        //arrays
        kennyArray.append(k1)
        kennyArray.append(k2)
        kennyArray.append(k3)
        kennyArray.append(k4)
        kennyArray.append(k5)
        kennyArray.append(k6)
        kennyArray.append(k7)
        kennyArray.append(k8)
        kennyArray.append(k9)
        
        
        hideKenny()
        timer.invalidate()
        hideKennyTimer.invalidate()
        
        counter = 10
        
        timeLabel.text = "\(counter)"
     

    
    
    }
    

    @IBAction func buttonBasla(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        
        
        self.hideKennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        
        buttonBasla.isHidden = true
        
        
    }

    
    @objc func hideKenny (){
        
        for kenny in kennyArray{
            kenny.isHidden = true
            }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        
        kennyArray[random].isHidden = false
        
      
    }
    
    
    
    @objc func countDown(){
        counter = counter - 1
        timeLabel.text = "\(counter)"
        if counter == 0{
            timer.invalidate()
            hideKennyTimer.invalidate()
            
            if score > highest{
                highest = score
                highestScoreLabel.text = "\(highest)"
                timer.invalidate()
                }
            let alert = UIAlertController(title: "TIme", message: "times up", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            let replay = UIAlertAction(title: "REPLAY", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.counter = 10
                self.score = 0
                self.scoreLabel.text = "score : \(self.score)"
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                
                self.hideKennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
                
                
            }
            alert.addAction(okButton)
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
            
            
            
            
        }
        
            }
            

        

    @objc func increaseScore(){
        score = score + 1
        
        scoreLabel.text = "score : \(score)"
    }
    
   
    
    




}
