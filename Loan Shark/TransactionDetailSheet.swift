//
//  TransactionDetailSheet.swift
//  Loan Shark
//
//  Created by Ethan Lim on 30/10/22.
//

import SwiftUI

struct TransactionDetailSheet: View {
    
    @Binding var transaction: Transaction
    
    @State var isDetailSyncronised: Bool = false
    
    @State var dueDate = Date()
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    HStack{
                        Text("Title")
                        TextField("Add title", text: $transaction.name)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("People involved:")
                        TextField("Add people", text: $transaction.people)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Amount of money owed:")
                        TextField("Add amount of money owed", value: $transaction.money, formatter: NumberFormatter())
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                }
                Form{
                    Toggle(isOn: $isDetailSyncronised){
                        Text("Syncronise details")
                    }
                    DatePicker("Due by", selection: $dueDate, in: dueDate, displayedComponents: .date)
                    
                }
                Button{
                    print("Saved transaction")
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 100, height: 50)
                            .cornerRadius(10)
                        Text("Save")
                            .foregroundColor(.white) //Note: To find out how to remove white background around save button
            }
            .navigationTitle("Details")
                }
            }
        }
    }
}
struct TransactionDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailSheet(transaction: .constant(Transaction(name: "Meal", people: "Jason", money: 50, appliedTags: [0], dueDate: 2022-12-25))))
    }
}
