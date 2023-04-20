//
//  CoordinatorFlowListener.swift
//  CoordinatorModule
//
//  Created by Muzammil Peer on 31/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//

import Foundation

public protocol CoordinatorFlowListener: AnyObject {
    func onFlowFinished(coordinator: Coordinator)
}
