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
                .tabItem { Label("Cuentas y tal", systemImage: "Circle") }
                .badge(controlador.publicaciones.count)
            PantallaPersonaje()
                .tabItem { Label("Dragon Ball DB", systemImage: "Circle") }
            Text("Hola desde pantalla 3")
                .tabItem {
                    Label{
                        VStack{
                            Text("Pantallita 3")
                                //.//font(.custom("BungeeTint-Regular", size: 34))
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
