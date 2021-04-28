//
//  SignIn.swift
//  AuthorizationWithFirebase
//
//  Created by Майлс on 28.04.2021.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignIn: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("Sigh in")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
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
                    signInWithEmail(email: self.user, password: self.pass) { (verified, status) in
                        
                        if !verified {
                            self.message = status
                            self.alert.toggle()
                        } else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Sign in")
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
            
            VStack {
                
                Text("(or)")
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.top, 30)
                
                HStack(spacing: 8) {
                    
                    Text("Dont have an account?")
                        .foregroundColor(Color.gray.opacity(0.5))
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Sign in")
                    }
                }.padding(.top, 25)
            }
            .sheet(isPresented: $show) {
                SignUp(show: self.$show)
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
