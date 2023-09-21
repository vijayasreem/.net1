trigger VerifyIdentityAndAddress on User__c (before insert, before update) {
    //Greet the user with a welcoming message
    system.debug('Welcome to our banking services, we will verify your identity and address');
    
    //Verify the user's identity and address
    for(User__c u : Trigger.new)
    {
        if(u.Identity_Verified__c == true && u.Address_Verified__c == true)
        {
            //Display a success message indicating eligibility for banking services
            system.debug('Identity and address verified. You are eligible for banking services!');
        }
        else
        {
            //Display a message indicating that document verification is incomplete and not eligible for banking services
            system.debug('Document verification is incomplete. You are not eligible for banking services at this time.');
            u.addError('Document verification is incomplete. You are not eligible for banking services at this time.');
        }
    }
}