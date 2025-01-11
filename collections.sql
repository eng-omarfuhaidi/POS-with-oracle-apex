 DECLARE
 V_SEQ_ID number ;
 V_QUY number ;
 V_PRICE number ;
 V_PRODUCT_NAME varchar2(200);
 BEGIN
    BEGIN
    select 
    PRODUCT_NAME ,LIST_PRICE into V_PRODUCT_NAME ,V_PRICE
    from DEMO_PRODUCT_INFO
    where PRODUCT_ID = :P2_PRODUCT_ID ;

    select  seq_id,c004 into V_SEQ_ID ,V_QUY from apex_collections 
    where 
        collection_name = 'POINT_SALE' 
    and c001 = :P2_PRODUCT_ID ; 
    exception when NO_DATA_FOUND  then V_SEQ_ID := 0; END;                 
 
 if V_SEQ_ID != 0 THEN      
 V_QUY := V_QUY+1 ; 
     
    APEX_COLLECTION.update_member_attribute (
      p_collection_name=> 'POINT_SALE',
      p_seq=> V_SEQ_ID,
      p_attr_number => 4,
      p_attr_value=> V_QUY
      );
 
      APEX_COLLECTION.update_member_attribute (
      p_collection_name=> 'POINT_SALE',
      p_seq=> V_SEQ_ID,
      p_attr_number => 3,
      p_attr_value=> V_PRICE );
else 

  apex_collection.add_member(
             p_collection_name => 'POINT_SALE',
             p_c001 => :P2_PRODUCT_ID ,
             p_c002 => V_PRODUCT_NAME,
             p_c003 => V_PRICE,
             p_c004 => 1);

end if;
end;