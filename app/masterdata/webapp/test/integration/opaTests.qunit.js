sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'masterdata/test/integration/FirstJourney',
		'masterdata/test/integration/pages/Bussiness_PartnerList',
		'masterdata/test/integration/pages/Bussiness_PartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, Bussiness_PartnerList, Bussiness_PartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('masterdata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBussiness_PartnerList: Bussiness_PartnerList,
					onTheBussiness_PartnerObjectPage: Bussiness_PartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);