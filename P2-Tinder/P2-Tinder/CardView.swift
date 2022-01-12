//
//  CardView.swift
//  P2-Tinder
//
//  Created by Esther Huecas on 12/1/22.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    let course: Course
    
    var body: some View {
        Image(course.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .overlay(
                VStack {
                    Text(course.name)
                        .font(.system(.title, design: .rounded).bold())
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .padding([.top, .horizontal], 40),
                alignment: .top
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(course: coursesArray[0])
    }
}
