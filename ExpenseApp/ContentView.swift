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
        VStack{
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 150)
                Text("$\(totalBalance, specifier: "%.2f")")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding()
            
            List {
                ForEach(transactions) { transaction in
                    VStack(alignment: .leading) {
                        Text(transaction.description)
                            .font(.headline)
                            .foregroundColor(transaction.type == "Expense" ? .red : .green)
                        Text("$\(transaction.amount, specifier: "%.2f")")
                    }
                }
// this is where the swipe to delete function will go
            }
            

            
        }// end of the VStack
        
    }// end of the body struct
    
    func addTransaction() {
        guard let amount = Double(newAmount), !selectedType.isEmpty else { return }

        let transaction = TransactionItem(type: selectedType, description: newDescription, amount: amount)
        transactions.append(transaction)

        newDescription = ""
        newAmount = ""
        selectedType = ""

        updateTotalBalance()
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
        updateTotalBalance()
    }

    func updateTotalBalance() {
        totalBalance = transactions.reduce(0) { result, transaction in
            if transaction.type == "Expense" {
                return result - transaction.amount
            } else {
                return result + transaction.amount
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
