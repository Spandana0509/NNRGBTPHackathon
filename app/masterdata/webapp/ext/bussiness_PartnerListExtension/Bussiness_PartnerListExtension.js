
sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        SetCustomer: function(oBindingContext, aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                // Check the current value of is_customer
                var bIsCustomer = element.getProperty("is_customer");
                
                // Toggle the value of is_customer
                var bNewIsCustomer = !bIsCustomer;

                // Show message
                MessageToast.show(element.sPath + " - is_customer: " + bNewIsCustomer);

                // Send PATCH request to update is_customer
                var sUrl = "/odata/v4/market-db" + element.sPath;
                jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: sUrl,
                    data: JSON.stringify({ is_customer: bNewIsCustomer }),
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

