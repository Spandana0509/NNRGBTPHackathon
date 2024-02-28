sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sales/sales/test/integration/FirstJourney',
		'sales/sales/test/integration/pages/SalesList',
		'sales/sales/test/integration/pages/SalesObjectPage',
		'sales/sales/test/integration/pages/Sales_ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesList, SalesObjectPage, Sales_ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sales/sales') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesList: SalesList,
					onTheSalesObjectPage: SalesObjectPage,
					onTheSales_ItemsObjectPage: Sales_ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);