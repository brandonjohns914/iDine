//
//  iDineApp.swift
//  iDine
//
//  Created by Brandon Johns on 8/25/23.
//

import SwiftUI

//@StateObject keeps the view alive as long as the app is running
//      states that my data is changed relaunch me
//      keeps the object up to date 
// requires Order() to be ObservableObject


// order will stay now even if the view is destoried and recreated
// order also gets created before hte body is run and before ContentView is created

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
