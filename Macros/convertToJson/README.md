# convertToJson

Input any object and print it to a JSON string.

<@convertToJson myHash=jsonObject level=0 escape=false />

<a href="/Macros/convertToJson/convertToJson.ftl"><button>Go to code</button></a>


## Parameters
<sub>Mandatory parameters are checked</sub>
- [x] myHash <sup>Hash|Sequence|Collection </sup>  
      *Example:* `.data_model`  
      *Description:* The object to print as a JSON formatted string.
- [x] level <sup>integer</sup>  
      *Example:* `0`  
      *Description:* The start indentation level, for which the macro will be outputting.  
    ```
    0
    |_1
      |_2
    ```
- [x] escape <sup>boolean</sup>  
      *Example:* `false`
      *Description:* Whether or not the printed JSON string should JSON validated.  
      <sup>When "auto escaping" does not occur use, use true.</sup>  
```
Example where auto escape is deactivated, and escape was set to false.
{
    "text": "here I use "quotes" in text"
}
Example where auto escape is active, and escape was set to true.
{
    "text": "here I use \\\"quotes\\\" in text"
}
Example where auto escape is deactivated, and escape was set to true.
{
    "text": "here I use \"quotes\" in text"
}
Example where auto escape is active, and escape was set to false.
{
    "text": "here I use \"quotes\" in text"
}
```

**Example input**
``` cs
<@(_variables["FTL Extension"]?interpret) />
<@convertToJson myHash=.data_model level=0 escape=true />
```

**Example output**
``` Json
{
 "_random": "THIS is a METHOD",
 "_map": "THIS is a METHOD",
 "nolog": "THIS is a Directive",
 "_currentOperator": "0f0df79f-f3e4-4fdd-9f65-8b06545eaa0f",
 "_topdeskUrl": "https://fenrir.topdesk.net",
 "_base64": "THIS is a METHOD",
 "_generatedDocuments": {
 },
 "_request": {
 },
 "_randomUUID": "THIS is a METHOD",
 "_variables": {
  "datetime formats": "undefined",
  "FTL Extension": "\r\n<#-- source: https://git.topdesk.com/JeppeG/ftl-hacks/-/blob/main/convertToJson/convertToJson.ftl --\u003E\r\n<#-- <@convertToJson myHash=jsonObject level=0 escape=false /> --\u003E\r\n<#macro convertToJson myHash level=0 escape=false>\r\n<#local _spacer = \" \">\r\n<#if (myHash?is_hash)!false>{<#if (myHash?is_hash_ex)!false><#list myHash as key, value>\r\n${\"\"?left_pad((level+1), _spacer)}\"${key}\": <#if (value?is_string)!false><#if escape!false>\"${value?json_string}\"<#else>\"${value}\"<\/#if><#elseif (value?is_number)!false>${value}<#elseif (value?is_boolean)!false>${value?boolean}<#elseif (value?is_hash)!false><@convertToJson myHash=value level=(level+1) escape=escape/><#elseif (value?is_sequence)!false><#if (value?has_content)!false><@convertToJson myHash=value level=(level+1) escape=escape/><#elseif (value?size == 0)!false>[]<#else>\"macroError: Sequence value/content could not be determined or tested.\"<\/#if><#elseif (value?is_method)!false>\"THIS is a METHOD\"<#elseif (value?is_directive)!false>\"THIS is a Directive\"<#elseif (!value?has_content)!false>${value?cn}<#else>\"macroError: Value type could not be determined.\"<\/#if><#sep>,<\/#list>\r\n${\"\"?left_pad(level, _spacer)}<\/#if>}<#elseif (myHash?is_sequence)!false>[<#list myHash as _array><#if (_array?is_hash)!false>\r\n${\"\"?left_pad((level+1), _spacer)}<@convertToJson myHash=_array level=(level+1) escape=escape/><#if _array?is_last>\r\n${\"\"?left_pad(level, _spacer)}<\/#if><#elseif (_array?is_string)!false><#if escape!false>\"${_array?json_string}\"<#else>\"${_array}\"<\/#if><#elseif (_array?is_number)!false>${_array}<#elseif (_array?is_boolean)!false>${_array?boolean}<#elseif (!_array?has_content)!false>${_array?cn}<\/#if><#sep>,<\/#list>]<\/#if><#return><\/#macro>\r\n"
 },
 "_responses": {
 }
}
```