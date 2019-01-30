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
    
    var indexPath: IndexPath!
    
    var mode: ControllerMode?
    
    var delegate: PhraseCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let mode = self.mode {
            self.btShare.isHidden = mode.canShare
        }
        
    }
    
    @IBAction func didTapBtFavorite(_ sender: Any) {
        self.delegate?.phraseDidTapFavorite(indexPath: self.indexPath)
        
    }
    @IBAction func didTapBtShare(_ sender: Any) {
        self.delegate?.phraseDidTapShare(indexPath: indexPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
