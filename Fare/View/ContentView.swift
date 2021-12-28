//
//  ContentView.swift
//  Fare
//
//  Created by Jumman Hossen on 01/12/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State  var task: String = ""
    @State private var showNewTaskItem: Bool = false
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //MARK: - BODY

    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - MAIN VIEW
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .top, endPoint: .trailing)
                    .ignoresSafeArea()
                VStack {
                    // MARK: - HEADER
                    
                    
                    // MARK: -NEW TASK BUTRON
                    
                    VStack(spacing: 16){
                        
                        TextField("New Task", text: $task)
                            .padding()
                            .background(
                                Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                        
                        Button(action: {
                            addItem()
                        }, label: {
                            Spacer()
                            Text("Save")
                            Spacer()
                            
                        })
                        .disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.gray : Color.green)
                        .cornerRadius(10)
                        
                    }//: VStack
                    .padding()
                    
                    
                    List  {
                        ForEach(items) { item in
                            VStack{
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    
                                
                            }//:VStack
                        }//LIST ITEM
                        .onDelete(perform: deleteItems)
                     } //: LIST
                }//: VSTACK
                    
                //.navigationBarTitle("Daily Tasks", displayMode: .automatic )
                .toolbar{
                        // MARK: - HEADER
                        
                           // TITLE
                            ToolbarItem(placement: .navigationBarLeading){
                            Text("Fare")
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.heavy)
                                
                                .padding(.leading, 4)
                                .foregroundColor(.white)
                            }
                               
                            //Edit Button
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                        HStack{
                            EditButton()
                                .font(.system(size: 18 , weight: .semibold, design: .rounded))
                                .padding(10)
                                .frame(minWidth: 70, minHeight: 24)
                                .background(Capsule().stroke(Color.white, lineWidth: 2))
                            
                            //APPARANCE BUTTON
                            Button(action: {
                                isDarkMode.toggle()
                            }, label: {
                                Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .font(.system(.title, design: .rounded))
                            })
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                            
                
                        
            }
                    /*.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing ) {
                            EditButton()
                        }*/
                        /* ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: addItem) {
                                Label("Add Item", systemImage: "plus")
                            }
                        } */
                //}//: TOOLBAR
            }//: ZSTACK
            
            
            //Text("Select an item")
        }//: NAVIGATION
    }

    //MARK: - FUNCTION
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                 let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

    //MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
