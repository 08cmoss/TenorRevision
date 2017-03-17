//
//  MovieController.swift
//  TenorCodingChallenge
//
//  Created by Cameron Moss on 3/16/17.
//  Copyright © 2017 Cameron Moss. All rights reserved.
//

import Foundation

class MovieController {
    
    static func getUserMovies() -> [Movie] {
        var movies = [Movie]()
        if let path = Bundle.main.path(forResource: "Films-user", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResultArray: NSArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    
                    if let resultsArray : [NSDictionary] = jsonResultArray as? [NSDictionary] {
                        for resultDictionary: NSDictionary in resultsArray {
                            
                            if let movie = Movie(jsonDictionary: resultDictionary as! [String : AnyObject]) {
                                movies.append(movie)
                            }
                        }
                    }
                }
            } catch {}
        }
        return movies
    }
    
    static func getCriticMovies() -> [Movie] {
        var movies = [Movie]()
        if let path = Bundle.main.path(forResource: "Films-critic", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResultArray: NSArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    
                    if let resultsArray : [NSDictionary] = jsonResultArray as? [NSDictionary] {
                        for resultDictionary: NSDictionary in resultsArray {
                            
                            if let movie = Movie(jsonDictionary: resultDictionary as! [String : AnyObject]) {
                                movies.append(movie)
                            }
                        }
                    }
                }
            } catch {}
        }
        return movies
    }
}
