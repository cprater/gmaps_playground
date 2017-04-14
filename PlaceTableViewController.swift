//
//  PlaceTableViewController.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/11/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    //MARK: Properties
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load sample places
        loadSamplePlaces()
        
        // Register Table Cell nib
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell else {
            fatalError("Dequed cell is not an instance of PlaceTableViewCell")
        }
        
        cell.place = places[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = places[indexPath.row]
        
        self.performSegue(withIdentifier: "showPlaceDetail", sender: cell)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            case "showPlaceDetail":
                guard let placeDetailViewController = segue.destination as? PlaceViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
                
                guard let selectedPlace = sender as? Place else {
                    fatalError("Unexpected sender: \(sender)")
                }
            
                placeDetailViewController.place = selectedPlace
            default:
                fatalError("Unexpected Segue identifier; \(segue.identifier)")
            }
    }

    //MARK: Private methods
    private func loadSamplePlaces() {
        let place1 = Place(name: "Sydney", latitude: -33.86, longitude: 151.20)
        let place2 = Place(name: "Boulder", latitude: 40.04, longitude: -105.27)
        let place3 = Place(name: "Fort Worth", latitude: 32.75, longitude: -97.33)
        
        places += [place1, place2, place3]
    }
}
