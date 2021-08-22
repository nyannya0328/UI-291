//
//  ContentView.swift
//  UI-291
//
//  Created by nyannyan0328 on 2021/08/22.
//

import SwiftUI
var gradinent = LinearGradient(colors: [

    .red.opacity(0.3),
    .green.opacity(0.3),
    .blue.opacity(0.3),
    .orange.opacity(0.3),
    

], startPoint: .top, endPoint: .bottom)


var gradinent2 = LinearGradient(colors: [

    .red.opacity(0.3),
    .green.opacity(0.3),
    .blue.opacity(0.3),
    .orange.opacity(0.3),
    

], startPoint: .bottom, endPoint: .top)


struct ContentView: View {
    @AppStorage("light on") private var lightOn : Bool = false
    
    private var backGround : Color{
        
        
        lightOn ? .black : .white
        
    }
    
    private var imageName : String{
        
        
        lightOn ? "sun.max.fill" : "moon.fill"
        
    }
    
    private var forgrond : Color{
        
        
        lightOn ? .white : .black
        
    }
    
    private var text : String{
        
        
        lightOn ? "Switch OFF" : "Switch ON"
        
    }
    
    @State private var rotation : Double = 0
    

    var body: some View {
        ZStack{
            
            backGround
            
            
            
            Image(systemName: imageName)
                .font(.system(size: 200, weight: .bold))
                .foregroundColor(forgrond)
                .rotationEffect(.init(degrees: rotation))
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1), value: rotation)
            
            
            VStack{
                
                Text(text)
                    .font(.largeTitle.bold())
                    .foregroundColor(forgrond)
                
                
                HStack{
                    
               
                    
                    Text("Push Switch")
                        .font(.title.weight(.thin))
                        .foregroundColor(forgrond)
                        .offset(x : UIScreen.main.bounds.height < 750 ? -50 : -80)
                    
                
               
                    
                    Toggle(isOn: $lightOn, label: {
                        
                        
                        Image(systemName: "eyedropper")
                        
                        
                    })
                      
                        .toggleStyle(.button)
                        .tint(Color.red)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
                
                
                
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
            .onChange(of: lightOn) { newValue in
                
                if newValue {rotation += 360 * 3 }
                
                else{rotation -= 360 * 3}
            }
                
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
         
    }
}
