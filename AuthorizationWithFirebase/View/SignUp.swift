//
//  SignUp.swift
//  AuthorizationWithFirebase
//
//  Created by Майлс on 28.04.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUp: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @Binding var show : Bool
    
    var body: some View {
       
        VStack {
            
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding([.top, .bottom], 20)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Username")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack {
                        
                        TextField("Enter your name", text: $user)
                        
                        if user != "" {
                            Image("check")
                                .foregroundColor(Color.init(.label))
                        }
                    }
                    
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack {
                        
                        SecureField("Enter your password", text: $pass)
                        
                        if pass != "" {
                            Image("check")
                                .foregroundColor(Color.init(.label))
                        }
                    }
                    
                    Divider()
                }
                
            }.padding(.horizontal, 6)
            
            Button(action: {
                signUpWithEmail(email: self.user, password: self.pass) { (verified, status) in
                    
                    if !verified {
                        self.message = status
                        self.alert.toggle()
                    } else {
                        UserDefaults.standard.set(true, forKey: "status")
                        
                        self.show.toggle()
                        
                        NotificationCenter.default.post(name: NSNotification.Name("changeStatus"), object: nil)
                    }
                }
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            }
            .background(Color.init(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
            .clipShape(Capsule())
            .padding(.top, 45)
        }
        .padding()
        .alert(isPresented: $alert) {
            Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
        }
    }
}
//
//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}
