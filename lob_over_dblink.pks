CREATE OR REPLACE PACKAGE NBNREGIONROLLOUT.lob_over_dblink
is
/**  Laurence Prescott 12-Jun-17  **/
/**  Functions to fetch a ClOB or BLOB column over a db_link.  **/

function get_clob(
    p_dblink        in varchar2
  , p_remote_table  in varchar2
  , p_clob_col      in varchar2
  , p_rid           in urowid
)
return clob;

function get_blob(
    p_dblink        in varchar2
  , p_remote_table  in varchar2
  , p_blob_col      in varchar2
  , p_rid           in urowid
)
return blob;

end lob_over_dblink;
/