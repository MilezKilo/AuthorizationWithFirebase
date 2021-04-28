//
//  HomePage.swift
//  AuthorizationWithFirebase
//
//  Created by Майлс on 28.04.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomePage: View {
    
    var body: some View {
        
        VStack {
            
            Text("Welcome User!")
                .font(.title)
                .font(.headline)
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }) {
                Text("Log Out")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.init(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
            .clipShape(Capsule())
            .padding()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
