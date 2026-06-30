<#noparse>
<#-- changeTimezone v2.0.0 -->
<#-- Description
Input a datetime value and specify the time_zone which you want it to be modified to.
!Important!
This function will always change the datetime_format to ISO.
Reason being that is unknown if it is possible to retrieve the environments current "datetime_format" setting.
-->
<#function changeTimezone input time_zone="" time_zone_origin="" datetime_format="" locale="" >
	<#if datetime_format?has_content>
		<#setting datetime_format = datetime_format>
	<#else>
		<#setting datetime_format = "iso_ms">
	</#if>
	<#if time_zone_origin?has_content>
		<#setting time_zone=time_zone_origin>
	</#if>
	<#local output = input?datetime>
	<#setting time_zone=time_zone>
	<#if locale?has_content>
		<#setting locale=locale>
	</#if>
	<#local output = output?datetime?string>
	<#setting datetime_format="iso">
	<#setting time_zone="JVM default">
	<#return output>
</#function>
<#-- Examples
SHORT: ${changeTimezone(.now?datetime, "Europe/Copenhagen")}
${changeTimezone(.now?datetime, "Europe/Copenhagen")}
-->
</#noparse>