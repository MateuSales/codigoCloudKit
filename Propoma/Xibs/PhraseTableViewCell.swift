//
//  PhraseTableViewCell.swift
//  Propoma
//
//  Created by Alysson Moreira on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit

class PhraseTableViewCell: UITableViewCell {

    @IBOutlet weak var viewPhraseBackground: UIView!
    @IBOutlet weak var lbPhrase: UILabel!
    
    @IBOutlet weak var btFavorite: UIButton!
    @IBOutlet weak var btShare: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didTapBtFavorite(_ sender: Any) {
    }
    @IBAction func didTapBtShare(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
