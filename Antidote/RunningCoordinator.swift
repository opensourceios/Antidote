//
//  RunningCoordinator.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 07/10/15.
//  Copyright © 2015 dvor. All rights reserved.
//

import UIKit
import Cent

protocol RunningCoordinatorDelegate: class {
    func runningCoordinatorDidLogout(coordinator: RunningCoordinator)
}

class RunningCoordinator {
    weak var delegate: RunningCoordinatorDelegate?

    let window: UIWindow
    let tabBarController: UITabBarController

    let tabCoordinators: [TabCoordinatorProtocol];

    init(theme: Theme, window: UIWindow) {
        self.window = window
        self.tabBarController = UITabBarController()

        let profile = ProfileTabCoordinator(theme: theme)

        self.tabCoordinators = [
            FriendsTabCoordinator(),
            ChatsTabCoordinator(),
            SettingsTabCoordinator(),
            profile,
        ]

        profile.delegate = self
    }
}

// MARK: CoordinatorProtocol
extension RunningCoordinator: CoordinatorProtocol {
    func start() {
        tabCoordinators.each{ $0.start() }
        tabBarController.viewControllers = tabCoordinators.map{ $0.navigationController }

        window.rootViewController = tabBarController
    }
}

extension RunningCoordinator: ProfileTabCoordinatorDelegate {
    func profileTabCoordinatorDelegateLogout(coordinator: ProfileTabCoordinator) {
        UserDefaultsManager().isUserLoggedIn = false

        delegate?.runningCoordinatorDidLogout(self)
    }
}
