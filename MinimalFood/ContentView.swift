//
//  ContentView.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var repository = FoodRepository()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("greennew"))
                        .stroke(Color("greenborder"), lineWidth: 3)
                        .ignoresSafeArea()
                    
                    Text(Date.now.formatted(date: .complete, time: .omitted))
                        .font(.system(size: 26))
                        .bold()
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                VStack {
                    if repository.progress >= 100 {
                        ZStack {
                            RadialGradient(
                                gradient: Gradient(colors: [.yellow, Color("background")]),
                                center: .center,
                                startRadius: 1,
                                endRadius: 130
                            )
                            
                            CircularProgress(progress: repository.progress / 100)
                                .animation(.linear, value: repository.progress)
                                .accessibilityLabel(Text("Circular progress: \(repository.progress, specifier: "%.0f%%")"))
                            
                            Image(repository.kitchen[FoodRepository.userLevel - 1].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .accessibilityLabel(Text("Goal food"))
                        }
                        
                        Text(repository.kitchen[FoodRepository.userLevel - 1].name)
                            .font(.system(size: 24))
                            .bold()
                            .accessibilityLabel(Text("\(repository.kitchen[FoodRepository.userLevel - 1].name)"))
                    } else {
                        ZStack {
                            CircularProgress(progress: repository.progress / 100)
                                .animation(.linear, value: repository.progress)
                                .accessibilityLabel(Text("Circular progress: \(repository.progress, specifier: "%.0f%%")"))
                            
                            Rectangle()
                                .fill(Color("purpleborder"))
                                .mask{
                                    Image(repository.kitchen[FoodRepository.userLevel].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 250, height: 250)
                                }
                                .accessibilityLabel(Text("Hidden goal food image"))
                        }
                        
                        Text("???")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(Color("greenborder"))
                            .accessibilityLabel(Text("Hidden goal food name"))
                    }
                }
                
                Spacer()
                
                Text("Progress: \(repository.progress, specifier: "%.0f%%")")
                
                if FoodRepository.caloryTarget > 300 && (FoodRepository.caloryTarget - FoodRepository.caloryProgress) > 0 {
                    Text("Missing Calories: \(FoodRepository.caloryTarget - FoodRepository.caloryProgress)")
                }
                
                Divider()
                    .padding()
                
                MotivationalPhrases(progress: repository.progress)
                
                Spacer()
                
                HStack {
                    Button {
                        repository.resetProgress()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("purplenew"))
                                .stroke(Color("purpleborder"), lineWidth: 3)
                                .frame(width: 70, height: 70)
                            
                            if repository.progress == 100 {
                                Image(systemName: "circle.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(.white)
                                    .accessibilityLabel(Text("Reset progress"))
                            } else {
                                Image(systemName: "arrow.trianglehead.clockwise")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(.white)
                                    .accessibilityLabel(Text("Reset progress"))
                            }
                        }
                    }
                    .disabled(repository.progress == 100)
                    
                    Spacer()
                    
                    if FoodRepository.caloryTarget > 300 {
                        NavigationLink {
                            AddCaloriesView().environment(repository)
                        } label: {
                            ZStack {
                                Capsule()
                                    .fill(Color("purplenew"))
                                    .stroke(Color("purpleborder"), lineWidth: 3)
                                    .frame(width: 140, height: 70)
                                
                                if repository.progress == 100 {
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                        .foregroundStyle(.white)
                                        .accessibilityLabel(Text("Goal reached"))
                                } else {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                        .foregroundStyle(.white)
                                        .accessibilityLabel(Text("Add calories"))
                                }
                            }
                        }
                        .disabled(repository.progress == 100)
                    } else {
                        NavigationLink {
                            SelectTargetView().environment(repository)
                        } label: {
                            ZStack {
                                Capsule()
                                    .fill(Color("purplenew"))
                                    .stroke(Color("purpleborder"), lineWidth: 3)
                                    .frame(width: 140, height: 70)
                                
                                Image(systemName: "play")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(.white)
                                    .accessibilityLabel(Text("Start goal"))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        CollectionView().environment(repository)
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("purplenew"))
                                .stroke(Color("purpleborder"), lineWidth: 3)
                                .frame(width: 70, height: 70)
                            
                            Image(systemName: "trophy.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.yellow)
                        }
                        .accessibilityLabel(Text("Collection"))
                    }
                    
                }
                .padding()
                .background(
                    Capsule()
                        .fill(Color("greennew"))
                        .overlay {
                            Capsule()
                                .stroke(Color("greenborder"), lineWidth: 3)
                        }
                        .padding(7)
                )
            }
            .background(
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                }
                    .accessibilityLabel(Text("Background"))
            )
        }
        .onAppear {
            repository.update()
        }
    }
}

#Preview {
    ContentView()
}
