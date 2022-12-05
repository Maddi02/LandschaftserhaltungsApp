//
//  extensions.swift
//  Landschaftserhaltungs
//  Created by Martin Hummel on 18.10.22.
//

import Foundation
import SwiftUI
import UIKit


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}


public extension View {
    func fullBackground(imageName: String) -> some View {
        return background(
            Image(imageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
}

extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
 
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
extension Array where Element: Hashable {
    func uniqued() -> Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
extension Date
{
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func getYearFromDate(date : Date) -> Int
    {
        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        return calendarDate.year!
        
    }
    
    func getMonthFromDate(date : Date) -> Int
    {
        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        return calendarDate.month!
        
    }
    
    
    func getDayFromDate(date : Date) -> Int
    {
        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        return calendarDate.day!
        
    }
    
    func getEndOfContract(date : Date)-> String
    {
        
        let year = date.getYearFromDate(date: date)
        
        if(date.getDayFromDate(date: date) == 1 && (date.getMonthFromDate(date: date) == 1))
        {
            let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 5, month: 1, day: 1))
            return Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear ?? Date())!.toString()
            
        }
        let firstOfNextYear = Calendar.current.date(byAdding: .year, value: 5, to: date )!
        return Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear )!.toString()
        
    }
    
    
    func toString(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func dateAndTimetoString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func nextDate() -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: self)
        return nextDate ?? Date()
    }
    
    func previousDate() -> Date {
        let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
        return previousDate ?? Date()
    }
    
    func addMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func removeMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func removeYears(numberOfYears: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .year, value: -numberOfYears, to: self)
        return endDate ?? Date()
    }
    
    
    func getLastYear() -> Date
    {
        var lastOfYear = Date()
        
        let year = Calendar.current.component(.year, from: Date())
        // Get the first day of next year
        if let firstOfNextYear = Calendar.current.date(from: DateComponents(year: year + 1, month: 1, day: 1)) {
            // Get the last day of the current year
            lastOfYear = Calendar.current.date(byAdding: .day, value: -1, to: firstOfNextYear)!
            return lastOfYear
        }
        return Date()
    }
    
    func getHumanReadableDayString() -> String {
        let weekdays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar - 1]
    }
    
    
    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
        
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        
        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
            return "\(month) months ago"
        }else if (month >= 1) {
            return "1 month ago"
        }else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
            return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    
    
}
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}


extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height

        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}

extension UIImage {
  func resizeImage(targetRatio: Double) -> UIImage {
    let size = self.size
    //let widthRatio  = targetSize.width  / size.width
    //let heightRatio = targetSize.height / size.height
    let newSize = CGSize(width: size.width * targetRatio, height: size.height * targetRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}
