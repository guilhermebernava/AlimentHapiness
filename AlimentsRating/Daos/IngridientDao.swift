//
//  IngridientDao.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 30/06/22.
//

import Foundation

class IngridientDao{
    
    static func GetFolderIngredients() -> URL?{
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            //cria uma pasta nesse diretorio
            let folder = dir.appendingPathComponent("Ingredients")
            return folder
        }
        return nil
    }
    
    static func GetIngridientsFromFile() -> [Ingridient]?{
        guard let folder = GetFolderIngredients() else {return nil}
        
        do{
            let data = try Data(contentsOf: folder)
            guard let ingridients = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Ingridient] else {return nil}
            
            return ingridients
        }catch{
            print(error.localizedDescription)
        }
        return nil
    }
    
    static func SaveIngridientInFile(_ ingridients: [Ingridient]){
        guard let folder = GetFolderIngredients() else {return}
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: ingridients, requiringSecureCoding: false)
            try data.write(to: folder)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}
