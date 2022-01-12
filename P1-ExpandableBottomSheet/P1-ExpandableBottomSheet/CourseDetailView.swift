//
//  CourseDetailView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Huecas on 10/1/22.
//

import SwiftUI

struct CourseDetailView: View {
    
    @GestureState private var dragState = DragState.none
    @State private var offset: CGFloat = 0
    @State private var cardState = CardState.half
    @Binding var isShown: Bool
    
    var course: Course
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HandleBar()
                
                TitleBar(titleText: "Course's detail")
                
                ScrollView(.vertical) {
                    HeaderView(course: course)
                    
                    DescriptionView(icon: "dollarsign.circle.fill", content: "\(course.priceLevel)")
                        .padding(.top)
                    DescriptionView(icon: nil, content: course.description)
                }
                .animation(nil)
                .disabled(self.cardState == .half || self.dragState.isDragging)
            }
            .background(Color.white)
            .cornerRadius(15, antialiased: true) //antialiased para que no parezca pixelado
            .offset(y: geometry.size.height*0.3 + self.dragState.translation.height + self.offset) //Calcular tamaño pantalla
            .animation(.interpolatingSpring(stiffness: 200, damping: 50, initialVelocity: 10))
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                .updating(self.$dragState) { (value, state, transaction) in
                state = DragState.dragging(translation: value.translation)
            }
                .onEnded({ (value) in
                switch self.cardState {
                case .half:
                    //umbral superior, si es superado, transicion a estado full
                    if value.translation.height < -0.25*geometry.size.height {
                        self.offset = -0.4*geometry.size.height+0.2*geometry.size.height
                        self.cardState = .full
                    }
                    //umbral superior, si es superado, ocultar la vista
                    if value.translation.height > 0.25*geometry.size.height {
                        self.isShown = false
                    }
                case .full:
                    //umbral pequeño, si es superado, transicion estado half
                    if value.translation.height > 0.25*geometry.size.height {
                        self.offset = 0
                        self.cardState = .half
                    }
                    //umbral grande, si es superado, ocultar la card
                    if value.translation.height > 0.75*geometry.size.height {
                        self.isShown = false
                    }
                }
            })
            )
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(isShown: .constant(true), course: courses[0])
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

enum CardState {
    case half
    case full
}
