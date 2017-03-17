//
//  Movie.swift
//  TenorCodingChallenge
//
//  Created by Cameron Moss on 3/16/17.
//  Copyright © 2017 Cameron Moss. All rights reserved.
//

import Foundation

class Movie {
    
    private let kID = "id"
    private let kName = "name"
    private let kImage = "image"
    private let kDesc = "desc"
    private let kLongDesc = "long_desc"
    
    var id: Int
    var name: String = ""
    var image: String = ""
    var desc: String = ""
    var longDesc: String = ""
    var isFavorite: Bool = false
    
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let id = jsonDictionary[kID] as? Int else { return nil }
        self.id = id
        self.name = jsonDictionary[kName] as? String ?? ""
        self.image = jsonDictionary[kImage] as? String ?? ""
        self.desc = jsonDictionary[kDesc] as? String ?? ""
        self.longDesc = jsonDictionary[kLongDesc] as? String ?? ""
        
    }
    
    
}
