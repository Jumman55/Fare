//
//  LoginPageView.swift
//  Fare
//
//  Created by Jumman Hossen on 09/12/21.
//

import SwiftUI

   


struct LoginPageView: View {
    //MARK: - PROPERTIES
    
    @State var username: String = ""
    @State var password: String = ""

        //MARK: -BODY
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack{
                WelcomeText()
                UserImage()
                TextField("Email/Username" , text: $username)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                LoginButton()
            }//:  VStack
            .padding()
            
        }//: ZStack
      
        
        
        
    }
    
}

//MARK: -PREVIEW
#if DEBUG
struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
#endif

//MARK: - EXTRA STRUCK
struct WelcomeText : View {
    var body: some View{
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage : View{
    var body: some View{
        return Image("memoji")
            .resizable()
            .aspectRatio(UIImage(named: "memoji")!.size, contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButton: View {
    //MARK: - PROPERTIES
    @AppStorage("isOnLoginPage") var  isOnLoginPage: Bool?
    //MARK: - BODY
    var body: some View {
        Button(action: {
            isOnLoginPage = false
        }){
            HStack(spacing: 8){
                Text("Login")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                
            }
            
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
            
        }//: BUTTON
        .accentColor(Color.white)
        .padding(.bottom, 20)
        
    }
}
