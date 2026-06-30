# addToDatetime
Add or subtract Years, Months, Days, Hours, Minutes, or Seconds from a datetime value.  
Supports `Date`, `Time`, and `Datetime` values.

<a href="/Functions/addToDatetime/addToDatetimeV2.ftl"><button>Go to code</button></a>

## Functions
- `addYears(input, value)`
- `addMonths(input, value)`
- `addDays(input, value)`
- `addHours(input, value)`
- `addMinutes(input, value)`
- `addSeconds(input, value)`

## Parameters
<sub>Mandatory parameters are checked</sub>
- [x] input <sup>date|time|datetime</sup>  
      *Example:* `.now?datetime`  
      *Description:* The date like value you want to add/subtract time to.
- [x] value <sup>integer</sup>  
      *Example:* `1`  
      *Description:* The amount to add or subtract.

**Example inputObject**
``` Json
{
   "old_datetime": ${.now?date},
   "new_datetime": ${addYears(addMonths(addDays(.now?date, 14), 2), 1)}
}
```

**Example outputObject**
``` Json
{
   "old_datetime": "2024-10-10",
   "new_datetime": "2025-12-24"
}
```