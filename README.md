# MRHttpResponseParse
Parse the response of HTTP easily


It depends on YYModel
 
  Parse Steps:<br/>
   Step 1:<br/>
    #import "NSObject+MRHttpResponseParse.h"<br/>
   Step 2:<br/>
    [needParseInstance parseWithPath:path];<br/>
 
  The examples for setting the path<br/>
    - Model     ModelA<br/>
       @"ModelA:xx.xx.aDictionary"       --->  return the instance of ModelA;<br/>
    - Models    ModelA<br/>
       @"ModelA:xx.xx.aDictionaryArray"  --->  return the array of instances of ModelA;<br/>
    - NSDictionary<br/>
       @"NSDictionary:xx.xx.aDictionary" --->  return the dictionary;<br/>
    - NSArray<br/>
       @"NSArray:xx.xx.aArray"           --->  return the array;<br/>
    - Other types  (NSString/NSNumber/NSInteger/CGFloat/double/long/BOOL and class the cannot be recognized)<br/>
       @"NSString:xx.xx.xx"              --->  return the string;<br/>
    - Object At index of a array<br/>
       @"ModelA:xx.xx.aArray[3]"         --->  return the instance of ModelA at a array's 3rd;<br/>
       @"ModelA:xx.xx.aArray[3].xx.aDictionary" --->  return the instance of ModelA at a array's 3rd dictionary keyPath;<br/>
       @"NSDictionary:xx.xx.aArray[3]"   --->  return the dictionary at a array's 3rd;<br/>
