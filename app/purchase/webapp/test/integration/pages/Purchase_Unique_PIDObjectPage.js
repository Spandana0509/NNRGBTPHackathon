sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'purchase',
            componentId: 'Purchase_Unique_PIDObjectPage',
            contextPath: '/Purchase/Unique_PID'
        },
        CustomPageDefinitions
    );
});