//
//  ContentView.swift
//  ExpenseApp
//
//  Created by Leon Gell on 2023-06-01.
//

import SwiftUI

struct TransactionItem: Identifiable {
    let id = UUID()
    let type: String
    let description: String
    let amount: Double
}

struct ContentView: View {
    @State var transactions = [TransactionItem]()
    @State var selectedType = ""
    @State var newDescription = ""
    @State var newAmount = ""
    @State var totalBalance = 0.0
    
    let transactionTypes = ["Expense", "Income"]
    var body: some View {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
