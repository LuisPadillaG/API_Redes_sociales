//
//  pantalla_personaje_individual.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PantallaIndividual: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(controlador.mono_chino_seleccionado?.name ?? "Valor por defecto")")
        
        /*NavigationLink{
            PerfilBasicoVista()
        } label: {
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))*/
    }
}

#Preview {
    PantallaIndividual()
}
