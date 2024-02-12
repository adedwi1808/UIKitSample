//
//  ViewController.swift
//  UIKitSample
//
//  Created by Ade Dwi Prayitno on 12/02/24.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sampleData: [String: [String]] = [
        "Straw Hat Pirates": ["Luffy", "Zoro", "Nami", "Sanji", "Chopper", "Robin", "Franky", "Brook", "Jinbe"],
        "Red Hair Pirates": ["Shanks", "Benn Beckman", "Yasopp", "Lucky Roux", "Rockstar"],
        "Whitebeard Pirates": ["Edward Newgate", "Marco", "Jozu", "Vista", "Ace", "Thatch", "Blamenco", "Rakuyo", "Namur", "Blenheim", "Curiel", "Haruta", "Atmos", "Fossa", "Izo", "Squard"],
        "Blackbeard Pirates": ["Marshall D. Teach (Blackbeard)", "Jesus Burgess", "Van Augur", "Doc Q", "Laffitte", "Shiliew", "Sanjuan Wolf", "Vasco Shot", "Catarina Devon", "Avalo Pizarro"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sampleData.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let pirateGroup = Array(sampleData.keys)[section]
        let pirates = sampleData[pirateGroup] ?? []
        return pirates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pirate", for: indexPath)
        
        let pirateGroup = Array(sampleData.keys)[indexPath.section]
        let pirates = sampleData[pirateGroup] ?? []
        let pirateName = pirates[indexPath.row]
        
        cell.textLabel?.text = pirateName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Array(sampleData.keys)[section]
    }
}

