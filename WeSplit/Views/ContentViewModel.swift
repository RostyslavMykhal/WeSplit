//
//  ContentViewModel.swift
//  WeSplit
//
//  Created by Elliott Miller on 13.09.2023.
//

import Foundation

final class ContentViewModel: ObservableObject{
    @Published var numberOfPeople = 2
    @Published var checkAmount = 0.0
    @Published var tipPercentage = 10
    
    
    let tipPercentList = [0,5,10,15,20,25]
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




}
