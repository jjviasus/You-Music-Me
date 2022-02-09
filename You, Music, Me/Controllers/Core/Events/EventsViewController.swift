//
//  EventsViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {
    
    let eventTableView = UITableView()
    var user: User!
    var listOfEvents: [Event]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
        
        // Always add the views to the view hierarchy before setting auto layout constraints to them.
        view.addSubview(eventTableView)
          
        let dummyArtist = Artist(artistID: "123", name: "Kygo")
        let dummyLocation = "Boston"
        listOfEvents = TicketmasterAuthManager.getEvents(artist: dummyArtist, location: dummyLocation)
        
        eventTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        eventTableView.backgroundColor = customColor
        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // make the x,y,width,height of table view the same as the root view for the view controller
        eventTableView.frame = view.bounds
    }
}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension EventsViewController: UITableViewDelegate {
    
}
