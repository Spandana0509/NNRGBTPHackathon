using { com.satinfotech.marketdb as db } from '../db/schema';
service MarketDB{
    entity Bussiness_Partner as projection on db.Bussiness_Partner{
        @UI.Hidden: true
        ID,
        *
    };
    entity Store as projection on db.Store{
        @UI.Hidden: true
        ID,
        *
    };
    
    entity Stock as projection on db.Stock{
        @UI.Hidden: true
        ID,
        *
    };
    
    entity Purchase as projection on db.Purchase;
    entity Sales as projection on db.Sales;
    
    
   entity Product as projection on db.Product{
        @UI.Hidden: true
        ID,
        *
    };
   
    
    entity State as projection on db.State;
   
}
annotate MarketDB.Store with @odata.draft.enabled;

annotate MarketDB.Bussiness_Partner with @odata.draft.enabled;
annotate MarketDB.Product with @odata.draft.enabled;
annotate MarketDB.Purchase with @odata.draft.enabled;
annotate MarketDB.Stock with @odata.draft.enabled;
annotate MarketDB.Sales with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with {
  pin     @assert.format: '^\d{6}$';  
  gstn   @assert.format:'^\d{2}[A-Z]{5}\d{4}[A-Z]\d{1}[A-Z\d]{1}$';
}
annotate MarketDB.Product with {
    product_img   @assert.format: '^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$';

}
annotate MarketDB.Store with {
  pin     @assert.format: '^\d{6}$';  
  
}


annotate MarketDB.Bussiness_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'Bussiness Partner Number',
            Value : bpno
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            Label:'State',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        },
        {
            $Type : 'UI.DataField',
            Value : gstn
        },
        {
            Value : is_gstn_registered
        },
        {
            Value : is_vendor
        }, 
        {
            Value : is_customer
        }    
    ],  
);
annotate MarketDB.Bussiness_Partner with @(       
    UI.FieldGroup #MarketInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : bpno
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        },
        {
            $Type : 'UI.DataField',
            Value : gstn
        },
        {
            Value : is_gstn_registered
        },
        {
            Value : is_vendor
        }, 
        {
            Value : is_customer
        }  
              
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'MarketInfoFacet',
            Label : 'Market Information',
            Target : '@UI.FieldGroup#MarketInformation',
        },
        
        
    ],    
);




annotate MarketDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'StoreID',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            Label:'State',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        }  
    ],  
);
annotate MarketDB.Store with @(       
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        }  
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'ProductID',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }
    ],  
);
annotate MarketDB.Product with @(       
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }
        
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'StoreID',
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Label:'Stock Quantity',
            Value : stock_qty
        }
    ],  
);
annotate MarketDB.Stock with @(       
    UI.FieldGroup #StockInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        }
        
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'stockInfoFacet',
            Label : 'Stock Information',
            Target : '@UI.FieldGroup#StockInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Purchase with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pono
        },
        {
            $Type : 'UI.DataField',
            Value : bpno_ID
        },
        {
            $Type : 'UI.DataField',
            Value : pod
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate MarketDB.Purchase with @(
    UI.FieldGroup #PurchaseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : pono
        },
        {
            $Type : 'UI.DataField',
            Value : bpno_ID
        },
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseInfoFacet',
            Label : 'Purchase Information',
            Target : '@UI.FieldGroup#PurchaseInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseItemsFacet',
            Label : 'Purchase Items Information',
            Target : 'Items/@UI.LineItem',
        },

    ],    
);
annotate MarketDB.Purchase with {
    bpno @(
        Common.Text: bpno.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Business Partners',
            CollectionPath : 'Bussiness_Partner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bpno_ID,
                    ValueListProperty : 'ID'
                },
               {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'bpno'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
            ]
        }
    )
}
annotate MarketDB.Sales with {
    bpno @(
        Common.Text: bpno.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Business Partners',
            CollectionPath : 'Bussiness_Partner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bpno_ID,
                    ValueListProperty : 'ID'
                },
               {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'bpno'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
            ]
        }
    )
}


annotate MarketDB.Sales with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : bpno_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate MarketDB.Sales with @(
    UI.FieldGroup #SalesInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : bpno_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesInfoFacet',
            Label : 'Sales Information',
            Target : '@UI.FieldGroup#SalesInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : 'Items/@UI.LineItem',
        },
    ],    
);

annotate MarketDB.State with @(
    UI.LineItem: [
       {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        },  
    ],
);
annotate MarketDB.Stock with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
}


annotate MarketDB.Bussiness_Partner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
           Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};

annotate MarketDB.Store with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
           Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};
annotate MarketDB.Product with {
    @Common.Text:'{Product}'
    @Core.IsURL:true
    @Core.MediaType:'image/jpg' 
    product_img
};
annotate MarketDB.Purchase.Items with @(
    UI.LineItem:[
        
        {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
    ],

     UI.FieldGroup #PurchaseItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#PurchaseItems',
        },
    ],  
);

annotate MarketDB.Purchase.Items with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};
annotate MarketDB.Sales.Items with @(
    UI.LineItem:[
        
        {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
    ],

     UI.FieldGroup #SalesItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#SalesItems',
        },
    ],  
);

annotate MarketDB.Sales.Items with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};