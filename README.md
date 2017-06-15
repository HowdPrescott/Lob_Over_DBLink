A PL/SQL package for selecting CLOB columns and BLOB columns across a DBLink.

It contains two small functions:<br>
 - GET_CLOB(....): Selects a CLOB over a DBLink.<br>
 - GET_BLOB(....): Selects a BLOB over a DBLink.<br>

*LOB_OVER_DBLINK* requires **NO SETUP** on the remote database.

## Example usage:

select id, lob_over_dblink.get_clob('some_dblink', 'some_table', 'some_clob_column', rowid)<br>
  from some_table@some_dblink;

## Installing and uninstalling:

Download and extract the zip file.<br>
Using SQL*Plus:<br>
  - To Install:   SQL>@install<br>
  - To uninstall: SQL>@uninstall<br>


## Author:

Laurence Prescott<br>
howdprescott@hotmail.com<br>
https://https://github.com/LaurencePrescott/Lob_Over_DBLink<br>

#
&nbsp;&nbsp;&nbsp;&nbsp;:smiling_imp:<br><br>
[![Donate](https://www.paypalobjects.com/en_AU/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=98KZQ5FSKWRTC&lc=AU&item_name=LobOverDBLink&item_number=LODB_1&currency_code=AUD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)

#
