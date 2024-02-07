//
//  ProgressChartView.swift
//  AffirmApp
//
//  Created by Julia on 07/02/2024.
//

import SwiftUI

struct ProgressChartView: View {
    @StateObject private var viewModel = ProgressChartViewModel()

    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4), Color.yellow.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(height: 300)
            .shadow(radius: 20)
            .overlay(
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .bottom, spacing: 4) {
                        ForEach(viewModel.activities, id: \.date) { activity in
                            VStack() {
                                Text("Twój postęp: ")
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                
                                VStack {
                                    Rectangle()
                                        .fill(activity.affirmationsCount >= 5 ? Color.orange : Color.gray)
                                        .frame(width: 20, height: CGFloat(activity.affirmationsCount) / CGFloat(5) * 100)
                                    Text(formatter.string(from: activity.date))
                                        .font(.caption)
                                }
                            }
                            .onAppear {
                                print("Generating a view for an activity: \(activity)")
                            }
                        }
                    }
                    .padding()
                }
                .onAppear {
                    print("Current activities in ProgressChartView: \(viewModel.activities)")
                },
                alignment: .center
            )
    }
}

// DateFormatter to display date under the posts
private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd"
    return formatter
}()

#Preview {
    ProgressChartView()
}
