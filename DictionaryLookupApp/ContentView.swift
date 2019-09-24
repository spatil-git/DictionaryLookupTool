//
//  ContentView.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/14/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // To share the model between views.
    @EnvironmentObject private var lookupUserData: LookupUserData
    @State private var lookupFailed = false
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    TextField(/*@START_MENU_TOKEN@*/"Type word..."/*@END_MENU_TOKEN@*/, text: $lookupUserData.lookupWord)
                    // Pass the model to the child view.
                    NavigationLink(destination:  WordDefinitionView().environmentObject(self.lookupUserData),
                                   tag: true,
                                   selection: $lookupUserData.navigated) {
                                    Button(action: {
                                        let dictLookup = DictionaryLookup(word: self.lookupUserData.lookupWord)
                                        dictLookup.startLookup { (result:[String:String]?, error:Error?) in
                                            if let resultStr = result {
                                                let data = resultStr["Meaning"]!.data(using: .utf8)
                                                var wordDefinitonModel:WordDefinitionModel? = nil
                                                do {
                                                    wordDefinitonModel = try JSONDecoder().decode(WordDefinitionModel.self, from: data!)
                                                    print("\(wordDefinitonModel!)")
                                                } catch  {
                                                    print("Failed to form the word model:\(error)")
                                                    return
                                                }
                                                DispatchQueue.main.async {
                                                    self.lookupUserData.navigated = true
                                                    self.lookupUserData.wordModel = wordDefinitonModel
                                                }
                                            } else {
                                                DispatchQueue.main.async {
                                                    self.lookupUserData.navigated = false
                                                    self.lookupFailed = true
                                                }
                                            }
                                        }
                                    }) {
                                        Text("Lookup")
                                    }
                    }.alert(isPresented: self.$lookupFailed) { () -> Alert in
                        Alert(title: Text("Lookup failed"),
                            message: Text("\(self.lookupUserData.lookupWord) : Lookup failed"), dismissButton: nil)
                    }
                }.navigationBarTitle("Word Lookup").foregroundColor(Color.orange)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
