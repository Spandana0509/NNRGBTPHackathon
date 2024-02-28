sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        SetVendor: function(oBindingContext, aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                // Check the current value of is_vendor
                var bIsVendor = element.getProperty("is_vendor");
                
                // Toggle the value of is_vendor
                var bNewIsVendor = !bIsVendor;

                // Show message
                MessageToast.show(element.sPath + " - is_vendor: " + bNewIsVendor);

                // Send PATCH request to update is_vendor
                var sUrl = "/odata/v4/market-db" + element.sPath;
                jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: sUrl,
                    data: JSON.stringify({ is_vendor: bNewIsVendor }),
                    success: function() {
                        // Refresh the data
                        element.getModel().refresh();
                    },
                    error: function() {
                        // Handle errors if needed
                    }
                });
            });
        },
    };
});
