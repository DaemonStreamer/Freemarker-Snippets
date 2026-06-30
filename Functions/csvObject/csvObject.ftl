<#noparse>
<#-- csvObject v1.0.0 -->
<#-- ${csvObject(inputObject valueMapping arrayDelimiter)} -->
<#function csvObject inputObject valueMapping="" arrayDelimiter=", ">
<#local headers = []>
<#local rows = []>
<#if inputObject?is_enumerable && inputObject?size gt 0 && inputObject[0]?is_hash_ex >
<#list inputObject as entry><#list entry?keys?filter(key -> !valueMapping?has_content && !headers?seq_contains(key) || valueMapping?has_content && _map(key, valueMapping)?has_content && !headers?seq_contains(_map(key, valueMapping))) as key><#if valueMapping?has_content><#local headers += [_map(key, valueMapping)]><#elseif !valueMapping?has_content><#local headers += [key]><#else><#break></#if></#list></#list>
<#list inputObject as entry><#local hash = {}><#list entry as key, value><#if !value?? || value?is_hash ><#continue><#elseif !valueMapping?has_content><#if value?is_sequence || value?is_collection><#local hash += {key: value?join(arrayDelimiter)}><#else><#local hash += {key: value}></#if><#elseif valueMapping?has_content && _map(key, valueMapping)?has_content><#if value?is_sequence || value?is_collection><#local hash += {_map(key, valueMapping): value?join(arrayDelimiter)}><#else><#local hash += {_map(key, valueMapping): value}></#if></#if></#list><#local rows += [hash]></#list>
<#local outputObject = {"headers": headers, "rows": rows}>
<#return outputObject>
<#else>
<#return "ERROR">
</#if>
</#function>
</#noparse>