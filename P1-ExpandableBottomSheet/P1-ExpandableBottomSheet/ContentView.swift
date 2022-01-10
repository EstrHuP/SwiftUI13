//
//  ContentView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Huecas on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showCourseDetail = false
    @State private var selectedCourse: Course?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(courses) { course in
                        BasicRow(course: course)
                            .onTapGesture {
                                self.showCourseDetail = true
                                self.selectedCourse = course
                            }
                    }
                }
                .navigationTitle("Online courses")
            }
            if showCourseDetail {
                
                BlanketView(color: .gray)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showCourseDetail = false
                    }
                
                self.selectedCourse.map {
                    CourseDetailView(course: $0)
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicRow: View {
    
    var course: Course
    
    var body: some View {
        HStack {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            Text(course.name)
        }
    }
}

struct BlanketView: View {
    
    var color: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
