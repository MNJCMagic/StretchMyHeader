//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Mike Cameron on 2018-05-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    enum itemCategory {
        case World
        case Americas
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
    
    
    func toString() -> String {
        switch self {
        case .World:
            return "World"
        case .Americas:
            return "Americas"
        case .Europe:
            return "Europe"
        case .MiddleEast:
            return "Middle East"
        case .Africa:
            return "Africa"
        case .AsiaPacific:
            return "Asia Pacific"
        }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .World:
                return UIColor.red
            case .Americas:
                return UIColor.blue
            case .Europe:
                return UIColor.green
            case .MiddleEast:
                return UIColor.yellow
            case .Africa:
                return UIColor.orange
            case .AsiaPacific:
                return UIColor.purple
            }
        }
    }
    
    let category: itemCategory
    let summary: String
}
