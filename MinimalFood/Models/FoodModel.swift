//
//  FoodModel.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 11/12/24.
//

import SwiftUI
import Foundation

struct FoodModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    let unlocked: Bool
    let requiredLevel: Int
    
    internal init(name: String, image: String, requiredLevel: Int, userLevel: Int) {
        self.name = name
        self.image = image
        self.unlocked = (userLevel >= requiredLevel)
        self.requiredLevel = requiredLevel
    }
}
