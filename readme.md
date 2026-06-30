# FTL Extension
A bundle of FreeMarker functions, macros and regular expressions.  
Everything becomes available with a single command.  
`<@(_variables["FTL Extension"]?interpret) />`

### Quick navigation

1. [How it's used](#how-its-used)
1. [FAQ](#faq)



### [Functions](/Functions/)
1. [©️](/Functions/getNextOccurenceOfWeekday.ftl) [getNextOccurenceOfWeekday](/Functions/getNextOccurenceOfWeekday.ftl)
1. [©️](/Functions/addToDatetime/addToDatetimeV2.ftl) [addToDatetime](/Functions/addToDatetime/) 
2. [©️](/Functions/changeTimezone/changeTimezone.ftl) [changeTimezone](/Functions/changeTimezone/) 
3. [©️](/Functions/csvObject/csvObject.ftl) [csvObject](/Functions/csvObject/) 


### [Macros](/Macros/)
1. [⚠️](/Macros/convertToJson/convertToJson.ftl) [convertToJson](/Macros/convertToJson/)
2. [⚠️](/Macros/jsonToTable/jsonToTable.ftl) [jsonToTable](/Macros/jsonToTable/)
3. [⚠️](/Macros/objectToCSV/objectToCSV.ftl) [objectToCsv](/Macros/objectToCSV/)


### [Regular Expressions](/Regular%20Expressions/)
1. [Objectify content using emojis](/Regular%20Expressions/Objectify%20content%20using%20emojis/)




# How it's used
1. Add a Variable Assignment step.
2. Name the variable `FTL Extension`
3. Set **Type of variable** to `Text (new value replaces existing value)`
4. Copy and paste the ftl code into **Value** body.  
<b>For example...</b>  
**Step 1: Assign new value to variable**  
Variable name `FTL Extension`  
Type of variable `Text (new value replaces existing value)`  
Value: `Copy the FTL functions/macros and insert.`<sup>Separate each function/macro on a new line.</sup>  
*Recommended: Use the* `Copy file contents` *button to ensure that you always copy all of the code.*  
![Copying FTL code.jpg](/_files/Copying%20FTL%20code.jpg)


5. Use `<@(_variables["FTL Extension"]?interpret) />` in a field to load in the stored procedures.  
    <small>For TOPdesk Automated Actions, each field within a step is its own local environment. To use any of the stored procedures you will have to use `<@(_variables["FTL Extension"]?interpret) />` in the specific field where you need to use them.</small>  


# FAQ
1. Will this clutter the execution logs?
    - No, this will not clutter the execution log, as they are all stored procedures.  
        It is recommended though to uncheck the `[ ] Log new value`, for the variable `FTL Extension`.