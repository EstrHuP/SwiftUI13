//
//  CardView.swift
//  Transitions-07
//
//  Created by Esther Huecas on 16/11/21.
//

import SwiftUI

struct CardView: View {
    
    var title: String
    var price: String?
    var subtitle: String?
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    var body: some View {
        
        VStack {
            
            icon.map({
                Image(systemName:$0)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
            
            Text(title)
                .font(.system(.title, design:.rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(price ?? "")
                .font(.system(size: 30, weight:.heavy, design:.rounded))
                .foregroundColor(textColor)
            
            Text(subtitle ?? "")
                .font(.headline)
                .foregroundColor(textColor)
            
        }
        .frame(minWidth:0, maxWidth: .infinity, minHeight: 100)
            .padding(30)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "prueba", textColor: .blue, backgroundColor: .pink)
    }
}
