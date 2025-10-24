// Get agent profile
Profile p = [
    SELECT Id FROM Profile
    WHERE Name = 'Einstein Agent User'
    WITH SECURITY_ENFORCED LIMIT 1
];

// Generate Random number to append to Username
DateTime myDateTime = DateTime.now(); 
Long milliseconds = myDateTime.getTime();
Long seconds = milliseconds / 1000;

// Create default Agent User
User u = new user();
u.LastName = 'Agent User';
u.Email = 'noreply@example.com';
u.Alias = 'agen';
u.Username = 'agent.user@af_dev'+ seconds +'.salesforce.com';
u.CommunityNickname = 'afagentuser'+seconds;
u.LocaleSidKey = 'en_US';
u.TimeZoneSidKey = 'GMT';
u.ProfileID = p.id;
u.LanguageLocaleKey = 'en_US';
u.EmailEncodingKey = 'UTF-8';
insert as user u;