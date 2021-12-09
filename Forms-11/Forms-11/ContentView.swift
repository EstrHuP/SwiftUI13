//
//  ContentView.swift
//  Forms-11
//
//  Created by Esther Huecas on 30/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var listCourses = [
        Course(name: "Aprende a programar en Android con Kotlin", image: "android-kotlin", type: "Mobile", priceLevel: 3),
        Course(name: "Machine Learning de A a la Z: R y Python para Data Science", image: "machine-learning", type: "Data", priceLevel: 4, featured: true),
        Course(name: "Curso completo de Python de la A a la Z - 2021 +50 horas", image: "python", type: "Data", priceLevel: 2),
        Course(name: "Curso de desarrollo de videojuegos con Unity 2021", image: "unity-2021", type: "Videogames", priceLevel: 2, featured: true),
        Course(name: "Desarrollo de juegos con Unreal Engine de 0 a profesional", image: "unreal", type: "Videogames", priceLevel: 4, purchased: true),
        Course(name: "Ciencia de datos con MySQL, RStudio y Power BI: Casos Reales", image: "mysql", type: "DataBase", priceLevel: 1, featured: true, purchased: true),
        Course(name: "Aprende C# creando un juego en Unity 5: de cero a experto", image: "c#", type: "Videogames", priceLevel: 2),
    ]
    
    //List of courses
    @State var selectedCourse: Course?
    //Navigation
    @State private var navigationLinkActive = false
    
    var body: some View {
        
        NavigationView {

            List {
                
                ForEach(listCourses) { course in
                    
                    if navigationLinkActive {
                        NavigationLink("", destination: DetailCourse(course: course), isActive: $navigationLinkActive)
                    }
                    
                    ZStack {
                        
                        CourseImageRoundView(course: course)
                        
                            .contextMenu {
                                
                                //Buy Button
                                Button(action: {
                                    self.setPurchased(item: course)
                                }) {
                                    HStack {
                                        course.purchased == true ? Text("Buy") : Text("Return")
                                        course.purchased == true ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "checkmark.circle")
                                    }
                                }
                                
                                //Destacado
                                Button(action: {
                                    self.setFeatured(item: course)
                                }) {
                                    HStack {
                                        course.featured == true ? Text("Remove to favorite") : Text("Mark to favorite")
                                        course.featured == true ? Image(systemName: "star.fill") : Image(systemName: "star")
                                    }
                                }
                                
                                //Delete Button
                                Button(action: {
                                    self.deleteItem(item: course)
                                }) {
                                    HStack {
                                        Text("Remove")
                                        Image(systemName: "trash")
                                    }
                                }
                            }

                            .onTapGesture {
                                self.selectedCourse = course
                            }

                            .actionSheet(item: self.$selectedCourse) { course in

                                ActionSheet(
                                    title: Text("Choose the option"),
                                    message: nil,
                                    buttons: [
                                        .default(
                                            course.purchased == true ? Text("Return") : Text("Buy"), action: {
                                                self.setPurchased(item: course)
                                            }),
                                        .destructive(Text("Remove course"), action: {
                                            self.deleteItem(item: course)
                                        }),
                                        .default(Text("Go to Detail View"), action: {
                                            navigationLinkActive = true
                                        }),
                                        .cancel()
                                    ])
                            }
                    }
                }
                .onDelete { (indexSet) in
                    self.listCourses.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Cursos online", displayMode: .automatic)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    private func setFeatured(item course: Course) {
        if let index = self.listCourses.firstIndex(where: {$0.id == course.id}) {
            self.listCourses[index].featured.toggle()
        }
    }
    
    private func setPurchased(item course: Course) {
        if let index = self.listCourses.firstIndex(where: {$0.id == course.id}) {
            self.listCourses[index].purchased.toggle()
        }
    }

    private func deleteItem(item course: Course) {
        if let index = self.listCourses.firstIndex(where: {$0.id == course.id}) {
            self.listCourses.remove(at: index)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CourseImageRoundView: View {
    var course: Course
    var body: some View {
        HStack {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(course.name)
                        .font(.system(.body, design: .rounded).bold())
                    
                    Text(String(repeating: "€", count: course.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(course.type)
                    .font(.system(.subheadline, design: .rounded).bold())
                    .foregroundColor(.secondary)
            }
            Spacer().layoutPriority(-10)
            
            if course.featured {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            if course.purchased {
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}
