//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI
struct GeneralPublicaciones: View {
   // @StateObject var controlador = ControladorPublicaciones() //guardamos la informacion quequeremos guardar
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        }label:{
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }
                            
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
                        
                        /*.onTapGesture {
                            controlador
                                .mostrar_publicacion(publicacion.id)
                            print("Ha seleccionado: \(publicacion.id)")
                        }*/
                    }
                }
            }
        }
        .onAppear{
            print("Hi world")
        }
    }
}
 
#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
