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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
