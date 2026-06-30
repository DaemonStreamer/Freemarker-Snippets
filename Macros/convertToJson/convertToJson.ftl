<#noparse>
<#-- convertToJson v1.0.0 -->
<#-- <@convertToJson myHash=jsonObject level=0 escape=false /> -->
<#macro convertToJson myHash level=0 escape=false>
<#local _spacer = " ">
<#if (myHash?is_hash)!false>{<#if (myHash?is_hash_ex)!false><#list myHash as key, value>
${""?left_pad((level+1), _spacer)}"${key}": <#if (value?is_string)!false><#if escape!false>"${value?json_string}"<#else>"${value}"</#if><#elseif (value?is_number)!false>${value}<#elseif (value?is_boolean)!false>${value?boolean}<#elseif (value?is_hash)!false><@convertToJson myHash=value level=(level+1) escape=escape/><#elseif (value?is_sequence)!false><#if (value?has_content)!false><@convertToJson myHash=value level=(level+1) escape=escape/><#elseif (value?size == 0)!false>[]<#else>"macroError: Sequence value/content could not be determined or tested."</#if><#elseif (value?is_method)!false>"THIS is a METHOD"<#elseif (value?is_directive)!false>"THIS is a Directive"<#elseif (!value?has_content)!false>${value?cn}<#else>"macroError: Value type could not be determined."</#if><#sep>,</#list>
${""?left_pad(level, _spacer)}</#if>}<#elseif (myHash?is_sequence)!false>[<#list myHash as _array><#if (_array?is_hash)!false>
${""?left_pad((level+1), _spacer)}<@convertToJson myHash=_array level=(level+1) escape=escape/><#if _array?is_last>
${""?left_pad(level, _spacer)}</#if><#elseif (_array?is_string)!false><#if escape!false>"${_array?json_string}"<#else>"${_array}"</#if><#elseif (_array?is_number)!false>${_array}<#elseif (_array?is_boolean)!false>${_array?boolean}<#elseif (!_array?has_content)!false>${_array?cn}</#if><#sep>,</#list>]</#if><#return></#macro>
</#noparse>