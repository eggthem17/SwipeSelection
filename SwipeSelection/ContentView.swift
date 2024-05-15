//
//  ContentView.swift
//  SwipeSelection
//
//  Created by MinKyu CHA on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    private var people: [String] = ["Mario", "Luigi", "Peach", "Toad", "Daisy"]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(people, id: \.self) { person in
                    CardView(person: person)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
