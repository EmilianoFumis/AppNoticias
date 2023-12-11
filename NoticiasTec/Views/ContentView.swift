//
//  ContentView.swift
//  NoticiasTec
//
//  Created by Emiliano Fumis on 09/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //propiedad de escucha
    
    var body: some View {
       NavigationView{
            List(networkManager.posts){ post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("eNews")
        }
        
       .onAppear(){
           self.networkManager.fetchData()
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



