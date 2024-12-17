//
//  MotivationalPhrases.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 15/12/24.
//

import SwiftUI

struct MotivationalPhrases: View {
    var progress: Double
    
    var body: some View {
        switch progress {
        case 0...24.9:
            Text("3, 2, 1... Go!\nLet’s eat something!\n")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
        case 25...49.9:
            Text("You’re doing great,\nkeep it up!\n")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
        case 50...74.9:
            Text("Good job,\nwe’re halfway through!\n")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
        case 75...99.9:
            Text("It’s getting closer and closer,\ndon’t give up now!\n")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
        case 100:
            Text("_Congratulations!\nCome back tomorrow for the next food!_\n")
                .font(.system(size: 20))
                .bold()
                .multilineTextAlignment(.center)
            
        default:
            Text("")
        }
    }
}
