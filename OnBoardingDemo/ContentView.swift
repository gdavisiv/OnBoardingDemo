//
//  ContentView.swift
//  OnBoardingDemo
//
//  Created by George Davis IV on 10/22/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToHome = false
    
    var body: some View {
        ZStack {
            if goToHome{
                HomeScreen()
            }
            else{
                OnBoardScreen()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("Success")), perform: { _ in withAnimation{self.goToHome = true}
            })
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeScreen : View{
    var body : some View{
        ZStack {
            Color(#colorLiteral(red: 0.9917476773, green: 0.7057664394, blue: 0.6240440011, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            Text("Home Screen")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .shadow(radius: 5)
                .multilineTextAlignment(.center)
        }
        
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
                
                Spacer()
                
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
                
                //Spacer()
                
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
                                .frame(width: calculateWidth() + 65)
                            
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
        
        let percent = offset / maxWidth
        
        return percent * maxWidth
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
                
                //Notify User that gesture is completed
                
                //Add animation delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                }
            }
            else{
                offset = 0
            }
        }
    }
    
}
