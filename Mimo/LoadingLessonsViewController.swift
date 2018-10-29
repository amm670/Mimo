//
//  LoadingLessonsViewController.swift
//  Mimo
//
//  Created by Alexandra Montgomery on 10/29/18.
//  Copyright © 2018 Alexandra Montgomery. All rights reserved.
//

import UIKit


// MARK: ViewController for the pre-lesson screen
// Determines whether the lesson loaded properly

class LoadingLessonsViewController: UIViewController {
    
    
    @IBOutlet weak var loadingLessonsText: UILabel!
    
    @IBOutlet weak var startLessonsBtn: UIButton!
    
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lessons.loadLessons { result in
            switch result {
            case .error(let error):
                self.loadingLessonsText.text = error.localizedDescription
            case .success(let lessons):
                self.lessons = lessons
                self.startLessonsBtn.isEnabled = true
                self.loadingLessonsText.text = "Loaded \(lessons.count) lessons"
            }
        }
    }
    

    // MARK: - Navigation
    
    // Simple Prepare for Segue that preps the lesson
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? LessonScreenViewController {
            vc.lessons = lessons
        }
    }
    
}
