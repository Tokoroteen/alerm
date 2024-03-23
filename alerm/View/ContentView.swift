//
//  ContentView.swift
//  alerm
//
//  Created by Tokoroteen on 2024/03/22
//
//

import SwiftUI

struct ContentView: View {
    @State private var alarmTime = Date()
    @State private var isAlarmSet = false
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Set Alarm", selection: $alarmTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                
                Toggle(isOn: $isAlarmSet) {
                    Text("Enable Alarm")
                }
                .onChange(of: isAlarmSet) { oldValue, newValue in
                    if newValue {
                        scheduleAlarm()
                    } else {
                        cancelAlarm()
                    }
                }
                
                Text("Alarm set for \(alarmTime, style: .time)")
            }
            .navigationBarTitle("Alarm App")
        }
    }
    
    func scheduleAlarm() {
        print("scheduleAlarmの呼び出し")
        let content = UNMutableNotificationContent()
        content.title = "Alarm"
        content.body = "Your alarm is going off!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: alarmTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
        
    }
    
    func cancelAlarm() {
        print("cancelAlarmの呼び出し")
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

#Preview {
    ContentView()
}
