//
//  CheckboxStyleView.swift
//  Fare
//
//  Created by Jumman Hossen on 03/12/21.
//

import SwiftUI

struct CheckboxStyleView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    
                    if configuration.isOn{
                        playSound(sound: "sound-rise", type: "mp3")
                    }else{
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
            configuration.label
        }//: HSTACK
    }
   
}

struct CheckboxStyleView_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(false))
            .toggleStyle(CheckboxStyleView())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
