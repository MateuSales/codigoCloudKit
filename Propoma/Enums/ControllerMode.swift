//
//  Enum.swift
//  Propoma
//
//  Created by Alysson Moreira on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import Foundation

enum ControllerMode: Int {
    
    case home = 0
    case favorites
    case shared
    case details
    
    var canCreate: Bool {
        
        if self == .home {
            return true
        } else {
            return false
        }
        
    }
    
    var canShare: Bool {
        
        if self == .home {
            return false
        } else {
            return true
        }
        
    }
    
    var title: String {
        switch self {
        case .home:
            return "Inicio"
        case .favorites:
            return "Favoritos"
        case .shared:
            return "Compartilhamentos"
        case .details:
            return "Resultados"
        }
    }
    
}
