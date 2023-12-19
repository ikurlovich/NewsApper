//
//  TabBarController.swift
//  NewsApper
//
//  Created by Илья Курлович on 14.12.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .black
        setupViewControllers()
        setupTabBar()
    }
    
    // MARK: - Private methods
    private func setupViewControllers() {
        viewControllers = [
            setupNavigationController(GeneralViewController(viewModel: GeneralViewModel()), "General", "newspaper"),
            setupNavigationController(BusinessViewController(), "Business", "briefcase"),
            setupNavigationController(TechnologyViewController(), "Technology", "gyroscope")
        ]
    }
    
    private func setupNavigationController(_ controller: UIViewController, _ title: String, _ image: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image) ?? UIImage.add
        controller.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = false
        
        return navigationController
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearance
        
        view.tintColor = .black
    }
}
