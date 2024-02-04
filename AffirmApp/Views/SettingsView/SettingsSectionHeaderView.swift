//
//  SettingsSectionHeaderView.swift
//  AffirmApp
//
//  Created by Julia on 04/02/2024.
//

import SwiftUI

struct SettingsSectionHeaderView: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Image(systemName: icon)
        }
    }
}

#Preview {
    SettingsSectionHeaderView(title: "", icon: "icon.circle")
}
