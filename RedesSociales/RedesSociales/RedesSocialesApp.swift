//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI
@MainActor
@main
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            GeneralPublicaciones()
                .environment(controlador)
        }
    }
}
