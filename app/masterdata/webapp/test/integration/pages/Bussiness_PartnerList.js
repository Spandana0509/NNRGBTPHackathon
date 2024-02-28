sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'masterdata',
            componentId: 'Bussiness_PartnerList',
            contextPath: '/Bussiness_Partner'
        },
        CustomPageDefinitions
    );
});