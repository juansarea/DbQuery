-- New script in WISE_STAGING(142).
-- Date: Nov 30, 2023
-- Time: 1:03:12 PM
/*
 * Cek Api Call Log
 * */


select top 20 json_value(PARAMETERs, '$.check_type')check_type 
, json_value(PARAMETERs, '$.nik')nik
, json_value(PARAMETERs, '$.fullname')fullname
, json_value(response, '$.FinalResult')FinalResult
,cae.*
From creditscore_backend..api_call_log cae
where json_value(PARAMETERs, '$.nik') ='3273110212980002'
and cae.created_datetime >= '2023-11-30 14:49:00.000'
order by cae.created_datetime desc