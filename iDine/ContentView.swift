//
//  ContentView.swift
//  iDine
//
//  Created by Brandon Johns on 8/25/23.
//
// some View: is an opaque return type. it means sone specfic view but doesnt matter which one.

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items){ item in
                            // makes NaviLink hashable so its less work to load each item
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                //where to go when some item is triggered
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)

        }
    }
    //end ContentView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
