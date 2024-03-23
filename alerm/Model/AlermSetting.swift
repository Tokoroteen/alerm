//
//  AlermSetting.swift
//  alerm
//
//  Created by Tokoroteen on 2024/03/22
//
//

import Foundation

class AlermSetting: ObservableObject, Identifiable {
    var hour = 9
    var minute = 30
    var isOn = false
}
