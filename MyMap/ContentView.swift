//
//  ContentView.swift
//  MyMap
//
//  Created by 笠井翔雲 on 2024/04/16.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    
    @State var displaySearchKey: String = "東京駅"
    
    @State var displayMapType: MapType = .standard
    var body: some View {
        VStack{
            TextField("キーワード", text: $inputText,prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            
            ZStack(alignment: .bottomTrailing){
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                Button{
                    if displayMapType == .standard{
                        displayMapType = .satelite
                    }else if displayMapType == .satelite{
                        displayMapType = .hybrid
                    }else{
                        displayMapType = .standard
                    }
                }label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,height: 35.0)
                }
                //右の余白20
                .padding(.trailing,20.0)
                //下の余白30
                .padding(.bottom,30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
