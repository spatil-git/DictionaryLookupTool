//
//  LookupUserData.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/22/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import Foundation
final class LookupUserData:ObservableObject {
    @Published var navigated:Bool? = nil
    @Published var lookupWord = ""
    @Published var wordModel:WordDefinitionModel? = nil
}
