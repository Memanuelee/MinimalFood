//
//  AddCalories.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 10/12/24.
//

import SwiftUI

struct AddCaloriesView: View {
    
    @EnvironmentObject var repository: TrashRepository
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("AddCalories")
        }
    }
}

#Preview {
    AddCaloriesView()
}
