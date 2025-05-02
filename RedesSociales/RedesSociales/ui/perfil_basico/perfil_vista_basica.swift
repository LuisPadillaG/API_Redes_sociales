//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI
//Para usar la galeria
import PhotosUI

struct PerfilBasicoVista: View {
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    @Environment(ControladorAplicacion.self) var controlador
    
    
    var body: some View {
        /*
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Puede que no")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Puede que no")")
            .onDisappear(){
                print("Adios mundo cruel, pero este mensaje solo aparece cuando destruimos la vista")
            }
         */
        ScrollView{
            VStack{
                Spacer()
                Spacer()
                PhotosPicker(selection: $foto_seleccionada){
                    Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatar))
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .clipShape(.circle)
                }
                .onChange(of: foto_seleccionada){ valor_anterior, valor_nuevo in
                    Task{
                        if let foto_seleccionada, let datos = try? await
                            foto_seleccionada.loadTransferable(type: Data.self){
                            if let imagen = UIImage(data: datos){
                                foto_a_mostrar = imagen
                            }
                        }
                    }
                }
                Spacer()
                Text("User: \(controlador.perfil_a_mostrar?.username ?? "Mati")")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Matilda Rodriguez")")
                    .foregroundColor(.white)
                Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "matilamasbellaka@gmail.com")")
                    .foregroundColor(.white)
                    .onDisappear(){
                        print("Adios mundo cruel, pero este mensaje solo aparece cuando destruimos la vista")
                    }
                Spacer()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }.background(.black.opacity(0.9))
    }
    
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
