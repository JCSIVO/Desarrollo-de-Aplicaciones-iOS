//
//  Item.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 30/11/25.
//

import Foundation

public struct Item: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    public var title: String
    public var note: String?
    public var date: Date
    public var isCompleted: Bool
    public var isArchived: Bool
}
