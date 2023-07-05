//
//  APButtonClose.swift
//  Appetizers
//
//  Created by Roman Smirnov on 05.07.2023.
//

import SwiftUI

struct APButtonClose: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

struct APButtonClose_Previews: PreviewProvider {
    static var previews: some View {
        APButtonClose()
    }
}
