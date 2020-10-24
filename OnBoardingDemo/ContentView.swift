//
//  ContentView.swift
//  OnBoardingDemo
//
//  Created by George Davis IV on 10/22/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OnBoardScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnBoardScreen : View {
    
    @State var maxWidth = UIScreen.main.bounds.width - 100
    
    var body : some View{
        ZStack{
            Color(#colorLiteral(red: 0.9917476773, green: 0.7057664394, blue: 0.6240440011, alpha: 1))
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                Text("Tips for Learning at Home")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .shadow(radius: 5)
                    .multilineTextAlignment(.center)
                
                Text("Having problems learning at home? Follow these tips to help save time and reduce stress!")
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .shadow(radius: 5)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Image("p3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                }
                .frame(width: maxWidth, height: 65)
            }
        }
    }
}
