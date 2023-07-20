//
//  DFTabBarController.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 04.07.2023.
//

import UIKit

final class DFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs() {
        let menuVC = DFMenuViewController()
        let contactsVC = DFContactsViewController()
        let profileVC = DFProfileViewController()
        let cartVC = DFCartViewController()
        
        let navMenu = UINavigationController(rootViewController: menuVC)
        let navContacts = UINavigationController(rootViewController: contactsVC)
        let navProfile = UINavigationController(rootViewController: profileVC)
        let navCart = UINavigationController(rootViewController: cartVC)
        
        navMenu.tabBarItem = UITabBarItem(
            title: "Меню",
            image: UIImage(systemName: "fork.knife"),
            tag: 1
        )
        
        navContacts.tabBarItem = UITabBarItem(
            title: "Контакты",
            image: UIImage(systemName: "location.fill"),
            tag: 2
        )
        
        navProfile.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.fill"),
            tag: 3
        )
        
        navCart.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "cart.fill"),
            tag: 4
        )
        
        setViewControllers(
            [navMenu, navContacts, navProfile, navCart],
            animated: true
        )
    }
    
}
