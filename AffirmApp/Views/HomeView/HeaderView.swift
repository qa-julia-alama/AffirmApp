//
//  HeaderView.swift
//  AffirmApp
//
//  Created by Julia on 16/12/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            

        } //ZStack
            HStack{
               
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height:100)
                    
                }
         
            } // HStack
            
       
    }

}

#Preview {
    HeaderView()
}
