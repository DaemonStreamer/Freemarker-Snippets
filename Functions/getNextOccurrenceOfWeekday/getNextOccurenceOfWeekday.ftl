<#-- getNextOccurrenceOfWeekday("wednesday" "08:00" )-->
<#function getNextOccurrenceOfWeekday weekday="monday", cutOffTime="00:00", timezone="", fromDate=.now, countDays=7>
<#-- parameter check -->
 <#if !(.now?string("Z")?has_content)!false><#return "\"locale\" and \"time_zone\" setting have not been set."></#if>
 <#if !countDays?is_number><#return "\"countDays\" expected a number value."></#if>
 <#if !fromDate?is_datetime><#return "\"fromDate\" expected a datetime value."></#if>
 <#if !weekday?is_string><#return "\"weekday\" expected a string containing \"monday\",\"tuesday\" etc."></#if>
 <#if !cutOffTime?is_string><#return "\"cutOffTime\" expected a string value. (example: \"21:00\")."></#if>
 <#if !cutOffTime?matches('[0-2][0-9]:[0-5][0-9]')><#return "\"cutOffTime\" did not match the following expression \"[0-2][0-9]:[0-5][0-9]\"."></#if>
<#-- end: parameter check-->
<#-- assign variables -->
 <#if !timezone?has_content>
  <#local timezone=.now?string("Z")>
 </#if>
 <#local cutTime = (cutOffTime+timezone)?time("HH:mmZ")?long>
 <#local dayDate = (weekday?date("EEEE"))!weekday?date("EEE")>
<#-- end: assign variables -->
 <#list 0..countDays as dayCount>
  <#if !dayCount?is_first>
   <#local fromDate = (fromDate?datetime?long + (86400000))?number_to_datetime><#--comment: Add 1 day to fromDate -->
  </#if>
  <#if (fromDate?string("EEEE")?date("EEEE") == dayDate && (dayCount?is_first && fromDate?string("HH:mmZ")?time("HH:mmZ")?long lte cutTime)) || (fromDate?string("EEEE")?date("EEEE") == dayDate && !dayCount?is_first)>
   <#return ((fromDate?string("yyyy-MM-dd")?date?long)+(cutTime))?number_to_datetime>
  </#if >
 </#list>
 <#return "No date found">
</#function>