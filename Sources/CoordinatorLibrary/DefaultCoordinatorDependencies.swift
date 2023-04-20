//
//  DefaultCoordinatorDependencies.swift
//  CoordinatorModule
//
//  Created by Muzammil Peer on 31/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//

import Foundation
import UIKit

public final class DefaultCoordinatorDependencies:NSObject, CoordinatorDependencies {
    private var dependencies:[Coordinator] = [Coordinator]()
    public func add(dependency coordinator: Coordinator) {
        for coordinator in dependencies {
            if coordinator === coordinator {
                break
            }
        }
        dependencies.append(coordinator)
    }
    public func remove(dependency coordinator: Coordinator) {
        for (index, coordinator) in dependencies.enumerated() {
            if coordinator === coordinator {
                dependencies.remove(at: index)
                break
            }
        }
    }
    public func removeAllDependecnies()
    {
        dependencies.removeAll()
    }
}
extension DefaultCoordinatorDependencies : UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        
//        if let buyViewController = fromViewController as? BuyViewController { //if they conform some protocol then remove parent
            // We're popping a buy view controller; end its coordinator
//            childDidFinish(buyViewController.coordinator)
//        }
    }
}
