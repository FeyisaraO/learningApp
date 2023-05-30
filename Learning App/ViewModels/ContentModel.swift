//
//  ContentModel.swift
//  Learning App
//
//  Created by Feyisara Odukoya on 29/05/2023.
//

import Foundation

class ContentModel: ObservableObject{
     
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init(){
        getLocalData()
    }
    
    func getLocalData(){
        
        //get url to json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //read file into data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //try to decode json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //assign parsed modules to module property
            self.modules = modules
        }
        catch{
            //TODO log error
            print("could not parse local data")
        }
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            //read file into data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        }catch{
            //log error
            print("could not parse style data")
        }

        
    }
}
