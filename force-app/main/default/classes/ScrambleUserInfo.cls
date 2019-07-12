global class ScrambleUserInfo {
    
    @InvocableMethod(label='User Management' description='Obfuscate User data and more')
    public static List<UserInfoResult> obfuscate(List<UserInfoRequest> requests)
    {
        List<UserInfoResult> results = new List<UserInfoResult>();
        List<Id> userIds = new List<Id>();
        
        for (UserInfoRequest request : requests)
        {
            userIds.add(request.userId);
        }
        
        List<User> users = [SELECT Id FROM User WHERE Id IN :userIds];

        for (User u : users)
        {
            System.debug('*** UserManagement.obfuscateUser *** -> User');
            System.debug(u);
            System.debug(u.Id);
            
            System.UserManagement.obfuscateUser(u.Id);
            UserInfoResult result = new UserInfoResult();
            result.success = true;
            result.userId = u.Id;
            results.add(result);
        }
        
        return results;
    }
    
    global class UserInfoRequest {
        @InvocableVariable(label='UserId' description='Id of User' required=true)
        global Id userId;
    }
    
    global class UserInfoResult {
        @InvocableVariable
        global Boolean success;
        @InvocableVariable
        global Id userId;
    }
}