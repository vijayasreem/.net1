
@isTest
static void testApplyForLoan_ValidApplicationData() {
    // Create a loan application with valid data
    CarLoanApplicationController.LoanApplication application = new CarLoanApplicationController.LoanApplication();
    application.identification = '1234567890';
    application.proofOfIncome = 5000.00;
    application.creditHistory = 'Good';
    application.employmentDetails = 'Full-time';

    // Call the applyForLoan method
    CarLoanApplicationController.LoanOffer offer = new CarLoanApplicationController().applyForLoan(application);

    // Assert that a loan offer is generated
    System.assertNotEquals(null, offer);
}
