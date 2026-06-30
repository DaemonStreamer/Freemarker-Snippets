# jsonToTable

Feemarker syntax: `<@jsonToTable jsonObject=Input headerTitle="" hasHeaders=true />`

# Example

Syntax: `<@jsonToTable jsonObject "MY TITLE" true />` 

## jsonObject example
```
{
  "column1": ["row1","row2","row3","row4"],
  "column2": ["row1","row2","row3","row4"],
  "column3": ["row1","row2","row3","row4"],
  "column4": ["row1","row2","row3","row4"]
}
```

## HTML result
HTML Table will look like this.
<body>
 <table class="table-jsonToTable">
  <thead class="thead-jsonToTable">
   <tr class="tr-jsonToTable">
    <th class="title-jsonToTable" colspan="100"><h3>MY TITLE<h3></th>
   </tr>
   <tr class="tr-jsonToTable">
    <th class="th-jsonToTable">column1</th>
    <th class="th-jsonToTable">column2</th>
    <th class="th-jsonToTable">column3</th>
    <th class="th-jsonToTable">column4</th>
   </tr>
  </thead>
  <tbody class="tbody-jsonToTable">
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
   </tr>
  </tbody>
 </table>
</body>

HTML output code is like this.
```
 <table class="table-jsonToTable">
  <thead class="thead-jsonToTable">
   <tr class="tr-jsonToTable">
    <th class="title-jsonToTable" colspan="100"><h3>TITLE<h3></th>
   </tr>
   <tr class="tr-jsonToTable">
    <th class="th-jsonToTable">column1</th>
    <th class="th-jsonToTable">column2</th>
    <th class="th-jsonToTable">column3</th>
    <th class="th-jsonToTable">column4</th>
   </tr>
  </thead>
  <tbody class="tbody-jsonToTable">
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
    <td class="td-jsonToTable">row1</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
    <td class="td-jsonToTable">row2</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
    <td class="td-jsonToTable">row3</td>
   </tr>
   <tr class="tr-jsonToTable">
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
    <td class="td-jsonToTable">row4</td>
   </tr>
  </tbody>
 </table>
```
