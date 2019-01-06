# MRHttpResponseParse
Parse the response of HTTP easily


It depends on YYModel
 
  Parse Steps:<br/>
   Step 1:
    #import "NSObject+MRHttpResponseParse.h"
   Step 2:
    [needParseInstance parseWithPath:path];
 
  The examples for setting the path
    - Model     ModelA
       @"ModelA:xx.xx.aDictionary"       --->  return the instance of ModelA;
    - Models    ModelA
       @"ModelA:xx.xx.aDictionaryArray"  --->  return the array of instances of ModelA;
    - NSDictionary
       @"NSDictionary:xx.xx.aDictionary" --->  return the dictionary;
    - NSArray
       @"NSArray:xx.xx.aArray"           --->  return the array;
    - Other types  (NSString/NSNumber/NSInteger/CGFloat/double/long/BOOL and class the cannot be recognized)
       @"NSString:xx.xx.xx"              --->  return the string;
    - Object At index of a array
       @"ModelA:xx.xx.aArray[3]"         --->  return the instance of ModelA at a array's 3rd;
       @"ModelA:xx.xx.aArray[3].xx.aDictionary" --->  return the instance of ModelA at a array's 3rd dictionary keyPath;
       @"NSDictionary:xx.xx.aArray[3]"   --->  return the dictionary at a array's 3rd;
