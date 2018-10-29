//
//  Lessons.swift
//  Mimo
//
//  Created by Alexandra Montgomery on 10/26/18.
//  Copyright © 2018 Alexandra Montgomery. All rights reserved.
//

import UIKit

enum Result<T> {
    case success(T)
    case error(Error)
}

class Lessons {
    
    // Mimo API URL
    static let url = URL(string: "https://mimochallenge.azurewebsites.net/api/lessons")!
    
    static func loadLessons(completion: @escaping (Result<[Lesson]>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, err in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.error(err))
                } else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(LessonResponse.self, from: data)
                        completion(.success(response.lessons))
                    } catch {
                        completion(.error(error))
                    }
                }
            }
        }
        dataTask.resume()
    }
}


fileprivate struct LessonResponse: Codable {
    let lessons: [Lesson]
}

struct Lesson : Codable {
    typealias ID = Int
    
    var id: ID
    let content: [Content]
    let input : Input?
    
    struct Content : Codable {
        let color : String
        let text : String
        
        var attributedString: NSAttributedString {
            return NSAttributedString(string: text,
                                      attributes: [.foregroundColor: UIColor.newFrom(hexString: color)!])
        }
    }
    
    struct Input : Codable {
        let startIndex : Int
        let endIndex : Int
    }
}



