//
//  ViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/27/22.
//

import UIKit

let customColor: UIColor = UIColor(red: 0.5, green: 0.3, blue: 0.6, alpha: 1)

class ViewController: UIViewController {
    
    // anonymous closure
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In To Spotify", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
        view.addSubview(loginButton)
        
        // add an action to our button
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // centers the button
        loginButton.center = view.center
    }
    
    // need to annotate it with @objc so that the selector can reference it
    @objc func didTapLoginButton() {
        // Create and present tab bar controller
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = .systemCyan
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        // This will allow the tab titles to be displayed before that specific tab is selected for the first time.
        vc1.title = "Browse"
        vc2.title = "Matches"
        vc3.title = "Events"
        
        // Every tab is connected to one view controller, and every view controller is responsible for setting up their title, tab bar item, etc.
        // In the View Controller array, the order in which they exist in the array will be the order in which they are displayed on the screen.
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let imagesNames = ["bonjour", "heart.circle", "magazine"]
        
        for x in 0..<items.count { // for x in 0 up until items.count
            items[x].image = UIImage(systemName: imagesNames[x])
        }
        
        // present the tab bar controller
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

// Tab Bar Item is the responsibility of the View Controller, in each of our controllers, we need to set up this item.

// The viewDidLoad for a view controller (that is a particular tab) isn't called until you select that specific tab for the first time.

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
    }
}
