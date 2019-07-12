# ext-id-helpers

Set of helpers focused on External Identity use cases. 

## Other Projects

See also:

* Google reCAPTCHA in Lightning Component: [https://github.com/chadevanssf/lightning-google-recaptcha](https://github.com/chadevanssf/lightning-google-recaptcha)

## Handy code for cli

Pull from an org that has some helpers that you want to incorporate. Note that the package does NOT have to be fully published, just needs to have the code you want to be able to retrieve.

```sh
sfdx force:source:retrieve -u extid -n ExtIdHelpers -p ./force-app/main/default/
```

## Available Components

### Scramble User Info

* Use Case: For a External User in a Community, there is an associated Contact or PersonAccount to the User, and need to destroy that user info (GDPR Right to be Forgotten, testing)
* Dependencies: Must install **Customisable Flow Header & Footer with Progress Indicator** [https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3A00000EczujUAB](https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3A00000EczujUAB)
* Installation: 
  * Add a new Action to PersonAccount or Contact layout, call to the Flow with the Account or Contact, auto-fills the recordId
  * From Process Builder/Flow, call out to the Apex Class with the correct UserId
* Items: Flow Definition, Apex Class
* Apex calls out to UserManagement.obfuscate (see [https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_class_System_UserManagement.htm](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_class_System_UserManagement.htm))
