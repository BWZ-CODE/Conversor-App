//
//  longitud.swift
//  Conversor App
//
//  Created by Miguel Angel Bohorquez on 17/07/25.
//

import SwiftUI

struct longitud: View {
    @State private var unidadOrigen = "Km"
    @State private var unidadDestino = "Millas"
    private var unidades = ["mm","Km", "Millas", "Yardas", "Centímetros", "Metros"]
    private var unidadesOriges = ["Km","Centímetros"]
    @State private var valor: Double = 1.0
    @FocusState private var isFocused: Bool
    
    var mmAkm : Double {
        let result = valor / 1000000
        return result
    }
    
    var kmAmillas : Double {
        let result = valor * 0.621371
        return result
    }
    
    var kmAyardas : Double {
        let result = valor * 1093.61
        return result
    }
    
    var kmAcentimetros : Double {
        let result = valor * 100000
        return result
    }
    
    var kmAmmetros : Double {
        let result = valor * 1000000
        return result
    }
    
    var kmAmetros : Double {
        let result = valor * 1000
        return result
    }
    
    var millasAkm : Double {
        let result = valor / 0.621371
        return result
    }
    
    var millasAyardas : Double {
        let result = valor * 1760
        return result
    }
    
    var millasAcentimetros : Double {
        let result = valor * 1609.34
        return result
    }
    
    var millasAmmetros : Double {
        let result = valor * 1609.34
        return result
    }
    
    var yardasAkm : Double {
        let result = valor / 1093.61
        return result
    }
    
    var yardasAmmetros : Double {
        let result = valor * 0.9144
        return result
    }
    
    var centimetrosAkm : Double {
        let result = valor / 100000
        return result
    }
    
    var centimetrosAmmetros : Double {
        let result = valor / 100
        return result
    }
    var centimetrosAMillas : Double {
        let result = valor / 1609.34
        return result
    }
    var centimetersAYardas : Double {
        let result = valor / 0.9144
        return result
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color2.edgesIgnoringSafeArea(.all)
                Form{
                    Section{
                        Picker("De", selection: $unidadOrigen){
                            ForEach (unidadesOriges, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.palette)
                    }
                    Section(header: Text("Resultado en")){
                        Picker("A", selection: $unidadDestino){
                            ForEach (unidades, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.wheel).frame(height:100)
                    }
                    Section(header: Text("Cuanto quieres convertir?")){
                        TextField("", value: $valor, format: .number).keyboardType(.decimalPad).focused($isFocused)
                    }
                    Section{
                        if unidadOrigen == "Centímetros" && unidadDestino == "Km"{
                            Text("\(centimetrosAkm.formatted(.number.precision(.fractionLength(2)))) km")
                        }
                        else if unidadOrigen == "Centímetros" && unidadDestino == "Metros"{
                            Text("\(centimetrosAmmetros.formatted(.number.precision(.fractionLength(2)))) metros")
                        }
                        else if unidadOrigen == "Centímetros" && unidadDestino == "mm"{
                            Text("\(centimetrosAmmetros.formatted(.number.precision(.fractionLength(2)))) milimetros")
                        }
                        else if unidadOrigen == "Centímetros" && unidadDestino == "Millas"{
                            Text("\(centimetrosAMillas.formatted(.number.precision(.fractionLength(2)))) Millas")
                        }
                        else if unidadOrigen == "Centímetros" && unidadDestino == "Yardas"{
                            Text("\(centimetersAYardas.formatted(.number.precision(.fractionLength(2)))) Yardas")
                        }
                        else if unidadOrigen == "Km" && unidadDestino == "mm"{
                            Text("\(kmAmmetros.formatted(.number.precision(.fractionLength(2)))) milimetros")
                        }
                        else if unidadOrigen == "Km" && unidadDestino == "Millas"{
                            Text("\(kmAmillas.formatted(.number.precision(.fractionLength(2)))) Millas")
                        }
                        else if unidadOrigen == "Km" && unidadDestino == "Yardas"{
                            Text("\(kmAyardas.formatted(.number.precision(.fractionLength(2)))) Yardas")
                        }
                        else if unidadOrigen == "Km" && unidadDestino == "Centímetros"{
                            Text("\(kmAcentimetros.formatted(.number.precision(.fractionLength(2)))) Centimetros")
                        }
                        else if unidadOrigen == "Km" && unidadDestino == "Metros"{
                            Text("\(kmAmetros.formatted(.number.precision(.fractionLength(2)))) metros")
                        }
                        else {
                            Text("El resultado es el mismo que la entrada 😄 \(valor)")
                        }
                    }
                    
                }.padding()
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Longitud")
                    .toolbar{
                        if isFocused {
                            Button("Ya está bien 😄"){
                                isFocused = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    longitud()
}
