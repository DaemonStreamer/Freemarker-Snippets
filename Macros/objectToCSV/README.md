# objectToCSV
Print an object to CSV.

inputObject structure.
"headers" is an array containing strings that are identical to the Keys in stored in stored array+hash field named "rows".

<details>
<summary>Click show code</summary>

``` FTL
<#noparse>
<#-- <@objectToCSV inputObject=_object hasHeaders=true separator=";" textQualifier="" /> -->
<#macro objectToCSV inputObject hasHeaders=true separator=";" textQualifier="">
<#list inputObject["headers"] as header>${textQualifier}${header}${textQualifier}<#sep>${separator}</#list>
<#list inputObject["rows"] as entry><#list inputObject["headers"] as header>${textQualifier}${entry[header]!""}${textQualifier}<#sep>${separator}</#list><#sep>
</#list><#return></#macro>
</#noparse>
```

</details>

Example inputObject:  
``` Json
{
 "headers": ["ID","name","domain"],
 "rows": [{
   "ID": "123",
   "name": "server100",
   "job": "unknown"
  }, {
   "ID": "456",
   "name": "server300",
   "domain": "dingus.com"
  }
 ]
}
```
Example output:
``` CSV
"ID";"name";"domain"
"123";"server100";""
"456";"server300";"dingus.com"
```