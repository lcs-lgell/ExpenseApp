//
//  Entry.swift
//  ExpenseApp
//
//  Created by Leon Gell on 2023-06-04.
//

import Blackbird
import SwiftUI

struct Entry: BlackbirdModel {
    
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var type_id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var value: Double
    
}
