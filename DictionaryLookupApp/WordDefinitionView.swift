//
//  WordDefinitionView.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/17/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import SwiftUI

struct WordDefinitionView: View {
    @EnvironmentObject var lookupData: LookupUserData
        
    var body: some View {
        VStack {
            Text(self.lookupData.lookupWord)
            List {
                WordDefinitionRowView(key:"Meaning", value: self.lookupData.wordModel!.results[0].lexicalEntries[0].entries[0].senses[0].meanings![0])
                WordDefinitionRowView(key:"Example", value: self.lookupData.wordModel!.results[0].lexicalEntries[0].entries[0].senses[0].examples![0].text)
            }
        }
    }
}

struct WordDefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        WordDefinitionView()
    }
}
