//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI
// Para que puedas cargar una imagen por default cuando descargues la imagen
/*
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
 */
struct PantallaPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                                
                                //Text("Hola mundo\(controlador.personaje?.transformations?.name)")
                                AsyncImage(url: URL(string: controlador.personaje?.image?))
                                Text("Hola mundo: \(controlador.personaje?.originPlanet?.name)")
                                Text("Hola mundo: \(controlador.personaje?.name)")
                                Text("Hola mundo: \(controlador.personaje?.ki)")
                                Text("Hola mundo: \(controlador.personaje?.ki)")
                                Text("Ki maximo: \(controlador.personaje?.maxKi)")
                                Text("Raza: \(controlador.personaje?.race)")
                                Text("Genero: \(controlador.personaje?.gender)")
                                Text("Descripcion: \(controlador.personaje?.description)")
                                /*
                                 let maxKi: String
                                 let race: String
                                 let gender: String
                                 let description: String
                                 let image:String
                                 let affiliation: String
                                 */
                            }label: {
                                Text("El personaje es \(personaje.name)")
                                AsyncImage(url: URL(string: personaje.image))
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador
                                    .descargar_informacion_personaje(id:
                                                                personaje.id)
                            }))
                        }
                    }
                }
            }
        }
        
    }
}
/*
 
 */
#Preview {
    PantallaPersonaje()
        .environment(ControladorAplicacion())
}
