//
//  CardModel.swift
//  Developers
//
//  Created by solinx on 28/09/2023.
//

import SwiftUI

// MARK: - CardModel

struct Card: Identifiable {
    var id = UUID()
    var title : String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
