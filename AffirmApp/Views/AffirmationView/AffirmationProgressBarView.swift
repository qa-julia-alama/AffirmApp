//
//  AffirmationProgressBarView.swift
//  AffirmApp
//
//  Created by Julia on 21/01/2024.
//

import SwiftUI

struct AffirmationProgressBarView: View {

        var progress: CGFloat

        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    Rectangle().frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(progress >= 1.0 ? Color.green : Color.blue)
                        .animation(.linear, value: progress)
                }
                .cornerRadius(45.0)
            }
        }
    }

//#Preview {
//    AffirmationProgressBarView()
//}
