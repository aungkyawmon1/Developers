//
//  ContentView.swift
//  Developers
//
//  Created by solinx on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - CONTENT
    
    var cards: [Card] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("iPhone 14")
    }
}
