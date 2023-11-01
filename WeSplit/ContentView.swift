//
//  ContentView.swift
//  WeSplit
//
//  Created by Elliott Miller on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    @State private var numberOfPeople = 2
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 10
    
    let tipPercentList = [0,5,10,15,20,25]
    
    var body: some View {
        var totalPerPerson: Double{
            let peopleCount = Double(numberOfPeople + 2)
            let tipSeletion = Double(tipPercentage)
            
            
            let tipValue = checkAmount / 100 * tipSeletion
            let grandTotal = checkAmount + tipValue
            let amountPerPerson = grandTotal / peopleCount
            
            
            return amountPerPerson
        }
        var totalCheck: Double{
            let peopleCount = Double(numberOfPeople + 2)
            let withoutTip = checkAmount / peopleCount
            return withoutTip
        }
        var checkWithTipOnly: Double{
            let tipSelection = Double(tipPercentage)
            
            let tipValue = checkAmount / 100 * tipSelection
            let wholeAmount = checkAmount + tipValue
            return wholeAmount
        }
        

        
        NavigationView {
            
        
                Form {
                    Section {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()

                                    Button("Done") {
                                        amountIsFocused = false
                                    }
                                }
                            }
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2..<10){
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section(header: Text("How much tip do you want to leave?")) {
                            Picker("Tip percentage", selection: $tipPercentage){
                                ForEach(tipPercentList, id: \.self){
                                    Text($0, format: .percent)
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                    Section(header: Text("Amount from person")) {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    Section(header: Text("Amount without tip")){
                        Text(totalCheck, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    Section(header: Text("Amount with tip, but no separate between people")){
                        Text(checkWithTipOnly, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }

                    
                }
                .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
