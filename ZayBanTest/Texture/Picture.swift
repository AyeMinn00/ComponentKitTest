//
//  Picture.swift
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

import Foundation
import AsyncDisplayKit

@objc class Picture : NSObject , ListDiffable{
    
    let id : String
    let imageUrl : URL
    
    @objc public init(id : String , url : URL){
        self.id = id
        self.imageUrl = url
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Picture else {
            return false
        }
        return id == object.id
    }
    
}



