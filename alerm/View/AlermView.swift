//
//  AlermView.swift
//  alerm
//
//  Created by Tokoroteen on 2024/03/22
//
//

import SwiftUI

struct AlermView: View {
    @ObservedObject var alermSetting: AlermSetting
    
    var body: some View {
        Toggle(isOn: $alermSetting.isOn) {
            Text(String(format: "%02d:%02d", alermSetting.hour, alermSetting.minute))
                .bold()
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(height: 90)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let alermSetting = AlermSetting()
    return AlermView(alermSetting: alermSetting)
}
