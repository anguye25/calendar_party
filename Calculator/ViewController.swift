//
//  ViewController.swift
//  Calculator
//
//  Created by Amanda Nguyen on 9/8/17.
//  Copyright © 2017 Amanda Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var digit:Bool = false
    var math:Bool = false
    var operation = 0
    var action:String = ""
    var answer:Double = 0
    
    @IBOutlet weak var displayOperation: UILabel!
    @IBOutlet weak var displayAnswer: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        
        if digit == false {
            displayOperation.text = displayOperation.text! + sender.currentTitle!
            firstNumber = Double(displayOperation.text!)!
        }
        else { //digit == true
            if math == false {
                displayOperation.text = ""
                math = true
            }
            else {
                displayOperation.text = displayOperation.text! + sender.currentTitle!
            }
        }
        
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        if digit == false {
            firstNumber = firstNumber * -1
            displayOperation.text = String(firstNumber)
        }
        else {
            secondNumber = secondNumber * -1
            displayOperation.text = String(secondNumber)
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if math == false {
            
            if sender.tag == 12 { //divide
                displayOperation.text = " / "
                action = " / "
                operation = 12
            }
            else if sender.tag == 13 {  //multiply
                displayOperation.text = " x "
                action = " x "
                operation = 13
            }
            else if sender.tag == 14 { //subtract
                displayOperation.text = " - "
                action = " - "
                operation = 14
            }
            else if sender.tag == 15 { //add
                displayOperation.text = " + "
                action = " + "
                operation = 15
            }
            
            digit = true
        }
            
        else if math == true && sender.tag == 16 {
            secondNumber = Double(displayOperation.text!)!
            displayOperation.text = String(firstNumber) + action + String(secondNumber)
            
            if operation == 12 {
                answer = firstNumber/secondNumber
                displayAnswer.text = String(answer)
                firstNumber = firstNumber/secondNumber
                math = false
            }
            else if operation == 13 {
                answer = firstNumber*secondNumber
                displayAnswer.text = String(firstNumber*secondNumber)
                firstNumber = firstNumber*secondNumber
                math = false
            }
            else if operation == 14 {
                answer = firstNumber-secondNumber
                displayAnswer.text = String(firstNumber-secondNumber)
                firstNumber = firstNumber-secondNumber
                math = false

            }
            else if operation == 15 {
                answer = firstNumber+secondNumber
                displayAnswer.text = String(firstNumber+secondNumber)
                firstNumber = firstNumber+secondNumber
                math = false

            }
        }
 
    }
    
    @IBAction func clear(_ sender: UIButton) {
        displayOperation.text = ""
        displayAnswer.text = ""
        firstNumber = 0
        secondNumber = 0
        operation = 0
        digit = false
        math = false
        action = ""
        answer = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //   Do any additional setup after loading the view;, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   //     Dispose of any resources that can be; recreated.
   }


}
