# MRHttpResponseParse
Parse the response of HTTP easily


It depends on YYModel (https://github.com/ibireme/YYModel)
 
  Parse Steps:<br/>
   Step 1:<br/>
    #import "NSObject+MRHttpResponseParse.h"<br/>
   Step 2:<br/>
    [needParseInstance parseWithPath:path];<br/>
 
  The examples for setting the path<br/>
    - Model     ModelA<br/> 
       @"ModelA:xx.xx.aDictionary"        --->  return the instance of ModelA;<br/>
    - Models    ModelA<br/>
       @"ModelA:xx.xx.aDictionaryArray"   --->  return the array of instances of ModelA;<br/>
    - NSDictionary<br/>
       @"NSDictionary:xx.xx.aDictionary"  --->  return the dictionary;<br/>
    - NSArray<br/>
       @"NSArray:xx.xx.anArray"           --->  return the array;<br/>
    - Other types  (NSString/NSNumber/NSInteger/CGFloat/double/long/BOOL and class the cannot be recognized)<br/>
       @"NSString:xx.xx.xx"               --->  return the string;<br/>
    - Object At index of an array<br/>
       @"ModelA:xx.xx.anArray[3]"         --->  return the instance of ModelA at an array's 3rd;<br/>
       @"ModelA:xx.xx.anArray[3].xx.aDictionary" --->  return the instance of ModelA at an array's 3rd dictionary keyPath;<br/>
       @"NSDictionary:xx.xx.anArray[3]"   --->  return the dictionary at an array's 3rd;<br/>
