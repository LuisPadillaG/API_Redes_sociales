//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    //@StateObject var controlador = ControladorPublicaciones() //guardamos la informacion quequeremos guardar
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    NavigationLink{
                        Text("Hola mundo")
                    } label : {
                        HStack{
                            Text("\(publicacion.id)")
                            VStack{
                                Text("\(publicacion.title)")
                                Text("\(publicacion.body)")
                            }
                        }.onTapGesture {
                            print("Utd ha seleccionado \(publicacion.id)")
                        }
                    }
                    
                }
            }
        }
        .onAppear{
            /*if controlador.publicaciones.isEmpty{}
                    Task{
                await controlador.obtener_publicaciones()
            }*/
            print("No eres necesario onAppear")
        }
    }
        
}
#Preview {
    GeneralPublicaciones()
}
