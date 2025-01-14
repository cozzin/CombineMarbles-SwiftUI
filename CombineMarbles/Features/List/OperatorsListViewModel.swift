//
//  OperatorsListViewModel.swift
//  CombineMarbles
//
//  Created by Antoine Garcia on 13/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct OperatorSection {
    let title: String
    let operators: [Operator]
}

final class OperatorsListViewModel: BindableObject {
    let didChange: AnyPublisher<OperatorsListViewModel, Never>
    private let _didChange = PassthroughSubject<OperatorsListViewModel, Never>()
    
    private(set) var operators: [OperatorSection] = [] {
        didSet {
            _didChange.send(self)
        }
    }
    
    init() {
        didChange = _didChange.eraseToAnyPublisher()
        let combiningSection = OperatorSection(title: "Combining",
                                               operators: [.append, .merge, .zip])
        let transformingSection = OperatorSection(title: "Mapping",
                                          operators: [.collect, .map, .scan])
        let filteringSection = OperatorSection(title: "Filtering",
                                                  operators: [.dropFirst, .filter, .first, .last, .removeDuplicates])
        let mathSection = OperatorSection(title: "Mathematical",
                                          operators: [.count, .max, .min])
        operators = [combiningSection, filteringSection, transformingSection, mathSection]
    }
}
