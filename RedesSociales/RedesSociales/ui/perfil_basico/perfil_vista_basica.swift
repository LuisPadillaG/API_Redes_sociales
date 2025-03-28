//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Puede que no")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Puede que no")")
            .onDisappear(){
                print("Adios mundo cruel, pero este mensaje solo aparece cuando destruimos la vista")
            }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
