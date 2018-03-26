import UIKit
import UserNotifications
class MyNotificationCenter {
    
    let myNotification = Notification.Name(rawValue:"MyNotification")
    let content = UNMutableNotificationContent()
    
    init(){
        let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
                                                title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                              actions: [snoozeAction,deleteAction],
                                              intentIdentifiers: [], options: [])
        AppDelegate.center.setNotificationCategories([category])
        AppDelegate.center.setNotificationCategories([category])
    }
    
    func addNotification(title:String,body:String,date:Date,identifier:String) {
        if date.timeIntervalSince(Date()) > 0{
            content.title = title
            content.body = body
            content.sound = UNNotificationSound.default()
            print(date.timeIntervalSince(Date()))
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSince(Date()), repeats: false)
            let identifier = identifier
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            AppDelegate.center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    print(error)
                }
            })
        }
    }

    func removeNotification(identifier:[String]){
        AppDelegate.center.removePendingNotificationRequests(withIdentifiers: identifier)
    }
    
}
