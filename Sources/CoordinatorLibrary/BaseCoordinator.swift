//
//  BaseCoordinator.swift
//  CoordinatorModule
//
//  Created by Muzammil Peer on 31/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//


import UIKit
import Foundation
import RouterLibrary

open class BaseCoordinator {
    
    // ------------- Coordinator Protocol--------------------//
    //Shared Properties required by Every Coordinator
    // required : navigationController
    public var navigationController: UINavigationController
    // optional : dependencies  (only required in parent child coordinator relationship coordinators)
    @objc public var dependencies: CoordinatorDependencies?
    // ------------- [end] Coordinator Protocol--------------------//
    
    // constructor : default
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.dependencies = nil
    }
    
    // constructor : default + (only required in parent child coordinator relationship coordinators)
    public init(navigationController: UINavigationController,
         dependenciesManager: CoordinatorDependencies = DefaultCoordinatorDependencies()) {
        self.navigationController = navigationController
        dependencies = dependenciesManager
    }
    
    // presented view : computed property (evulate every time it is being called)
    public var topViewController:UIViewController?  {
        if let lastViewController = navigationController.viewControllers.last {
            var parentController:UIViewController = lastViewController
            while (parentController.presentedViewController != nil && parentController != parentController.presentedViewController) {
                parentController = parentController.presentedViewController!
            }
            
            return parentController
        }
        return nil
    }
}

extension BaseCoordinator : Coordinator {
    // required : starting point of module
    open func start() {
        fatalError("must override start()")
    }
}

extension BaseCoordinator : Router
{
    // ---------------- base module functions-----------------------//

    // presented view : dismiss to previous module
    public func dismissModule(animated:Bool? = false,completion: (() -> Void)?) {
        topViewController?.dismiss(animated: true, completion: completion)
        dependencies?.remove(dependency: self)
    }
    // pushed view : pop to previous module
    public func popModule(animated:Bool? = false) {
        self.dismissAllScreenFrom(currentViewController: topViewController)
        self.navigationController.popViewController(animated: false)
        dependencies?.remove(dependency: self)
    }
    
    // pushed view : pop to root module
    public func popToRootModule(animated:Bool? = false) {
        for _ in stride(from: navigationController.viewControllers.count, to: 0, by: -1) {
            self.dismissAllScreenFrom(currentViewController: topViewController)
            navigationController.popViewController(animated: false)
        }
        dependencies?.removeAllDependecnies()
    }
    // ----------------[end] base module functions-----------------------//

    
    
    // ---------------- screen dismiss/pop functions-----------------------//
    public func dismissScreen(animated:Bool, completion: (() -> Void)?)
    {
        topViewController?.dismiss(animated: false, completion: nil)
    }
    public func popScreen(animated:Bool)
    {
        navigationController.popViewController(animated: false)
    }
    public func popAllScreens(animated:Bool)
    {
        navigationController.popToRootViewController(animated: false)
    }
    // ----------------[end] screen dismiss/pop functions-----------------------//

    
    // ---------------- private functions-----------------------//
    //private functions
    private func dismissAllScreenFrom(currentViewController:UIViewController?,animated:Bool = false)
    {
        var currentTopViewController:UIViewController? = currentViewController
        while (currentTopViewController != nil ) {
            if (currentTopViewController?.presentingViewController != nil) {
                currentTopViewController?.dismiss(animated: animated, completion: nil)
            }
            currentTopViewController = currentTopViewController?.presentingViewController
        }
    }
    // ----------------[end] private functions-----------------------//
}
