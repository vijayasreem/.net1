trigger CreditCardEligibility on Application__c (after insert, after update) {
    Set<Decimal> annualIncome = new Set<Decimal>();
    Set<Decimal> creditScore = new Set<Decimal>();
    List<Application__c> newApplications = new List<Application__c>();
    
    for (Application__c app : Trigger.new) {
        annualIncome.add(app.Annual_Income__c);
        creditScore.add(app.Credit_Score__c);
        newApplications.add(app);
    }
    
    if (annualIncome.contains(30000) && creditScore.contains(700)) {
        for (Application__c app : newApplications) {
            app.Eligibility_Determination_Message__c = 'Congratulations! You are eligible for a credit card with a high limit.';
        }
    }
    else if (annualIncome.contains(20000) && creditScore.contains(600)) {
        for (Application__c app : newApplications) {
            app.Eligibility_Determination_Message__c = 'You are eligible for a credit card with a moderate limit.';
        }
    }
    else {
        for (Application__c app : newApplications) {
            app.Eligibility_Determination_Message__c = 'Sorry, you are not eligible for a credit card at this time.';
        }
    }
    
    if(!newApplications.isEmpty()) {
        update newApplications;
    }
}