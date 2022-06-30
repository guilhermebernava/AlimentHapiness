//
//  AlimentDao.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 30/06/22.
//

import Foundation

class AlimentDao {
    static func GetFolderAliments() -> URL?{
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            //cria uma pasta nesse diretorio
            let folder = dir.appendingPathComponent("Aliments")
            return folder
        }
        return nil
    }
    
    static func GetAlimentsFromFile() -> [Aliment]?{
        guard let folder = GetFolderAliments() else {return nil}
        
        do{
            let data = try Data(contentsOf: folder)
            guard let aliments = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Aliment] else {return nil}
            
            return aliments
        }catch{
            print(error.localizedDescription)
        }
        return nil
    }
    
    static func SaveAlimentsInFile(_ aliments: [Aliment]) {
        guard let folder = GetFolderAliments() else {return}
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: aliments, requiringSecureCoding: false)
            try data.write(to: folder)
        } catch {
            print(error.localizedDescription)
        }
    }
    

}
