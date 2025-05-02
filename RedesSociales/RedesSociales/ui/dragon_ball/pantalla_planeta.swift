//
//  planeta.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI
// Para que puedas cargar una imagen por default cuando descargues la imagen
/*
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
 */
struct PantallaPlaneta: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_planeta != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                                
                                //Text("Hola mundo\(controlador.personaje?.transformations?.name)")
                                ScrollView{
                                    ZStack{
                                        Rectangle()
                                            .background(Color.green.opacity(0.5))
                                            .cornerRadius(50)                                      .foregroundColor(Color.gray.opacity(0))
                                            .background(
                                                Image("namek")
                                                    .resizable()
                                                    .scaledToFill()
                                            )
                                            .cornerRadius(50)
                                        AsyncImage(url: URL(string: controlador.personaje?.image ?? "")) { phase in
                                                if let image = phase.image {
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 400)
                                                } else if phase.error != nil {
                                                    Color.red
                                                }
                                            }
                                    }
                                        if let planeta = controlador.personaje?.originPlanet?.name {
                                            Text(" Planeta: \(planeta)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        } else {
                                            Text(" Planeta: Desconocido")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        if let nombre = controlador.personaje?.name {
                                            Text(" Hola, soy \(nombre)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 20))
                                                .foregroundColor(.green.opacity(0.85))
                                        } else {
                                            Text(" Hola, soy Sin nombre")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 20))
                                                .foregroundColor(.green.opacity(0.85))
                                        }
                                    HStack{
                                        if let raza = controlador.personaje?.race {
                                            Text(" Raza: \(raza)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        } else {
                                            Text(" Raza no identificada")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        if let gender = controlador.personaje?.gender {
                                            Text(" Genero: \(gender)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        } else {
                                            Text(" Genero no Binario")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                    }
                                    Text(" Poder:")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .font(.system(size: 16))
                                        .foregroundColor(.white.opacity(0.85))
                                    HStack{
                                        if let kibase = controlador.personaje?.ki {
                                            Text(" Ki base: \(kibase)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 16))
                                                .foregroundColor(.white.opacity(0.85))
                                        } else {
                                            Text(" Ki desconocido")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 16))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        if let kimaximo = controlador.personaje?.maxKi {
                                            Text(" Ki maximo: \(kimaximo)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 16))
                                                .foregroundColor(.white.opacity(0.85))
                                        } else {
                                            Text(" Ki no identificado")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 16))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                    }
                                    
                                    Spacer()
                                    Spacer()
                                    if let description = controlador.personaje?.description {
                                        Text("\(description)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white.opacity(0.85))
                                    } else {
                                        Text("Personaje con historia desconocida ")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white.opacity(0.85))
                                    }
                                }.background(.black.opacity(0.9))
                                /*
                                 let maxKi: String
                                 let race: String
                                 let gender: String
                                 let description: String
                                 let image:String
                                 let affiliation: String
                                 */
                            }label: {
                                Spacer()
                                Spacer()
                                Text("El personaje es \(personaje.name)")
                                    .font(.system(size: 20))
                                    .foregroundColor(.green.opacity(0.85))
                                Spacer()
                                AsyncImage(url: URL(string: personaje.image)) { phase in
                                                if let image = phase.image {
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(height: 200)
                                                } else if phase.error != nil {
                                                    Color.red
                                                        .frame(height: 200)
                                                } else {
                                                    ProgressView()
                                                        .frame(height: 200)
                                                }
                                            }
                                Spacer()
                                
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador
                                    .descargar_informacion_personaje(id:
                                                                personaje.id)
                            }))
                            .padding(.bottom, 8)
                                        Rectangle() //rectángulo delgado pal el borde
                                            .frame(height: 1)
                                            .foregroundColor(Color.green.opacity(0.5))
                        }
                    }
                }.background(.black.opacity(0.9))
            }
        }else{
            Text("No encontro nada jaja, lol")
        }   
        
    }
}
/*
 
 */
#Preview {
    PantallaPlaneta()
        .environment(ControladorAplicacion())
}
