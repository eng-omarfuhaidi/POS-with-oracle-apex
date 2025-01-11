# POS-with-oracle-apex
Simple project using Oracle Apex. The APEX_COLLECTION provided by Oracle Apex was used to simulate a quick point of sale screen.
In Oracle APEX, APEX_COLLECTION is a feature that allows you to manage in-memory collections of data, which can be used to temporarily store and manipulate data within a session. This is particularly useful when you need to handle data that doesn't directly correspond to database tables or when you want to perform complex manipulations before committing the data to the database.

Key Features of APEX_COLLECTION
-Temporary Storage: Collections are stored in session memory and are automatically cleared when the session ends.
-Session-Specific: Each collection is unique to the user session.
-Structured Data Handling: You can define collections with specific column structures, similar to database tables.
-Flexible Usage: Ideal for scenarios like multi-step processes, temporary data manipulation, or holding intermediate results.

Common Operations
- Create a Collection:


BEGIN
   APEX_COLLECTION.CREATE_COLLECTION(
      p_collection_name => 'MY_COLLECTION'
   );
END;
- Add a Member to a Collection:

BEGIN
   APEX_COLLECTION.ADD_MEMBER(
      p_collection_name => 'MY_COLLECTION',
      p_c001            => 'Value1',
      p_c002            => 'Value2'
   );
END;
- Query a Collection:
  
SELECT c001, c002
FROM   apex_collections
WHERE  collection_name = 'MY_COLLECTION';

-Update a Collection Member:


BEGIN
   APEX_COLLECTION.UPDATE_MEMBER(
      p_collection_name => 'MY_COLLECTION',
      p_seq             => 1,
      p_c001            => 'NewValue1'
   );
END;
- Delete a Member:


BEGIN
   APEX_COLLECTION.DELETE_MEMBER(
      p_collection_name => 'MY_COLLECTION',
      p_seq             => 1
   );
END;
- Delete the Entire Collection:


BEGIN
   APEX_COLLECTION.DELETE_COLLECTION(
      p_collection_name => 'MY_COLLECTION'
   );
END;
