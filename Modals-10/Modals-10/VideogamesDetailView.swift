//
//  VideogamesDetailView.swift
//  Modals-10
//
//  Created by Esther Huecas on 29/11/21.
//

import SwiftUI

struct VideogameDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    var videogame: Videogame
    
    var body: some View {
        VStack {
            Image(videogame.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(videogame.name)
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
        )
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Warning!"),
                message: Text("Are you sure to close this window?"),
                primaryButton: .default(Text("Yes"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                secondaryButton: .cancel(Text("No")))
        }
    }
}

struct VideogameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideogameDetailView(videogame: Videogame(name: "Dead Cells", image: "dead-cells"))
    }
}
