sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'transactionaldata/test/integration/FirstJourney',
		'transactionaldata/test/integration/pages/StockList',
		'transactionaldata/test/integration/pages/StockObjectPage'
    ],
    function(JourneyRunner, opaJourney, StockList, StockObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('transactionaldata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStockList: StockList,
					onTheStockObjectPage: StockObjectPage
                }
            },
            opaJourney.run
        );
    }
);