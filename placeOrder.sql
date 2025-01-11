DECLARE
V_ORDER_ID NUMBER;
V_TOTAL NUMBER;
begin
SELECT SUM (c003* c004)   INTO V_TOTAL FROM apex_collections WHERE collection_name = 'POINT_SALE' ;

INSERT INTO DEMO_ORDERS (CUSTOMER_ID,ORDER_TOTAL,ORDER_TIMESTAMP,USER_NAME)
VALUES  (:P2_CUSTOMER,V_TOTAL,CURRENT_TIMESTAMP,:APP_USER ) 
  RETURNING ORDER_ID  INTO V_ORDER_ID;

 
        insert into DEMO_ORDER_ITEMS 
        ( 
        ORDER_ID, 
        PRODUCT_ID,
        UNIT_PRICE, 
        QUANTITY  )
         
     select 
    V_ORDER_ID,   
    c001  ,
    c003  ,
    c004      
from apex_collections WHERE collection_name = 'POINT_SALE' ;
end;