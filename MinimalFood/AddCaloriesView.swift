//
//  AddCalories.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 10/12/24.
//

import SwiftUI

struct AddCaloriesView: View {
    
    @Environment(FoodRepository.self) var repository
    @Environment(\.dismiss) var dismiss
    @State var insertedCalories = 0
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
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
                    
                    Text("Insert calories")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding()
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(Color("greennew"))
                            .stroke(Color("greenborder"), lineWidth: 3)
                            .frame(width: 200, height: 70)
                        
                        Text("Do you want to\nchange the target?")
                            .bold()
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    NavigationLink {
                        SelectTargetView()
                            .environment(repository)
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("purplenew"))
                                .stroke(Color("purpleborder"), lineWidth: 3)
                                .frame(width: 200, height: 60)
                            
                            Image(systemName: "pencil.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .foregroundStyle(.white)
                        }
                    }
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(Color("greennew"))
                            .stroke(Color("greenborder"), lineWidth: 3)
                            .frame(width: 140, height: 70)
                        
                        Text("Target\n\(FoodRepository.caloryProgress)/\(FoodRepository.caloryTarget)")
                            .bold()
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .accessibilityLabel(Text("Target\n\(FoodRepository.caloryProgress) on \(FoodRepository.caloryTarget)"))
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("purplenew"))
                            .stroke(Color("purpleborder"), lineWidth: 3)
                            .frame(width: 140, height: 70)
                        
                        TextField("", value: $insertedCalories, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 140, height: .infinity)
                    }
                    
                    HStack {
                        if insertedCalories > 0 {
                            Button {
                                repository.addProgress(calories: insertedCalories)
                                dismiss()
                            } label: {
                                ZStack {
                                    Capsule()
                                        .fill(Color("purplenew"))
                                        .stroke(Color("purpleborder"), lineWidth: 3)
                                        .frame(width: 140, height: 70)
                                    
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                        .foregroundStyle(.white)
                                }
                                .accessibilityLabel(Text("Confirm quantity of calories"))
                            }
                        } else {
                            ZStack {
                                Capsule()
                                    .fill(Color("purplenew"))
                                    .stroke(Color("purpleborder"), lineWidth: 3)
                                    .frame(width: 140, height: 70)
                                
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(.white)
                            }
                            .accessibilityLabel(Text("Insert a valid number"))
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AddCaloriesView()
}
