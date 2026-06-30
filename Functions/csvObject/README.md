# csvObject
Generate a csv friendly object.  

**Use a default output value**  
Any other input value -> *`[empty/blank]`*

<a href="/csvObject/csvObject.ftl"><button>Go to code</button></a>

**Example value mapping**  
|input|output|
|:--|:--|
|string|name|
|datetime|date|
|boolean|active|
|number|amount|

**Example inputObject**
``` Json
[{
		"string": "value1",
		"datetime": "datetime",
		"boolean": true,
		"number": 123
	}, {
		"string": "value2",
		"boolean": true,
		"number": 456
	}
]
```

**Example outputObject**
``` Json
{
 "headers": ["string","date","active","amount"],
 "rows": [{
   "string": "value1",
   "date": "datetime",
   "active": true,
   "amount": 123
  }, {
   "string": "value2",
   "date": "",
   "active": true,
   "amount": 456
  }
 ]
}
```