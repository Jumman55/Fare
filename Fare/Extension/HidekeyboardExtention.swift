//
//  HidekeyboardExtention.swift
//  Fare
//
//  Created by Jumman Hossen on 02/12/21.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif 
