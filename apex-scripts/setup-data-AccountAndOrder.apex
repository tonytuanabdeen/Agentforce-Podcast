// Create an Account Record
Account a = new Account(
    Name = 'Example Account'
);
insert a;

// Create a Contact Record
Contact c = new Contact(
    AccountId = a.Id,
    FirstName = 'Lauren',
    LastName = 'Bailey',
    MailingStreet = '1 Market St',
    MailingCity = 'San Francisco',
    MailingState = 'California',
    MailingPostalCode = '94105',
    MailingCountry = 'United States',
    MobilePhone = '(415) 555-1212',
    Email = 'lbailey@example.com'
);
insert c;

// Create an Order Record
Order o = new Order(
    AccountId = a.Id,
    // ContractId = null,
    EffectiveDate = System.today(),
    Name = 'NikeCraft Mars Yard Shoe 3.0',
    Status = 'Draft',
    ShippingStreet = '1/2 Queen St',
    ShippingCity = 'Essendon',
    ShippingState = 'Victoria',
    ShippingPostalCode = '3000',
    ShippingCountry = 'Australia'
);
insert o;