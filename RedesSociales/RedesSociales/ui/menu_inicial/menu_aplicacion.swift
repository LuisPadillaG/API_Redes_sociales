//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            GeneralPublicaciones()
                .tabItem { Label("Es esta una pantalla", systemImage: "Circle") }
                .badge(controlador.publicaciones.count)
            Text("Hola mundo")
                .tabItem { Label("Es esta una pantalla", systemImage: "Circle") }
            Text("Hola desde pantalla 3")
                .tabItem {
                    Label{
                        VStack{
                            Text("Hola mundo desde aca abajo")
                                .font(.custom("BungeeTint-Regular", size: 34))
                            Text("Este es un 2do clic")
                        }
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("Holaaa"))
                    }
                }
        }
    }
}
#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
