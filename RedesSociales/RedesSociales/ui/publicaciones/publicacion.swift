//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI
let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem", body: "Et dolor sit amet")
struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title ?? "Valor por defecto")")
        Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")
        
        NavigationLink{
            PerfilBasicoVista()
        } label: {
            Text("ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))
        ScrollView{
            ForEach(controlador.comentario){ comentario in
                Text("Usuario: \(comentario.name)")
                Text("\(comentario.body)")
            }
            VStack{
                // ForEach
            }
        }
    }
}
#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
