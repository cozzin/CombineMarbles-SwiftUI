//
//  InitialValues.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MarbleElementType: Identifiable {
    let id: UUID = UUID()
    let value: String
    let color: Color
    let time: CGFloat
    
    func mutatingTime(_ time: CGFloat) -> MarbleElementType {
        MarbleElementType(
            value: value,
            color: color,
            time: time
        )
    }
}

struct OperatorMarbleValues {
    let line1: [MarbleElementType]
    let line2: [MarbleElementType]?
    
    init(line1: [MarbleElementType], line2: [MarbleElementType]? = nil) {
        self.line1 = line1
        self.line2 = line2
    }
}

extension Operator {
    var initial: OperatorMarbleValues {
        switch self {
        case .map:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .black, time: 300)
                ])
        case .collect:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .black, time: 300),
                MarbleElementType(value: "4", color: .black, time: 400),
                MarbleElementType(value: "5", color: .black, time: 500),
                MarbleElementType(value: "6", color: .black, time: 600)
                ])
        case .filter:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "5", color: .red, time: 100),
                MarbleElementType(value: "15", color: .blue, time: 200),
                MarbleElementType(value: "20", color: .yellow, time: 300),
                MarbleElementType(value: "1", color: .gray, time: 400),
                MarbleElementType(value: "500", color: .orange, time: 500)
                ])
        case .removeDuplicates:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "2", color: .blue, time: 300),
                MarbleElementType(value: "3", color: .black, time: 400)
                ])
        case .merge:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "20", color: .green, time: 400),
                MarbleElementType(value: "300", color: .black, time: 600)
                ], line2:
                    [
                        MarbleElementType(value: "800", color: .orange, time: 300),
                        MarbleElementType(value: "55", color: .yellow, time: 500),
                    ])
        case .append:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .green, time: 600),
                ], line2:
                [
                    MarbleElementType(value: "5", color: .orange, time: 300),
                    MarbleElementType(value: "5", color: .yellow, time: 500),
                ])
        case .dropFirst:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
                ])
        case .last:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
                ])
        case .first:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .blue, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
                ])
        case .zip:
             return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 400),
                MarbleElementType(value: "3", color: .orange, time: 800),
                ], line2: [
                    MarbleElementType(value: "A", color: .red, time: 200),
                    MarbleElementType(value: "B", color: .blue, time: 600),
                ])
        case .scan:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "1", color: .red, time: 100),
                MarbleElementType(value: "2", color: .blue, time: 200),
                MarbleElementType(value: "3", color: .green, time: 300),
                MarbleElementType(value: "4", color: .yellow, time: 400)
                ])
        case .min:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
                ])
        case .max:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
                ])
        case .count:
            return OperatorMarbleValues(line1: [
                MarbleElementType(value: "300", color: .red, time: 100),
                MarbleElementType(value: "5", color: .blue, time: 200),
                MarbleElementType(value: "55", color: .green, time: 300),
                MarbleElementType(value: "24", color: .yellow, time: 400)
                ])
        }
    }
    
    var transformText: String {
        switch self {
        case .map:
            return "map {$0 * 10}"
        case .collect:
            return "a.collect()"
        case .filter:
            return "a.filter {$0 > 10}"
        case .removeDuplicates:
            return "a.removeDuplicates()"
        case .merge:
            return "Publishers.merge(a, b)"
        case .append:
            return "a.append(b)"
        case .dropFirst:
            return "a.dropFirst(2)"
        case .last:
            return "a.last()"
        case .first:
            return "a.first()"
        case .zip:
            return "Publishers.zip(a, b)"
        case .scan:
            return "a.scan(0) {$0 + $1}"
        case .min:
            return "a.min()"
        case .max:
            return "a.max()"
        case .count:
            return "a.count()"
        }
    }
    
    func transform() -> AnyPublisher<MarbleElementType, Error> {
        switch self {
        case .map:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
            .map {$0 * 10}
                .map {value in
                    let originalValue = initial.line1.first {String(value / 10) == $0.value}!
                    let currentColor = originalValue.color
                    return MarbleElementType(value: "\(value)", color: currentColor,
                                             time: originalValue.time)
            }.eraseToAnyPublisher()
        case .collect:
             return Publishers.Sequence(sequence: initial.line1)
                .collect()
                .map {collected in
                    let values = collected.map {$0.value}.joined(separator: ",")
                    return MarbleElementType(value: "[\(values)]",
                                             color: .green,
                                             time: 600)
            }.eraseToAnyPublisher()
        case .filter:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
                .filter {$0 > 10}
                .map {value in
                    let originalValue = initial.line1.first {String(value) == $0.value}!
                    let currentColor = originalValue.color
                    return MarbleElementType(value: "\(value)", color: currentColor,
                                             time: originalValue.time)
            }.eraseToAnyPublisher()
        case .removeDuplicates:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
                .removeDuplicates()
                .map {value in
                    let originalValue = initial.line1.first {String(value) == $0.value}!
                    let currentColor = originalValue.color
                    return MarbleElementType(value: "\(value)", color: currentColor,
                                             time: originalValue.time)
                }.eraseToAnyPublisher()
        case .merge:
            let sequence1 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line1)
            let sequence2 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line2!)
            return Publishers.Merge(sequence1, sequence2)
            .eraseToAnyPublisher()
        case .append:
            let sequence1 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line1)
            let sequence2 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line2!)
            return sequence1.append(sequence2)
            .eraseToAnyPublisher()
        case .dropFirst:
            return Publishers.Sequence(sequence: initial.line1)
            .dropFirst(2)
            .eraseToAnyPublisher()
        case .last:
            return Publishers.Sequence(sequence: initial.line1)
                .last()
                .eraseToAnyPublisher()
        case .first:
            return Publishers.Sequence(sequence: initial.line1)
                .first()
                .eraseToAnyPublisher()
        case .zip:
            let sequence1 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line1)
            let sequence2 = Publishers.Sequence<[MarbleElementType], Error>(sequence: initial.line2!)
            return Publishers.Zip(sequence1, sequence2)
                .map {element1, element2 in
                    return MarbleElementType(value: element1.value + element2.value,
                                             color: .blue,
                                             time: element2.time)
            }.eraseToAnyPublisher()
        case .scan:
            return Publishers.Sequence(sequence: initial.line1)
            .scan(MarbleElementType(value: "0",
                                    color: .white,
                                    time: 0)) {acc, e in
                                        let a = Int(e.value)!
                                        let b = Int(acc.value)!
                                        return MarbleElementType(value: String(a + b),
                                                                 color: e.color,
                                                                 time: e.time)
            }.eraseToAnyPublisher()
        case .min:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
            .min()
            .map { value in
                let originalValue = initial.line1.first(where: {String(value) == $0.value})!
                return MarbleElementType(value: originalValue.value,
                                         color: originalValue.color,
                                         time: 400)
            }.eraseToAnyPublisher()
        case .max:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
                .max()
                .map { value in
                    let originalValue = initial.line1.first(where: {String(value) == $0.value})!
                    return MarbleElementType(value: originalValue.value,
                                             color: originalValue.color,
                                             time: 400)
                }.eraseToAnyPublisher()
        case .count:
            let numberValues = initial.line1.map {Int($0.value)!}
            return Publishers.Sequence(sequence: numberValues)
                .count()
                .map { value in
                    return MarbleElementType(value: String(value),
                                             color: .yellow,
                                             time: 400)
                }.eraseToAnyPublisher()
        }
    }
}

