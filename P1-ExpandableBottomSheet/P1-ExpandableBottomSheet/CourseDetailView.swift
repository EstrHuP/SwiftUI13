//
//  CourseDetailView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Huecas on 10/1/22.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HandleBar()
                
                TitleBar(titleText: "Course's detail")
                
                ScrollView(.vertical) {
                    HeaderView(course: course)
                    
                    DescriptionView(icon: "dollarsign.circle.fill", content: "\(course.priceLevel)")
                        .padding(.top)
                    DescriptionView(icon: nil, content: course.description)
                }
            }
            .background(Color.white)
            .cornerRadius(15, antialiased: true) //antialiased para que no parezca pixelado
            .offset(y: geometry.size.height*0.3) //Calcular tamaño pantalla
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0])
            .background(Color.gray.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 70, height: 8)
            .foregroundColor(Color(.systemGray4))
            .cornerRadius(8)
            .padding()
    }
}

struct TitleBar: View {
    var titleText: String
    var body: some View {
        Text(titleText)
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
    }
}

struct HeaderView: View {
    
    var course: Course
    
    var body: some View {
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(course.name)
                            .font(.system(.title, design: .rounded).bold())
                            .foregroundColor(.white)
                        Text(course.type)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.purple)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
                .padding()
            )
    }
}

struct DescriptionView: View {
    
    var icon: String?
    var content: String
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            Spacer()
        }.padding(.horizontal)
    }
}
