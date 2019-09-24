//
//  WordDefinitionRowView.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/17/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import SwiftUI

struct WordDefinitionRowView: View {
    var key:String
    var value:String
    var body: some View {
        HStack {
            Text("\(key)").padding(10).font(.subheadline).foregroundColor(Color.orange)
            Text("\(value)").fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct WordDefinitionRowView_Previews: PreviewProvider {
    static var previews: some View {
        WordDefinitionRowView(key: "Meaning", value: "Meaning Value")
    }
}
