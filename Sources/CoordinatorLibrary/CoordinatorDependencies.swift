//
//  CoordinatorDependencies.swift
//  CoordinatorModule
//
//  Created by Muzammil Peer on 31/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//

import Foundation

@objc public protocol CoordinatorDependencies {
    func add(dependency coordinator: Coordinator)
    func remove(dependency coordinator: Coordinator)
    func removeAllDependecnies()
}
