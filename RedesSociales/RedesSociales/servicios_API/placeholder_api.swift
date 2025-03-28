//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI : Codable{
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones() async -> [Publicacion]?{
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    func descargar_comentarios(post_id: Int) async -> [Comentario]?{
        let ubicacion_recurso = "/posts\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(url_de_servicio)/posts") else { throw ErroresDeRed.malaDireccionUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
        } catch ErroresDeRed.malaDireccionUrl {
            print("Tienes mal la url, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salió mal con la respuesta, revisa porfas")
        }
        catch ErroresDeRed.badStatus {
            print("Como conseguiste un status de algo que ni se mueve? wtf")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementación de este")
        }
        catch ErroresDeRed.invalidRequest{
            print("Literal quien sabe comom hiciste este error man, neta")
        }
        catch{
            print("Algo terriblemente mal que no se que es, paso. No deberia pasar eso")
        }
        return nil
    }
}









/*do{
    guard let url = URL(string: "\(url_de_servicio)/posts") else { throw ErroresDeRed.malaDireccionUrl}
    let (datos, respuesta) = try await URLSession.shared.data(from: url)
    guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
    guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
    guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else { throw ErroresDeRed.fallaAlConvertirLaRespuesta}
    
    return respuesta_decodificada
} catch ErroresDeRed.malaDireccionUrl {
    print("Tienes mal la url, cambiala")
}
catch ErroresDeRed.badResponse {
    print("Algo salió mal con la respuesta, revisa porfas")
}
catch ErroresDeRed.badStatus {
    print("Como conseguiste un status de algo que ni se mueve? wtf")
}
catch ErroresDeRed.fallaAlConvertirLaRespuesta {
    print("Tienes mal el modelo o la implementación de este")
}
catch ErroresDeRed.invalidRequest{
    print("Literal quien sabe comom hiciste este error man, neta")
}
catch{
    print("Algo terriblemente mal que no se que es, paso. No deberia pasar eso")
}
return nil*/
