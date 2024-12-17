//
//  SelectTargetView.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 16/12/24.
//

import SwiftUI

struct SelectTargetView: View {
    
    @Environment(FoodRepository.self) var repository
    @Environment(\.dismiss) var dismiss
    @State var insertedCaloryTarget = 0
    
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
                    
                    Text("Insert Target")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding()
                
                Spacer()
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(Color("greennew"))
                            .stroke(Color("greenborder"), lineWidth: 3)
                            .frame(width: 140, height: 70)
                        
                        Text("Choose\na number")
                            .bold()
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("purplenew"))
                            .stroke(Color("purpleborder"), lineWidth: 3)
                            .frame(width: 140, height: 70)
                        
                        TextField("", value: $insertedCaloryTarget, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 140, height: .infinity)
                    }
                    
                    HStack {
                        if insertedCaloryTarget > 0 {
                            Button {
                                repository.addNewCaloryTarget(target: insertedCaloryTarget)
                                repository.resetProgress()
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
                                .accessibilityLabel(Text("Confirm number"))
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
    SelectTargetView()
}
