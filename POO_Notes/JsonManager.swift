/*==================================*/
import Foundation
/*==================================*/
class JsonManager
{
    /* ------------------------------------- */
    var jsonParsed:NSMutableDictionary = [:]
    var urlToJsonFile: String = ""
        /* ------------------------------------- */
    init(urlToJsonFile: String)
    {
        self.urlToJsonFile = urlToJsonFile
    }
    /* ------------------------------------- */
    func parser(_ jsonFilePath: String) -> NSMutableDictionary
    {
        let data = try! Data(contentsOf: URL(string: jsonFilePath)!)
        return try! JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
    }
    /* ------------------------------------- */
    func importJSON()
    {
        self.jsonParsed = self.parser(self.urlToJsonFile)
    }
    
    
    func parseJsonDict(objTestAdd: Add) {
        
        var x : String
        objTestAdd.keys = []
        objTestAdd.values = []
        
        for (k, v) in self.jsonParsed {
            objTestAdd.keys.append(k as! String)
            x = v as! String
            
            if x == "false"{
                objTestAdd.values.append(false)
            }
            else {
                objTestAdd.values.append(true)
            }
            
        }
        
        for i in 0 ..< objTestAdd.keys.count{
            
            objTestAdd.dictionnary[objTestAdd.keys[i]] = objTestAdd.values[i]
        }
        
        print(objTestAdd.values)
        print(objTestAdd.keys)
        print(objTestAdd.dictionnary)
        
    }
    
    
}
/*==================================*/















