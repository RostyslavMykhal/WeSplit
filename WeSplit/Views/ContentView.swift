//
//  ContentView.swift
//  WeSplit
//
//  Created by Elliott Miller on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @StateObject private var viewModel = ContentViewModel()

    

    var body: some View {

        NavigationView {
                Form {
                    Section {
                        TextField("Amount", value: $viewModel.checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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

                        Picker("Number of people", selection: $viewModel.numberOfPeople){
                            ForEach(2..<10){
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $viewModel.tipPercentage){
                                ForEach(viewModel.tipPercentList, id: \.self){
                                    Text($0, format: .percent)
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                    Section(header: Text("Amount from person")) {
                        Text(viewModel.totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    Section(header: Text("Amount without tip")){
                        Text(viewModel.totalCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    Section(header: Text("Amount with tip, but no separate between people")){
                        Text(viewModel.checkWithTipOnly, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
