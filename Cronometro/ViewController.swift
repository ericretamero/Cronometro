//
//  ViewController.swift
//  Cronometro
//
//  Created by usu27 on 1/3/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variable para el tiempo
    var tiempo: NSTimer!
    var cont: Int = 0
    var segundo: Int = 0;
    var minuto: Int = 0;
    
    @IBOutlet weak var cronometro: UILabel!
    
    @IBAction func pausa(sender: AnyObject) {
         tiempo.invalidate()
    }

    @IBAction func play(sender: AnyObject) {
        tiempo = NSTimer.scheduledTimerWithTimeInterval(1, target: self,
            selector: Selector("update"), userInfo: nil, repeats: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func update() {
        if(segundo<10 && minuto<10){
             cronometro.text="0"+String(minuto)+":0"+String(segundo)
            segundo++
        }
        
        if(segundo>=10 && minuto>=10){
            cronometro.text = String(minuto)+":"+String(segundo)
        segundo++
        }
        
        if(segundo>=10 && minuto<=10){
            cronometro.text="0"+String(minuto)+":"+String(segundo)
            segundo++
        }
        if(segundo<=10 && minuto>=10){
            cronometro.text=String(minuto)+":0"+String(segundo)
       segundo++
        }
        
        if(segundo==60){
            minuto++;
            segundo=0;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

