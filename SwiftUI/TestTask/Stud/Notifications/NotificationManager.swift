//
//  NotificationManager.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 19.02.2023.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager{

    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else{
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {

        let content = UNMutableNotificationContent()
        content.title = "Бронювання підтверджено!"
        content.subtitle = "Чекаємо на візит"
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8.0, repeats: false)
        
        let request = UNNotificationRequest(
             identifier: UUID().uuidString,
             content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

// calendar
/*
   var dateComponents = DateComponents()
    dateComponents.hour = 8
    dateComponents.minute = 0
    dateComponents.weekday = 2
    let dateTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
*/

// location
/*
    let coordinates = CLLocationCoordinate2D(
        latitude: 40.00,
        longitude: 50.00)
    let region = CLCircularRegion(
        center: coordinates,
        radius: 100,
        identifier: UUID().uuidString)
    region.notifyOnEntry = true
    region.notifyOnExit = true
    let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
 */
