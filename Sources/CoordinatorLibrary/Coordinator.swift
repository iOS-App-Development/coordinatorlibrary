//
//  Coordinator.swift
//  CoordinatorModule
//
//  Created by Muzammil Peer on 31/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol Coordinator :AnyObject {
    //only override this property when you need parent child coordinator otherwise ignore it
    @objc optional var dependencies: CoordinatorDependencies? {get set}
    // required - override this value with actual stack
    var navigationController: UINavigationController { get set }

    func start()
}


@objc public protocol Coordinatated :AnyObject {
    //only override this property when you need parent child coordinator otherwise ignore it
    @objc optional var dependencies: CoordinatorDependencies? {get set}
    // required - override this value with actual stack
    var navigationController: UINavigationController { get set }

    static func start() -> Self
}

extension Coordinatated where Self: Coordinator {
    static public func start() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

}
