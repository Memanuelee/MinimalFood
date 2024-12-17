//
//  Collection.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 09/12/24.
//

import SwiftUI

struct CollectionView: View {
    
    @Environment(FoodRepository.self) var repository

    private var data  = Array(1...20)
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .fill(Color("greennew"))
                    .overlay {
                        Capsule()
                            .stroke(Color("greenborder"), lineWidth: 3)
                    }
                    .padding(7)
                    .frame(width: .infinity, height: 80)
                
                Text("Collection")
                    .font(.system(size: 26))
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding()
            
            ScrollView{
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(repository.kitchen.indices, id: \.self) { index in
                        let food = repository.kitchen[index]
                        
                        VStack(spacing: -7) {
                            ZStack {
                                Rectangle()
                                    .fill(Color("purplenew"))
                                    .brightness(0.2)
                                    .overlay {
                                        Rectangle()
                                            .stroke(Color("purpleborder"), lineWidth: 3)
                                    }
                                    .frame(width: 160, height: 160)
                                
                                if(food.unlocked == true) {
                                    Image(food.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130, height: 130)
                                        .accessibilityLabel(Text("Food"))
                                } else {
                                    Rectangle()
                                        .fill(Color("purpleborder"))
                                        .mask {
                                            Image(food.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 130, height: 130)
                                        }
                                        .accessibilityLabel(Text("Hidden food image"))
                                }
                            }
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color("purplenew"))
                                    .overlay {
                                        Rectangle()
                                            .stroke(Color("purpleborder"), lineWidth: 3)
                                    }
                                    .padding(2)
                                    .frame(width: .infinity, height: 40)
                                
                                if(food.unlocked == true) {
                                    Text(food.name)
                                        .font(.system(size: 18))
                                        .foregroundStyle(.white)
                                } else {
                                    Text("???")
                                        .font(.system(size: 18))
                                        .foregroundStyle(.white)
                                        .accessibilityLabel(Text("Hidden food name"))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(
            ZStack {
                Color("background")
                    .ignoresSafeArea()
            }
        )
    }
}
