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

    public static func decode(_ value: String) throws -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = dateFormatter.date(from: value) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid date format: \(value)"))
        }
        return date
    }

    public static func encode(_ date: Date) -> String {
        ISO8601DateFormatter().string(from: date)
    }
}
