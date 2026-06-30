<#noparse>
<#-- addToDatetime v1.0.0
<#-- ${addToDatetime([input datetime value] [years] [months] [days] [hours] [days] [minutes])} -->
<#function addToDatetime input=.now years=0 months=0 days=0 hours=0 minutes=0 >
<#if input?is_date_like>
<#local minutes =       60000 * minutes>
<#local hours   =     3600000 * hours>
<#local days    =    86400000 * days>
<#local months  =  2630016000 * months>
<#local years   = 31556736000 * years>
<#return (input?long + minutes + hours + days + months + years)?number_to_datetime>
</#if>
</#function>
</#noparse>