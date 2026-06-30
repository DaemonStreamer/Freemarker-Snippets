# changeTimezone
Change the timezone of a datetime value.

<a href="/Functions/changeTimezone/changeTimezone.ftl"><button>Go to code</button></a>

### IMPORTANT
This function will always change the datetime_format to ISO.  
If you have set a different datetime_format using the freemarker setting directive, will be overwritten after using this function.  
eg. `<#setting datetime_format="yyyy-MM-dd'T'HH:mm:ss.SSSZ">` will be overwritten with `<#setting datetime_format="iso">`

## Parameters
<sub>Mandatory parameters are checked</sub>
- [x] input <sup>datetime</sup>  
      *Example:* `.now?datetime`  
      *Description:* The datetime value you want to change timezone on.
- [x] time_zone <sup>string</sup>  
      *Example:* `Europe/Copenhagen`  
      *Description:* The timezone you want to change the datetime input to.
- [ ] time_zone_origin <sup>string</sup>  
      *Example:* `UTC`  
      *Description:* When the input(datetime) value, does not contain timezone <sup>`Z or +02:00`</sup>.
- [ ] **datetime_format** <sup>string</sup>  
      *Example:* `yyyy-MM-dd'T'HH:mm:ss.SSSZ`  
      *Description:* When the input(datetime) value is not a "iso" datetime format.
- [ ] locale <sup>string</sup>  
      *Example:* `da_DK`  
      *Description:* When datetime format contains language specific details.  
      eg. `October 25th. 2024`

**Example inputObject**
``` Json
{
   "datetime": ${changeTimezone("2024-10-09T14:13:32.432Z"?datetime, "Europe/Copenhagen")}
}
```

**Example outputObject**
``` Json
{
   "datetime": "2024-10-09T16:13:32.432+02:00"
}
```