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
                                Spacer()
                                Text("\(publicacion.id)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Spacer()
                                Spacer()
                                HStack{
                                    Text("\(publicacion.title)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white.opacity(0.5))
                                    Spacer()
                                    Text("\(publicacion.body)")
                                        .foregroundColor(.white.opacity(0.85))
                                }
                                Spacer()
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
            }.background(.black.opacity(0.9))
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
