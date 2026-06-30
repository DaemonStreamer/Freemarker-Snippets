<#noparse>
<#-- objectToCSV v1.0.0 -->
<#-- <@objectToCSV inputObject=_object hasHeaders=true separator=";" textQualifier="" /> -->
<#macro objectToCSV inputObject hasHeaders=true separator=";" textQualifier="">
<#list inputObject["headers"] as header>${textQualifier}${header}${textQualifier}<#sep>${separator}</#list>
<#list inputObject["rows"] as entry><#list inputObject["headers"] as header>${textQualifier}${entry[header]!""}${textQualifier}<#sep>${separator}</#list><#sep>
</#list><#return></#macro>
</#noparse>