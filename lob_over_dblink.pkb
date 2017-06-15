create or replace package body lob_over_dblink
is
/**  Laurence Prescott 12-Jun-17  **/

/**  A function to fetch a CLOB column over a dblink  **/
function get_clob(
    p_dblink        in varchar2
  , p_remote_table  in varchar2
  , p_clob_col      in varchar2
  , p_rid           in urowid
)
return clob
is
    c_chunk_size    constant pls_integer := 4000;
    v_chunk         varchar2(4000);
    v_clob          clob;
    v_pos           pls_integer := 1;
begin
    dbms_lob.createtemporary(v_clob, true);
    loop
        execute immediate
            'select dbms_lob.substr@' ||p_dblink|| '(' ||p_clob_col|| ', ' ||c_chunk_size|| ', ' ||v_pos|| ') '
         || '  from ' ||p_remote_table|| '@' ||p_dblink|| ' where rowid = :rid '
        into v_chunk using p_rid;
        begin dbms_lob.append(v_clob, v_chunk);
        exception when others then
            if sqlcode = -6502 then exit; else raise; end if;
        end;
        if length(v_chunk) < c_chunk_size then exit; end if;
        v_pos := v_pos + c_chunk_size;
    end loop;
    return v_clob;
end get_clob;

/**  A function to fetch a BLOB column over a dblink  **/
function get_blob(
    p_dblink        in varchar2
  , p_remote_table  in varchar2
  , p_blob_col      in varchar2
  , p_rid           in urowid
)
return blob
is
    c_chunk_size    constant pls_integer := 2000;
    v_chunk         raw(2000);
    v_blob          blob;
    v_pos           pls_integer := 1;
begin
    dbms_lob.createtemporary(v_blob, true);
    loop
        execute immediate
            'select dbms_lob.substr@' ||p_dblink|| '(' ||p_blob_col|| ', ' ||c_chunk_size|| ', ' ||v_pos|| ') '
         || '  from ' ||p_remote_table|| '@' ||p_dblink|| ' where rowid = :rid '
        into v_chunk using p_rid;
        begin dbms_lob.append(v_blob, v_chunk);
        exception when others then
            if sqlcode = -6502 then exit; else raise; end if;
        end;
        if length(v_chunk) < c_chunk_size then exit; end if;
        v_pos := v_pos + c_chunk_size;
    end loop;
    return v_blob;
end get_blob;

end lob_over_dblink;
/