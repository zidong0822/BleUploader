//
//  ViewController.swift
//  demo
//
//  Created by Harvey He on 2017/8/14.
//  Copyright © 2017年 Harvey He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let n = 100;
        isPrimes(n)
        
//        while true {
//            
//            let p = isPrimes(n)
//            if(p < n){
//                n = n/p
//            }else{
//            
//                print(n)
//                break;
//            }
//        }
      
        
    }
 
    
    func isPrimes(_ n:Int)  {
       
        
        for i:Int in 2...Int(sqrt(Double(n))) {
        
        
            if n%i == 0 {
            
                print(i);
              //  return i
            }
        
        }
      
       // return n;
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

