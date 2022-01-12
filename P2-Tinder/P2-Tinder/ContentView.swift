//
//  ContentView.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarView()
            CardView(course: coursesArray[0])
            BottomBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .padding(15)
    }
}

struct BottomBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Comprar el curso")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(15)
            
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .padding(15)
    }
}
