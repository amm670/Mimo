//
//  LessonStorage+CoreDataProperties.swift
//  
//
//  Created by Alexandra Montgomery on 10/29/18.
//
//

import Foundation
import CoreData


extension LessonStorage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LessonStorage> {
        return NSFetchRequest<LessonStorage>(entityName: "LessonStorage")
    }

    @NSManaged public var id: String
    @NSManaged public var lessonEnd: NSDate?
    @NSManaged public var lessonStart: NSDate?

}
