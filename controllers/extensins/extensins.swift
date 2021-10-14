//
//  extensins.swift
//  vk_server
//
//  Created by Grisha Pospelov on 07.10.2021.
//

import Foundation


extension Double {
    func getRelativeDateStringFromUTC() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        
        return dateFormatter.string(from: date)
    }
}


extension Double {
    func getDateStringFromUTC() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }
}


extension Int {
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "RU")
        
        let number = NSNumber(value: self)
        let formattedValue = formatter.string(from: number)!
        return "\(formattedValue)"
    }
}


extension String {
    var numberOfWords: Int {
        var count = 0
        let range = startIndex..<endIndex
        enumerateSubstrings(in: range, options: [.byWords, .substringNotRequired, .localized], { _, _, _, _ -> () in
            count += 1
        })
        return count
    }
}


extension StringProtocol {

    var byLines: [SubSequence] { components(separated: .byLines) }
    var byWords: [SubSequence] { components(separated: .byWords) }

    func components(separated options: String.EnumerationOptions)-> [SubSequence] {
        var components: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: options) { _, range, _, _ in components.append(self[range]) }
        return components
    }

    var firstWord: SubSequence? {
        var word: SubSequence?
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, stop in
            word = self[range]
            stop = true
        }
        return word
    }
    var firstLine: SubSequence? {
        var line: SubSequence?
        enumerateSubstrings(in: startIndex..., options: .byLines) { _, range, _, stop in
            line = self[range]
            stop = true
        }
        return line
    }
}
