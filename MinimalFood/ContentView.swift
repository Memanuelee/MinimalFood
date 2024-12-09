//
//  ContentView.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 50.0

    var minProgress = 0.0
    var maxProgress = 100.0

    var body: some View {
        VStack() {
            
            //Crei il cerchio dicendo dove deve prendere il valore da riferimento, in questo caso progress. .Animation(.linear) serve per quell'animazione ogni volta che sale o scende, l'errore giallo che fa riferimento è per dire che è presente una versione migliore del codice, ma anche così funziona.
            CircularProgressView(progress: self.progress / 100)
                .animation(.linear)

            //Testo se incompleto o maxato il cerchio, dopodiché barra del progresso dove è collegata con il cerchio. Non serve per l'uso del progresso ma è per testare se funziona il tutto, infatti sotto troverai i tasti per ulteriori test.
            VStack {
                if(progress == 100){
                    Text("Maxato")
                }else{
                    Text("Incompleto")
                }
                
                Text("Progress: \(progress, specifier: "%.1f")")
                Slider(value: $progress,
                       in: minProgress...maxProgress,
                       minimumValueLabel: Text("0"),
                       maximumValueLabel: Text("100")
                ) {}
            }
            .padding()
            
            
            //Alza di 10.
            Button(action: {
                progress += 10.0
            }) {
                Text("Alza")
            }
            .padding()
            
            //Abbassa di 10.
            Button(action: {
                progress += -10.0
            }) {
                Text("Abbassa")
            }
            .padding()

            Spacer()
        }
        .padding(20)
    }
}


//Dettaglia sul cerchio, quindi grandezza, colori e così via.
struct CircularProgressView: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray4), lineWidth: 20)
            Circle()
                .trim(from: 0, to: CGFloat(self.progress))
                .stroke(Color.blue, lineWidth: 20)
        }
        .rotationEffect(Angle(degrees: -90))
        .frame(width: 200, height: 200)
        .padding()
    }
}


#Preview {
    ContentView()
}
