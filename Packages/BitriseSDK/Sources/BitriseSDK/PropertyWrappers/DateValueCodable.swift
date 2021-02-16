//
//  DateValueCodale.swift
//  
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import Foundation

@propertyWrapper
public struct DateValueCodable<Formatter: DateValueCodableStrategy>: Codable, Hashable {
    private let value: Formatter.RawValue
    public var wrappedValue: Date

    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
        self.value = Formatter.encode(wrappedValue)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(Formatter.RawValue.self)
        self.wrappedValue = try Formatter.decode(value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(Formatter.encode(wrappedValue))
    }
}

public protocol DateValueCodableStrategy {
    associatedtype RawValue: Codable, Hashable
    static func decode(_ value: RawValue) throws -> Date
    static func encode(_ date: Date) -> RawValue
}

public struct BitriseDateCodableStrategy: DateValueCodableStrategy {
    public typealias RawValue = String

    private static let format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

    public static func decode(_ value: String) throws -> Date {
        try formatDateString(with: format, value: value)
    }

    public static func encode(_ date: Date) -> String {
        formatDateToString(with: format, date: date)
    }
}

public struct BitriseDateWithoutMSCodableStrategy: DateValueCodableStrategy {
    public typealias RawValue = String

    private static let format = "yyyy-MM-dd'T'HH:mm:ss'Z'"

    public static func decode(_ value: String) throws -> Date {
        try formatDateString(with: format, value: value)
    }

    public static func encode(_ date: Date) -> String {
        formatDateToString(with: format, date: date)
    }
}

private func formatDateString(with format: String, value: String) throws -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    guard let date = formatter.date(from: value) else {
        throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid date format: \(value)"))
    }
    return date
}

private func formatDateToString(with format: String, date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: date)
}
