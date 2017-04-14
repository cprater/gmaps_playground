//
//  PlaceTableViewCell.swift
//  GMapsPlayground
//
//  Created by Christopher Prater on 4/11/17.
//  Copyright © 2017 Christopher Prater. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    //MARK: Properties
    var place: Place? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var nameLabelField: UILabel!
    @IBOutlet weak var latLabelField: UILabel!
    @IBOutlet weak var lonLabelField: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: Private methods
    private func updateView() {
        nameLabelField.text = place!.name
        latLabelField.text = String(place!.latitude)
        lonLabelField.text = String(place!.longitude)
    }
}
