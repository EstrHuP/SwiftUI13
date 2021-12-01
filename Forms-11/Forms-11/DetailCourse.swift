//
//  DetailCourse.swift
//  Forms-11
//
//  Created by Esther Huecas on 1/12/21.
//

import SwiftUI

struct DetailCourse: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    var course: Course
    
    var body: some View {
        VStack {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(course.name)
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }
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

struct DetailCourse_Previews: PreviewProvider {
    static var previews: some View {
        DetailCourse(course: Course(name: "Android", image: "android-kotlin", type: "Android", priceLevel: 123))
    }
}
