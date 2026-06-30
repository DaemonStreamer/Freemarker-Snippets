# Objectify content using emojis

## Objectifying HTML string

**HTML Expression**
```
(?<title>(?<titleTagStart>(?:<\w+?\d.{0,25}>|<\w+>|))(?<titleEmoji>(?:🧾|🏢|🧑‍💼|🌍|🧑‍💻|🪙|✏️|📄|📝|📋))(?<titleText>.*?)(?<titleTagEnd>(?:</.*?>){1,3}))(?:- |)(?<content>.*?)(?=<\w\d.{0,1}>|■)
```

**HTML sample**
```
<h5><strong><u>🧾Tilbudsoversigt</h5></u></strong><h6><strong>🏢Kunde</h6></strong>- TOPdesk Danmark A/S (12345-6)<h6><strong>🧑‍💼Kunde kontaktperson</h6></strong>- Gents, Jeppe<h6><strong>🌍Lokation</h6></strong>- Remote<h6><strong>🧑‍💻Konsulent</h6></strong>- JeppeG<h6><strong>🪙Pris</h6></strong>- 12.345 kr.<h6><strong>✏️Kort beskrivelse</h6></strong>- Automating Kundetilpasninger change template registration<h6><strong>📄Beskrivelse</h6></strong>- The automation should grab details from the offer, and apply it to the change request field.<br/>A new incident needs to be created for customer communication.<br/>The incident resolved by change should be closed, with a notice explaining that a change (followed by the change number) has been created for processing their accepted offer, any communication to Technical Solution regarding this offer, and be communicated to this incident (followed by the new incident number) as it will be your direct contact with the solution team. Communication with other departments like planning and administration should be communicated to the change (insert change number as a clickable mailto link, with preentered subject containing change number).<h6><strong>📝Forudsætninger</h6></strong>- Access to test-tophelp with write permissions to automated actions.<h6><strong>📋Agenda</h6></strong><ol><li>1 times forberedelsesmøde (Et forberedelsesmøde, lige efter at tilbuddet er accepteret.)</li><li>-</li><li>-</li><li>-</li></ol><br/>■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■<br/><strong>Ovenstående priser er i DKK ekskl. moms</strong><br/><br/><strong>Ændring eller aflysning:</strong><br/>Såfremt I ønsker at ændre allerede indgåede <br/>aftaler, skal dette meddeles seneste 14 dage <br/>før aftalen. I tilfælde af ændring/aflysning <br/>senere end 14 dage før aftalen, forbeholder <br/>TOPdesk sig ret til at fakturere på 50 % af den<br/>omfattede ydelse.<br/><br/>*disse priser er standardpriser. Hvis I har en aftale om en speciel timepris, så vil I kun blive faktureret iht. jeres aftale.<br/>■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■<br/>— Copied from incident: TDR24 05 039 31-05-2024 11:24 [GMT +2:00] Gents, Jeppe
```

**Showcasing on regex101.com**
![Regex HTML expression.jpg](/Objectify%20content%20using%20emojis/files/Regex%20HTML%20expression.jpg)

## Objectifying Formatted Plaintext string

**Plaintext Expression**
```
(?<=(🧾|🏢|🧑‍💼|🌍|🧑‍💻|🪙|✏️|📄|📝|📋))(.*?)(?:\\n- |\\n)(.*?)(?:\\n\\n)(?=🧾|🏢|🧑‍💼|🌍|🧑‍💻|🪙|✏️|📄|📝|📋|■) 
```

**Plaintext sample**
```
🧾Tilbudsoversigt\n\n\n🏢Kunde\n- TOPdesk Danmark A/S (12345-6)\n\n🧑‍💼Kunde kontaktperson\n- Gents, Jeppe\n\n🌍Lokation\n- Remote\n\n🧑‍💻Konsulent\n- JeppeG\n\n🪙Pris\n- 12.345 kr.\n\n✏️Kort beskrivelse\n- Automating Kundetilpasninger change template registration\n\n📄Beskrivelse\n- The automation should grab details from the offer, and apply it to the change request field.\nA new incident needs to be created for customer communication.\nThe incident resolved by change should be closed, with a notice explaining that a change (followed by the change number) has been created for processing their accepted offer, any communication to Technical Solution regarding this offer, and be communicated to this incident (followed by the new incident number) as it will be your direct contact with the solution team. Communication with other departments like planning and administration should be communicated to the change (insert change number as a clickable mailto link, with preentered subject containing change number).\n\n📝Forudsætninger\n- Access to test-tophelp with write permissions to automated actions.\n\n📋Agenda\n\n⒈1 times forberedelsesmøde (Et forberedelsesmøde, lige efter at tilbuddet er accepteret.)\n⒉-\n⒊-\n⒋-\n\n\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\nOvenstående priser er i DKK ekskl. moms\n\nÆndring eller aflysning:\nSåfremt I ønsker at ændre allerede indgåede \naftaler, skal dette meddeles seneste 14 dage \nfør aftalen. I tilfælde af ændring/aflysning \nsenere end 14 dage før aftalen, forbeholder \nTOPdesk sig ret til at fakturere på 50 % af den\nomfattede ydelse.\n\n*disse priser er standardpriser. Hvis I har en aftale om en speciel timepris, så vil I kun blive faktureret iht. jeres aftale.\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n— Copied from incident: TDR24 05 039 31-05-2024 11:24 [GMT +2:00] Gents, Jeppe
```

## Objectifying Plaintext string

**Regular Expression**
```
(?<emoji>📧|✉️|✏️)(?<title>.*?)(?:\n- )(?<content>.*?)(?=\n\n|\Z)
```

**Sample Text**
```
📧Fælles email adresse
- d-fenrir@topdesk.dk

✉️Masse tildeling
- casperse@topdesk.com
c.jusjong@topdesk.dk

✏️Bekræft at de indtastede oplysninger er korrekte.
- Yes
```

**Showcasing on regex101.com**
![Regex Plaintext expression.jpg](/Objectify%20content%20using%20emojis/files/Regex%20Plaintext%20expression.jpg)