//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    var comentario: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var mono_chino_seleccionado: MonoChino? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    var pagina_resultados: PaginaResultado? = nil
    var personaje: MonoChino? = nil
    
    var pagina_resultados_planeta: PaginaResultadoPlaneta? = nil
    var planeta: Planeta? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
        }
    }
    func descargar_monos_chinos() async {
        print("Funciona por favor, estamos aqui")
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else {return}
        print(pagina_descargada)
        self.pagina_resultados = pagina_descargada
    }
    func descargar_info_personaje(id: Int) async{
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = mono_chino
    }
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func descargar_planetas() async {
            print("Funciona por favor, estamos aqui")
            guard let pagina_descargada: PaginaResultadoPlaneta = try? await DragonBallAPI().descargar_pagina_planetas() else {return}
            print(pagina_descargada)
            self.pagina_resultados_planeta = pagina_descargada
        }
        
        func descargar_info_planetas(id: Int) async {
            guard let planeta: Planeta = try? await DragonBallAPI().descargar_informacion_planetas(id: id) else {return}
            
            self.planeta = planeta
        }
        
        func descargar_informacion_planeta(id: Int){
           Task.detached(operation: {
                await self.descargar_info_planetas(id: id)
            })
        }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mandó allamar despu+es de todos los awaits en mi función \(#function)")
        }
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else{return}
        
        publicaciones = publicaciones_descargadas
        
    }
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi function \(#function)")
        }
        guard let comentario_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else {return}
        
        comentario = comentario_descargados
    }
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
    }
    
     
    
    
    func descargar_perfil(id: Int) async -> Void {
        
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else {return}
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id:)
        }
    }
}
