select rm.record_type_code || rm.record_num AS bnum
from sierra_view.varfield v
inner join sierra_view.record_metadata rm
  on v.record_id = rm.id
  and rm.record_type_code = 'b'
where v.marc_tag = '015'
and v.field_content NOT LIKE '%|2dnb%'
GROUP BY bnum
HAVING COUNT (*) > 2