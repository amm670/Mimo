//
//  ViewController.swift
//  Mimo
//
//  Created by Alexandra Montgomery on 10/26/18.
//  Copyright © 2018 Alexandra Montgomery. All rights reserved.
//

import UIKit

class LessonScreenViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var seondLabel: UILabel!
    
    @IBOutlet weak var lessonNumberTitle: UILabel!
    @IBOutlet weak var runBtn: UIButton!
    
    
    var lessons: [Lesson]!
    var currentLessonIndex = 0
    

    
    
    @IBOutlet weak var restartBtn: UIButton!
    
    var expectedString = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupLesson()
        textField.addTarget(self, action: #selector(self.textFieldChanged(textField:)), for: .editingChanged)
    }

    func setupLesson() {
        let lesson = lessons[currentLessonIndex]
    
        lessonNumberTitle.text = ("Lesson \(lesson.id - 4)")
        print("Current lesson is: \(lesson)")
        
        let fullString = NSMutableAttributedString()
        for content in lesson.content {
            fullString.append(content.attributedString)
        }
        
        if let input = lesson.input {
            let firstString = fullString.attributedSubstring(from: NSRange(location: 0, length: input.startIndex))
            let secondString = fullString.attributedSubstring(from: NSRange(location: input.endIndex, length: fullString.length - input.endIndex))
            
            expectedString = fullString.attributedSubstring(from: NSRange(location: input.startIndex, length: input.endIndex -  input.startIndex)).string
            
            firstLabel.attributedText = firstString
            seondLabel.attributedText = secondString
            
            restartBtn.isHidden = true
            textField.isHidden = false
            seondLabel.isHidden = false
            runBtn.isEnabled = false
            
        } else {
            restartBtn.isHidden = true
            firstLabel.attributedText = fullString
            textField.isHidden = true
            seondLabel.isHidden = true
            runBtn.isEnabled = true
        }
    }
    
    @IBAction func gotToNextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < lessons.count {
            setupLesson()
        } else {
            lessonNumberTitle.text = "No more lessons"
            restartBtn.isHidden = true
            firstLabel.isHidden = true
            textField.isHidden = true
            seondLabel.isHidden = true
            runBtn.isEnabled = false
            runBtn.isHidden = true
        }
    }
    
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        // start over
        
    }
    
    @objc func textFieldChanged(textField: UITextField) {
        runBtn.isEnabled = textField.text == expectedString
    }
}


