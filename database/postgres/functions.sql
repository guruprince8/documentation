/*create or replace function totalRecords()
returns integer as $total$
declare 
	total integer;
begin
	select count(*) into total from public.company;
	return total;
end;
$total$ language plpgsql;
*/

select totalRecords()
