//
//  ContentView.swift
//  Conversor App
//
//  Created by Miguel Angel Bohorquez on 17/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.hueso.ignoresSafeArea(.all)
                VStack{
                    Text("Que quieres convertir?").font(.system(.title, design: .rounded, weight: .bold))
                    List(){
                        NavigationLink(destination: temperature()){
                            Text("Temperatura")
                        }
                        NavigationLink(destination: longitud()){
                            Text("Longitud")
                        }
                       
                    }.scrollContentBackground(.hidden).frame(height:400)
                        
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
