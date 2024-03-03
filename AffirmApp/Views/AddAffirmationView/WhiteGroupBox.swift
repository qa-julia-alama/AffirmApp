//
//  WhiteGroupBox.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import Foundation
import SwiftUI

struct WhiteGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            configuration.content
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
        )
    }
}
