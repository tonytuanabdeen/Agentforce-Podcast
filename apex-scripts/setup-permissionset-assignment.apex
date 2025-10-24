// Get agent User
User u = [
    SELECT Id FROM User
    WHERE Profile.Name = 'Einstein Agent User' AND IsActive = true
    WITH SECURITY_ENFORCED LIMIT 1
];

// Get permission sets (PS)
private final static Set<String> PERM_SETS = new Set<String>{
    'AgentforceServiceAgentUser',
    'GenieUserEnhancedSecurity',
    'Knowledge_FAQ_Access'
};

Map<Id, PermissionSet> mapPermissionSetById =  new Map<Id, PermissionSet>(
    [
        SELECT Id FROM PermissionSet
        WHERE Name IN :PERM_SETS
        WITH SECURITY_ENFORCED
    ]
);
Set<Id> targetPsIds = mapPermissionSetById.keySet();

// Assign PSs to user
if (targetPsIds.size() > 0) {
    List<PermissionSetAssignment> psaas = new List<PermissionSetAssignment>();
    for (Id psId : targetPsIds) {
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.AssigneeId = u.Id;
        psa.PermissionSetId = psId;
        psaas.add(psa);
    }
    insert as user psaas;
    System.debug('Assigned permission set: ' + PERM_SETS);
} else {
    System.debug('Skipped permission set assignment.');
}
