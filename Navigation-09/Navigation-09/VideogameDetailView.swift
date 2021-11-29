//
//  VideogameDetailView.swift
//  Navigation-09
//
//  Created by Esther Huecas on 25/11/21.
//

import SwiftUI

struct VideogameDetailView: View {
    @Environment(\.presentationMode) var presentationMode
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
        //        .navigationBarTitle("", displayMode: .inline)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
            //Navegar a la pantalla previa
                self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .foregroundColor(.white)
        }))
    }
}

struct VideogameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideogameDetailView(videogame: Videogame(name: "Dead Cells", image: "dead-cells"))
    }
}
