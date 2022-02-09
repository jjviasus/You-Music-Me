//
//  TabBarViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {    
    override func viewDidLoad() {
        self.tabBar.tintColor = .systemCyan
        
        // Instantiate the view controllers
        let browseVC = BrowseViewController()
        let matchesVC = MatchesViewController()
        let eventsVC = EventsViewController()
        
        // Set the tabs' titles
        browseVC.title = "Browse"
        matchesVC.title = "Matches"
        eventsVC.title = "Events"
        
        let nav1 = UINavigationController(rootViewController: browseVC)
        let nav2 = UINavigationController(rootViewController: matchesVC)
        let nav3 = UINavigationController(rootViewController: eventsVC)
        
        // Set the view controllers for the tabs in order
        self.setViewControllers([nav1, nav2, nav3], animated: false)
        self.selectedViewController = nav1
        
        guard let items = self.tabBar.items else { return }
        let imageNames = ["bonjour", "heart.circle", "magazine"]
        
        // Set the image for each tab bar item
        for x in 0..<items.count { // for x in 0 up until items.count
            items[x].image = UIImage(systemName: imageNames[x])
        }
        
        // So the user can't swipe it away
        self.modalPresentationStyle = .fullScreen
    }
}
