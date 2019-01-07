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
       @"ModelA:xx.xx.aDictionary"        <br/>  return the instance of ModelA;<br/>
       <br/>
    - Models    ModelA<br/>
       @"ModelA:xx.xx.aDictionaryArray"   <br/>  return the array of instances of ModelA;<br/><br/>
    - NSDictionary<br/>
       @"NSDictionary:xx.xx.aDictionary"  <br/>  return the dictionary;<br/><br/>
    - NSArray<br/>
       @"NSArray:xx.xx.anArray"           <br/>  return the array;<br/><br/>
    - Other types  (NSString/NSNumber/NSInteger/CGFloat/double/long/BOOL and class the cannot be recognized)<br/>
       @"NSString:xx.xx.xx"               <br/>  return the string;<br/><br/>
    - Object At index of an array<br/>
       @"ModelA:xx.xx.anArray[3]"         <br/>  return the instance of ModelA at an array's 3rd;<br/><br/>
       @"ModelA:xx.xx.anArray[3].xx.aDictionary" <br/>  return the instance of ModelA at an array's 3rd dictionary keyPath;<br/><br/>
       @"NSDictionary:xx.xx.anArray[3]"   <br/>  return the dictionary at an array's 3rd;<br/><br/>

<br/>
中文说明：<br/>
此解析依赖于库 YYModel (https://github.com/ibireme/YYModel)
 
使用步骤:<br/>
   步骤 1:<br/>
    #import "NSObject+MRHttpResponseParse.h"<br/>
   步骤 2:<br/>
    [needParseInstance parseWithPath:path];<br/>
 
 设置解析路径的例子<br/>
    - Model     ModelA<br/> 
       @"ModelA:xx.xx.aDictionary"        <br/>  以路径的最后节点为 key，取出字典后,生成ModelA的一个实例;<br/><br/>
    - Models    ModelA<br/>
       @"ModelA:xx.xx.aDictionaryArray"   <br/>  以路径的最后节点为 key，取出包含字典的数组后，生成ModelA的实例数组;<br/><br/>
    - NSDictionary<br/>
       @"NSDictionary:xx.xx.aDictionary"  <br/>  以路径的最后节点为 key，取出字典后，返回该字典;<br/><br/>
    - NSArray<br/>
       @"NSArray:xx.xx.anArray"           <br/>  以路径的最后节点为 key，取出数组后，返回该数组;<br/><br/>
    - Other types  (NSString/NSNumber/NSInteger/CGFloat/double/long/BOOL and class the cannot be recognized)<br/>
       @"NSString:xx.xx.xx"               <br/>  除字典、数组、指定的类型外，所有的数据都统一解析成字符串;<br/><br/>
    - Object At index of an array<br/>
       @"ModelA:xx.xx.anArray[3]"         <br/>  用数组的第三条数据生成ModelA的一个实例;<br/><br/>
       @"ModelA:xx.xx.anArray[3].xx.aDictionary" <br/>  以数组的第三条字典数据中数据生成ModelA的一个实例;<br/><br/>
       @"NSDictionary:xx.xx.anArray[3]"   <br/>  取数组中的第三条数据;<br/><br/>
