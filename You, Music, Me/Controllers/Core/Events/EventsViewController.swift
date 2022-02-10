//
//  EventsViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {
    
    let eventsTableView = UITableView()
    var eventsList: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColor
        
        // Always add the views to the view hierarchy before setting auto layout constraints to them.
        view.addSubview(eventsTableView)
          
        let tabBarVC = tabBarController as! TabBarViewController
        let userLocation = "Boston"
        let favArtistList = tabBarVC.user?.favoriteArtists
        if !favArtistList!.isEmpty {
            let favArtist = favArtistList?[0]
            eventsList = TicketmasterAuthManager.getEvents(artist: favArtist!, location: userLocation)
        }
        
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        eventsTableView.backgroundColor = customColor
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // make the x,y,width,height of table view the same as the root view for the view controller
        eventsTableView.frame = view.bounds
    }
}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell with the "cell" id
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Update the cell's text
        cell.textLabel?.text = eventsList?[indexPath.row].name
        
        return cell
    }
}

extension EventsViewController: UITableViewDelegate {
    
    // When a particular row is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the cell
        eventsTableView.deselectRow(at: indexPath, animated: true)
    
        // TODO: when a particular cell is tapped, it should open a web page for the person to buy tickets for that event on Ticketmaster.
    }
}
