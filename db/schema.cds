namespace com.satinfotech.marketdb;
using {managed, cuid } from '@sap/cds/common';

@assert.unique:{
    bpno:[bpno]
}
entity Bussiness_Partner: cuid ,managed {
    
    @title:'Bussiness Partner Number' 
    bpno: String;
    @title:'City'
    city:String(10) ;
    @title:'Name'
    name: String(40) ;
    @title:'State'
    state: String(10);
    @title:'Address1'
    Address1:String(40) ;
    @title:'Address2'
    Address2:String(40);
    @title:'PIN Code'
    pin :String(40) ;
    @title:'GSTIN Number'
    gstn:String(15);
    @title:'Is gstn Registered'
    is_gstn_registered: Boolean default false;
    @title:'Is Vendor'
    is_vendor: Boolean default false;
    @title:'Is Customer'
    is_customer: Boolean default false;
}

@cds.persistence.skip
entity State {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
    
}
entity Store : cuid, managed {
    @title: 'StoreID'
    store_id: String ;
    @title: 'Name'
    name: String(20) ;
    @title: 'Address1'  
    Address1:String(40);
    @title: 'Adress2'
    Address2:String(30);
    @title:'City'
    city:String(40);
    @title: 'State'
    state:String(10);
    @title: 'PIN Code.'
    pin: String(20);
}


entity Product : cuid, managed {
    @title: 'ProductID'
    product_id: String;
    @title: 'Product Name'
    product_name: String(20) ;
    @title: 'Product Image URL'
    product_img: String default 'https://tse4.mm.bing.net/th?id=OIP.soJAxi0vZKiekRIwv4LOmwHaJ_&pid=Api&P=0&h=220';
    @title: 'Product Cost Price'
    product_cost: Integer;
    @title: 'Product Sell Price'
    product_sell: Integer ;
}
entity Stock : cuid, managed {
    @title: 'StoreID'
    store_id: Association to Store;
    @title: 'ProductID'
    product_id: Association to Product ;
    @title: 'Stock QTY'  
    stock_qty:Integer;
}


entity Purchase : cuid,managed {
    @title : 'Purchase Order Number'
    pono : Integer;
    @title : 'Business Partner'
    bpno : Association to Bussiness_Partner;
    @title : 'Purchase order date'
    pod : Date;
    @title : 'Items'
    Items : Composition of many {
        key ID : UUID;
        product_id : Association to Product;
        qty : Integer;
        price : Integer;
        store_id : Association to Store;
    }
}

entity Sales : cuid,managed {
    @title : 'Sales Order Number'
    sod : Integer;
    @title : 'Business Partner'
    bpno : Association to Bussiness_Partner;
    @title : 'Sales date'
    sales_date : Date;
    @title : 'Items'
    Items : Composition of many {
        key ID : UUID;
        product_id : Association to Product;
        qty : Integer;
        price : Integer;
        store_id : Association to Store;
    }
}