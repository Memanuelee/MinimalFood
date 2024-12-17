//
//  FoodRepository.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 11/12/24.
//

import SwiftUI


@Observable
class FoodRepository {
    
    static var allFood: [FoodModel] {
        return [
            FoodModel(name: "Satisfied Spaghetti", image: "satisfiedspaghetti", requiredLevel: 1, userLevel: userLevel),
            FoodModel(name: "Angry Pepper", image: "angrypepper", requiredLevel: 2, userLevel: userLevel),
            FoodModel(name: "R E A L Pizza", image: "realpizza", requiredLevel: 3, userLevel: userLevel),
            FoodModel(name: "Karate Potato", image: "karatepotato", requiredLevel: 4, userLevel: userLevel),
            FoodModel(name: "KAWAII Sushi", image: "kawaiisushi", requiredLevel: 5, userLevel: userLevel),
            FoodModel(name: "Living Bread", image: "livingbread", requiredLevel: 6, userLevel: userLevel)
        ]
    }
    
    var kitchen: [FoodModel] = FoodRepository.allFood
    var progress: Double = FoodRepository.calculateProgress()
    
    @UserDefault(key: "caloryTarget", defaultValue: 200)
    private(set) static var caloryTarget: Int
    
    @UserDefault(key: "caloryProgress", defaultValue: 0)
    private(set) static var caloryProgress: Int
    
    @UserDefault(key: "userLevel", defaultValue: 0)
    private(set) static var userLevel: Int
    
    @UserDefault(key: "lastUpdate", defaultValue: .now)
    private(set) static var lastUpdate: Date
    
    func addNewCaloryTarget(target: Int) {
        FoodRepository.caloryTarget = target
    }
    
    func addProgress(calories: Int) {
        let previousProgress = FoodRepository.caloryProgress
        FoodRepository.caloryProgress += calories
        progress = FoodRepository.calculateProgress()
        
        if previousProgress < FoodRepository.caloryTarget && FoodRepository.caloryProgress >= FoodRepository.caloryTarget {
            FoodRepository.userLevel += 1
            kitchen = FoodRepository.allFood.map { food in
                return FoodModel(name: food.name, image: food.image, requiredLevel: food.requiredLevel, userLevel: FoodRepository.userLevel)
            }
        }
    }
    
    func resetProgress() {
        FoodRepository.caloryProgress = 0
        progress = FoodRepository.calculateProgress()
    }
    
    func update() {
        guard !Calendar.current.isDate(FoodRepository.lastUpdate, inSameDayAs: .now) else { return }
        FoodRepository.lastUpdate = .now
        
        guard FoodRepository.caloryProgress >= FoodRepository.caloryTarget else { return }
        resetProgress()
    }
    
    private static func calculateProgress() -> Double {
        let progress = (Double(FoodRepository.caloryProgress) * 100) / Double(FoodRepository.caloryTarget)
        return min(progress, 100)
    }
}
