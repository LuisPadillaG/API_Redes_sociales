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
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mandó allamar despu+es de todos los awaits en mi función \(#function)")
        }
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else{return}
        
        publicaciones = publicaciones_descargadas
        
    }
}
