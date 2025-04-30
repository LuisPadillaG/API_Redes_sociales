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
                                ScrollView{
                                    AsyncImage(url: URL(string: controlador.personaje?.image ?? "")) { phase in
                                            if let image = phase.image {
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 100)
                                            } else if phase.error != nil {
                                                Color.red
                                            }
                                        }
                                        if let planeta = controlador.personaje?.originPlanet?.name {
                                            Text(" Planeta: \(planeta)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                        } else {
                                            Text(" Planeta: Desconocido")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                        }
                                        if let nombre = controlador.personaje?.name {
                                            Text(" Hola, soy \(nombre)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 20))
                                        } else {
                                            Text(" Hola, soy Sin nombre")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 20))
                                        }
                                    Text("Poder:")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16))
                                    HStack{
                                        Text("Ki base: \(controlador.personaje?.ki)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.system(size: 14))
                                        Text("Ki maximo: \(controlador.personaje?.maxKi)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.system(size: 14))
                                    }
                                    
                                    Text("Raza: \(controlador.personaje?.race)")
                                    Text("Genero: \(controlador.personaje?.gender)")
                                    Text("Descripcion: \(controlador.personaje?.description)")
                                }
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
