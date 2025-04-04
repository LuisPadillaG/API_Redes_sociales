//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 4/2/25.
//

import SwiftUI

class DragonBallAPI: Codable{
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultado?{
        let ubicacion_recursos = "/characters"
        
        return await descargar(recurso: ubicacion_recursos)
    }
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.malaDireccionUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                        
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo ES \(error.debugDescription) ")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
            
            
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
            print("en dragon ball api")
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
