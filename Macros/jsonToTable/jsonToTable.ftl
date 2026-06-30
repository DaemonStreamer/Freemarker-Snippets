<#noparse>
<#-- jsonToTable v1.0.0 -->
<#-- <@jsonToTable jsonObject headerTitle="string" /> -->
<#macro jsonToTable jsonObject headerTitle="" hasHeaders=true >
<#assign keys = jsonObject?keys>
<#assign rows = jsonObject[keys[0]]?size>
 <table class="table-jsonToTable">
<#if headerTitle?has_content || hasHeaders>
  <thead class="thead-jsonToTable">
<#if headerTitle?has_content>
   <tr class="tr-jsonToTable">
    <th class="title-jsonToTable" colspan="100"><h3>${headerTitle}<h3></th>
   </tr>
</#if>
<#if hasHeaders!false>
   <tr class="tr-jsonToTable">
   <#list keys as key>
    <th class="th-jsonToTable">${key}</th>
   </#list>
   </tr>
</#if>
  </thead>
</#if>
  <tbody class="tbody-jsonToTable">
  <#list 0..<rows as i>
   <tr class="tr-jsonToTable">
   <#list keys as key>
    <td class="td-jsonToTable">${jsonObject[key][i]}</td>
   </#list>
   </tr>
  </#list>
  </tbody>
 </table>
</#macro>
</#noparse>