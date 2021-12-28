//
//  BackgroundView.swift
//  Fare
//
//  Created by Jumman Hossen on 03/12/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Image("rocket")
                .resizable()
                .aspectRatio( contentMode: .fill)
            
            
        }//: ZSTACK
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .top, endPoint: .trailing))
        
    }
}

#if DEBUG
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .previewLayout(.device)
    }
}

#endif
