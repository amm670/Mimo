////
////  LessonTracker.swift
////  Mimo
////
////  Created by Alexandra Montgomery on 10/29/18.
////  Copyright © 2018 Alexandra Montgomery. All rights reserved.
////
//
//import UIKit
//
//class LessonTracker {
//    
//    private let lessons : [Lesson]
//    private var lessonIndex = 0
//    private var lessonStartDate : Date!
//    
//    weak var delegate : LessonTrackerDelegate?
//    
//    private init(lessons : [Lesson], delegate : LessonTrackerDelegate?) {
//        self.lessons = lessons
//        self.delegate = delegate
//    }
//    
//    // Flow
//    static func showFlow(with lessons : [Lesson], delegate : LessonTrackerDelegate? = nil) throws -> LessonTracker {
//        guard let firstLesson = lessons.first else {
//            fatalError()
//        }
//        
//        let lessonTracker = LessonTracker(lessons : lessons, delegate : delegate)
//        lessonTracker.showLesson(firstLesson)
//        return lessonTracker
//    }
//    
//    //updating
//    fileprivate func showLesson(_ lesson : Lesson, animated : Bool = true) {
//        // fill this
//    }
//}
//
//extension LessonTracker {
//    func pressedNextBtn(_ )
//}
