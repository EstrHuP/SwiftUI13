//
//  CardView.swift
//  ScrollCardView-02
//
//  Created by Esther Huecas on 18/10/21.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var author: String
    var title: String
    var originalPrice: String
    var discountPrice: String
    
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(author)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(5)
                    HStack {
                        Text(discountPrice)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        Text(originalPrice)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .strikethrough() //tachar
                    }
                }
                .layoutPriority(10) //prioriza antes el cardview al spacer
                Spacer()
            }
            .padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 3)) //borde
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swift", author: "Juan Gabriel Gomila", title: "diseño de apps para ios13 con swiftui desde cero", originalPrice: "199.99$", discountPrice: "10.99$")
    }
}
