//
//  DictionaryLookup.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/15/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import Foundation
import SwiftPackageWordLookup

class DictionaryLookup {
    let word:String?
    init(word:String) {
        self.word = word
    }
    
    func startLookup(completionHandler:@escaping ((Dictionary<String, String>?, Error?)->Void))  {
        #error("Invalid App Key and App ID")
        let swiftDictLookup:SwiftPackageWordLookup = SwiftPackageWordLookup(appKey:"app_key",appID:"app_id")
        swiftDictLookup.lookupWord(word: word!) { (meaning:String?, error:Error?) in
            guard error == nil else {
                print("Failed to lookup word : \(self.word!)")
                completionHandler(nil, nil)
                return
            }
            completionHandler(["Meaning":meaning!], nil)
        }
    }
}
