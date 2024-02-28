sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchase/test/integration/FirstJourney',
		'purchase/test/integration/pages/PurchaseList',
		'purchase/test/integration/pages/PurchaseObjectPage',
		'purchase/test/integration/pages/Purchase_Unique_PIDObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseList, PurchaseObjectPage, Purchase_Unique_PIDObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchase') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseList: PurchaseList,
					onThePurchaseObjectPage: PurchaseObjectPage,
					onThePurchase_Unique_PIDObjectPage: Purchase_Unique_PIDObjectPage
                }
            },
            opaJourney.run
        );
    }
);