//
//  ContentView.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeneralPublicaciones()
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}

