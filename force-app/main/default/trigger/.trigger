trigger CreditRatingTrigger on Account (before insert, before update){
 
  //Creating a Set of all Credit Rating values
  Set<String> creditRatingValues = new Set<String>{'Good Credit', 'Questionable Credit', 'Bad Credit'};
 
  //Loop through all Accounts that are being inserted or updated
  for (Account acc : Trigger.new)
  {
 
    //Check if the Credit Rating value is not null
    if (acc.Credit_Rating__c != null)
    {
 
      //Check if the Credit Rating value is not a valid value
      if (!creditRatingValues.contains(acc.Credit_Rating__c))
      {
        //Add an error to the Account
        acc.Credit_Rating__c.addError('Please select a valid value for Credit Rating');
      }
    }
  }
}