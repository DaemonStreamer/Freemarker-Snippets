<#noparse>
<#-- addToDatetime v2.0.0 -->
<#-- Description 
input = date, time, or datetime value.
value = number to add/subtract.
${addYears(input(datetime), value(int))}
${addMonths(input(datetime), value(int))}
${addDays(input(datetime), value(int))}
${addHours(input(datetime), value(int))}
${addMinutes(input(datetime), value(int))}
${addSeconds(input(datetime), value(int))}
-->
<#function ftlExtensionConvertToDatetime input>
	<#if input?is_datetime>
		<#local output = {"result": true, "type": "datetime", "value": input?datetime }>
		<#return output>
	<#elseif input?is_date_only >
		<#local output = {"result": true, "type": "date", "value": "${(input?date?string('yyyy-MM-dd') + ' 00:00:00')?datetime('yyyy-MM-dd HH:mm:ss')}"}>
		<#return output >
	<#elseif input?is_time >
		<#local output = {"result": true, "type": "time", "value": "${('1970-01-01 ' + input?time?string('HH:mm:ss'))?datetime('yyyy-MM-dd HH:mm:ss')}"}>
		<#return output >
	</#if>
	<#local output = {"result": false, "type": "undefined", "value": input}>
	<#return output>
</#function>
<#function addYears input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
		</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function addMonths input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], 0, value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
		</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function addDays input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], 0, 0, value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
		</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function addHours input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], 0, 0, 0, value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
		</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function addMinutes input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], 0, 0, 0, 0, value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
		</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function addSeconds input value=0>
	<#local datetime = ftlExtensionConvertToDatetime(input)>
	<#if datetime["result"] && value?is_number>
		<#local output = ftlExtensionDatetimeToEpoch(datetime["value"], 0, 0, 0, 0, 0, value?round)>
		<#if datetime["type"] == "datetime">
			<#return output?datetime >
		<#elseif datetime["type"] == "date">
			<#return output?date >
		<#elseif datetime["type"] == "time">
			<#return output?time >
	</#if>
	<#elseif !datetime["result"]>
		<#return "${input} is not date, time, or datetime value.">
	<#elseif !value?is_number>
		<#return "${value} is not a number">
	</#if>
	<#return "unknown error: could not validate values">
</#function>
<#function add_month current_year current_month months_to_add >
	<#local sumMonths = current_month + months_to_add>
		<#if sumMonths == 0>
		<#if months_to_add lt 0>
			<#assign output = {"year": current_year + -1, "month": 12}>
			<#return output>
		<#else>
			<#assign output = {"year": current_year, "month": sumMonths}>
			<#return output>
		</#if>
	<#elseif sumMonths gt 12><#-- values above +12-->
		<#local years_to_add = (sumMonths/12)?floor>
		<#local new_year = current_year + years_to_add>
		<#local new_month = (sumMonths/12 - years_to_add)*12>
		<#if new_month == 0>
			<#assign output = {"year": new_year, "month": 12}>
			<#return output>
		<#else>
			<#assign output = {"year": new_year, "month": new_month}>
			<#return output>
		</#if>
	<#elseif sumMonths lt -12><#-- values below -12-->
		<#local years_to_add = (sumMonths/12)?floor>
		<#local new_year = current_year + years_to_add>
		<#local new_month = (sumMonths/12 + years_to_add)*12+12><#-- The order of months is reversed. -->
		<#if new_month == 12>
			<#assign output = {"year": new_year, "month": new_month}>
			<#return output>
		<#else>
			<#assign output = {"year": new_year, "month": new_month}>
			<#return output>
		</#if>
	<#elseif sumMonths lt 0 && sumMonths gt -12>
		<#assign output = {"year": current_year + -1, "month": sumMonths+12}>
		<#return output>
	<#else>
		<#assign output = {"year": current_year, "month": sumMonths}>
		<#return output>
	</#if>
</#function>
<#function ftlExtensionDatetimeToEpoch input=.now year=0 month=0 day=0 hour=0 minute=0 second=0>
	<#local tm_year=add_month(input?datetime?string('yyyy')?number input?datetime?string('M')?number month)["year"]>
	<#local tm_year+=year>
	<#local tm_month=add_month(input?datetime?string('yyyy')?number?c input?datetime?string('M')?number month)["month"]?number>
	<#local tm_yday=("${tm_year?c}-${tm_month}-${input?datetime?string('d')?number?c}")?datetime("yyyy-M-d")?string('D')?number><#-- 1 March or 29 February if leap year-->
	<#local tm_hour=input?datetime?string('H')?number>
	<#local tm_min=input?datetime?string('m')?number>
	<#local tm_sec=input?datetime?string('s')?number>
	<#-- https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_15
		Alterations: 
		+ Increased everything to milliseconds. (adding 000 to the end of all number values)
		+ Rounded all division results (to remove decimal numbers)
		-/+ (Freemarker template tester) Added "(tm_hour*3600000)-57600000" as it was always 16hours ahead of time, so this will always substract 16hours.
		-/+ (TOPdesk Automated Action) Added "(tm_hour*3600000)-86400000" as it was always 24hours ahead of time, so this will always substract 24hours.
	-->
	<#local tm_year+=-1900>
	<#local tm_yday+=day>
	<#local tm_hour+=hour>
	<#local tm_min+=minute>
	<#local tm_sec+=second>
	<#local epoch = tm_sec*1000 + tm_min*60000 + tm_hour*3600000 + tm_yday*86400000 + (tm_year?number-70)*31536000000 + ((tm_year?number-69)/4)?floor*86400000 - ((tm_year?number-1)/100)?floor*86400000 + ((tm_year?number+299)/299)?floor*86400000 >
	<#return epoch?number_to_datetime>
</#function>
</#noparse>