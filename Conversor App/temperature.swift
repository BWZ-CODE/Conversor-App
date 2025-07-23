//
//  temperature.swift
//  Conversor App
//
//  Created by Miguel Angel Bohorquez on 17/07/25.
//

import SwiftUI

struct temperature: View {
    @State private var unidadOrigen = "Fahrenheit"
    @State private var unidadDestino = "Celsius"
    @State private var valor: Double = 0.0
    var unidades = ["Fahrenheit", "Celsius", "Kelvin"]
    @FocusState private var isFocused: Bool
    
    var FaC : Double {
        let result = (valor - 32) * 5 / 9
        return result
    }
    var CaK : Double {
        let result = valor + 273.15
        return result
    }
    var KFa : Double {
        let result = valor * 9 / 5 - 459.67
        return result
    }
    var KCa : Double {
        let result = valor - 273.15
        return result
    }
    var CFa : Double {
        let result = valor * 9 / 5 + 32
        return result
    }
    var FaK : Double {
        let result = valor + 459.67
        return result
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.color1.ignoresSafeArea(.all)
                VStack{
                    Form{
                        Section(header: Text ("Seleccion de unidades")) {
                            Picker("De", selection: $unidadOrigen){
                                ForEach(unidades, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            Picker("A", selection: $unidadDestino){
                                ForEach(unidades, id: \.self){
                                    Text("\($0)")
                                }
                            }.pickerStyle(.automatic)
                            
                            
                        }
                        Section(header: Text("Valor")) {
                            TextField("Valor a convertir", value: $valor, format: .number).keyboardType(.decimalPad).focused($isFocused)
                        }
                        Section(header: Text("Resultado")) {
                            if unidadOrigen == "Fahrenheit" && unidadDestino == "Celsius" {
                                Text("\(FaC.formatted(.number.precision(.fractionLength(2)))) °C")
                            } else if unidadOrigen == "Fahrenheit" && unidadDestino == "Kelvin" {
                                Text("\(FaK.formatted(.number.precision(.fractionLength(2)))) °K")
                            } else if unidadOrigen == "Celsius" && unidadDestino == "Fahrenheit" {
                                Text("\(CFa.formatted(.number.precision(.fractionLength(2)))) °F")
                            } else if unidadOrigen == "Celsius" && unidadDestino == "Kelvin" {
                                Text("\(CaK.formatted(.number.precision(.fractionLength(2)))) °K")
                            } else if unidadOrigen == "Kelvin" && unidadDestino == "Fahrenheit" {
                                Text("\(KFa.formatted(.number.precision(.fractionLength(2)))) °F")
                            } else if unidadOrigen == "Kelvin" && unidadDestino == "Celsius" {
                                Text("\(KCa.formatted(.number.precision(.fractionLength(2)))) °C")
                            } else {
                                Text("El resultado es el mismo")
                            }
                        }
                    }.padding()
                        .scrollContentBackground(.hidden)
                        .navigationTitle("Temperature")
                        .toolbar {
                            if isFocused {
                                Button("Done"){
                                    isFocused = false
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    temperature()
}
