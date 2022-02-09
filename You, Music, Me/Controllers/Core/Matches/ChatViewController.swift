//
//  ChatViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/31/22.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    // Display the person's name you are chatting with
    var personsName: String! // implicity unwrapped optional b/c we are absolutely certain it will have a value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
        title = personsName
    }
}
