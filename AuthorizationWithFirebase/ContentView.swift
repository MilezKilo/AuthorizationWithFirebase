//
//  ContentView.swift
//  AuthorizationWithFirebase
//
//  Created by Майлс on 27.04.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        VStack {
            
            if status {
                
                HomePage()
            } else {
                
                SignIn()
            }
        }
        .animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
