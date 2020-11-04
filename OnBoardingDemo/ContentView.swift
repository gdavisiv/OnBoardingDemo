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
    @State var offset : CGFloat = 0
    
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
                        .fill(Color.white.opacity(0.5))
                    
                    Text("Swipe to Enter")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                        .padding(.leading,30)
                    
                    HStack{
                        Capsule()
                            .fill(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .frame(width: 100)
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack{
                        ZStack{
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                        }
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .offset(x: 6)
                        .frame(width: 65, height: 65)
                        .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                        
                        Spacer()
                    }
                }
                .frame(width: maxWidth, height: 65)
                .padding(.bottom)
            }
        }
    }
    func calculateWidth()->CGFloat{
        
    }
    
    //Handles the swipe functionality
    func onChanged(value: DragGesture.Value){
        if value.translation.width > 0 && offset <= maxWidth - 65{
        offset = value.translation.width
        }
    }
    
    //Handles making sure the swipe button does not go outside its bounds
    func onEnd(value: DragGesture.Value){
        
        withAnimation(Animation.easeOut(duration: 0.3)){
            if offset > 180 {
                offset = maxWidth - 65
            }
            else{
                offset = 0
            }
        }
    }
    
}
