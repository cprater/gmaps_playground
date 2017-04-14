//
//  PlaceViewController.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/10/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {
    //MARK: Properties
    var place: Place?
    
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var longTextField: UITextField!
    @IBOutlet weak var placeNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        latTextField.text = String(describing: place!.latitude)
        longTextField.text = String(describing: place!.longitude)
        placeNameLabel.text = place?.name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func showMapView(_ sender: UIButton) {
        performSegue(withIdentifier: "showMapDetail", sender: sender)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showMapDetail" {
            guard let mapDetailViewController = segue.destination as? MapViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            mapDetailViewController.place = place
        }
    }

}
