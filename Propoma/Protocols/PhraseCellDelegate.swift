//
//  PhraseCellDelegate.swift
//  Propoma
//
//  Created by Alysson Moreira on 30/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import Foundation

protocol PhraseCellDelegate {
    func phraseDidTapFavorite(indexPath: IndexPath) -> Void
    func phraseDidTapShare(indexPath: IndexPath) -> Void
}
