//
//  MatchesViewController.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation
import UIKit

class MatchesViewController: UIViewController {
    
    let matchesTableView = UITableView()
    var user: User!
    var matchList: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the match list from the user
        matchList = []
        
        // build sample list
        for x in 0...5 {
            let sampleUser = User(name: "Person \(x)", gender: Gender.female, preference: Gender.male) //, profileImage: UIImage(systemName: "person.crop.square.fill")!
            matchList.append(sampleUser)
        }
        
        view.backgroundColor = customColor
        view.addSubview(matchesTableView)
        
        // Registers a class to use in creating new table cells.
        matchesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        matchesTableView.backgroundColor = customColor
        matchesTableView.delegate = self
        matchesTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // make the x,y,width,height of table view the same as the root view for the view controller
        matchesTableView.frame = view.bounds
    }
}

// Extensions can make an existing type conform to a protocol
extension MatchesViewController: UITableViewDataSource {
    
    // The amount of rows we want to return in a given section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell with the particular "cell" id
        let cell = matchesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Provide the cell with the correct data
        cell.textLabel?.text = matchList[indexPath.row].name
        
        return cell
    }
}

extension MatchesViewController: UITableViewDelegate {
    
    // When a particular row is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the cell
        matchesTableView.deselectRow(at: indexPath, animated: true)
        
        // Get the cell that was tapped
        // let cellTapped = tableView.cellForRow(at: indexPath)
        // TODO: Implement a custom user cell so that we can extract the name?
    
        // Get the name of the user who's cell was tapped
        let name = matchList[indexPath.row].name
        
        // Set up the new chat vc
        let chatVC = ChatViewController()
        chatVC.personsName = name // dependency injection
        navigationController?.pushViewController(chatVC, animated: true)
    }
}

