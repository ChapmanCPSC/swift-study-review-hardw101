//
//  ViewController.swift
//  Assignment 3
//
//  Created by Chris Hardwick on 3/30/16.
//  Copyright (c) 2016 Chris Hardwick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //set a variable to track the time
    var count = 0
    
    //set a timer
    var timer = NSTimer()
    
    //set an array with all the swift study words
    var studyWords: [String] = ["Let vs Var", "Computed Initializers", "Computed Variables", "Setter Observers", "Functions", "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers", "Casting", "Class Methods", "Extensions", "Enumerations", "Error Handling", "Dictionaries", "Conditional Binding", "Protocals", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Enumeration"]
    
    //set both labels as outlets
    @IBOutlet var countDown: UILabel!
    
    @IBOutlet var studyLabel: UILabel!
    
    //set an action to occur on button click
    @IBAction func start(sender: AnyObject) {
        
        //stops the timer in case it was already running
        timer.invalidate()
        
        //sets the text in the countDown label to 0
        countDown.text = "0"
        
        //resets the count variable to 0
        count = 0
        
        //initializes the timer. scheduledTimer will run the Counting function every 1 second
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        
        //run function to change the text in the studyLabel
        changeWord()
        
    }
    
    //function to track time and update the countDown label
    func Counting(){
        //everytime this function runs (once a second), count increments
        count += 1
        
        //everytime count increments, the new number is displayed in the countDown label
        countDown.text  = "\(count)"
        
        //if statement to cap the timer at 30 seconds. when count exceeds 30, it is reset and the changeWord function is called
        if count > 29{
            changeWord()
            count = 0
        }
    }
    
    //function to change the studyLabel text to a random array value
    func changeWord(){
        //produces a random number between 0 and 23
        let randomNumber = Int(arc4random_uniform(24))
        
        //changes the studyLabel text to the array value that correlates with the random number
        studyLabel.text = studyWords[randomNumber]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

