 
/**
 *  KI - Web
 * Sit doc : https://docs.google.com/document/d/1KVSno_qhQZBxJIpso_zhHuuJakovIHV5eDDsoBdKuSw/edit?pli=1
 * Date: Nov 28, 2023
 */


select * from M_MKT_POLO_PARAMETER mmpp where PARAMETER_ID like '%PREAPPROVAL_SAME_ID_ON_OFF%'

select *from CONFINS..negative_cust where id_no='3273110212980002' and is_active=1


select getdate() , DATEADD(MINUTE ,-5,getdate()) 





select top 10 * from T_MKT_POLO_ORDER_IN tmpoi  
order by dtm_crt desc

select * from T_MKT_POLO_ORDER_IN_X tmpoix 
where T_MKT_POLO_ORDER_IN_ID =993386

select top 10 tmpoi.DISTRIBUTED_DT , tmpoi.SOURCE_DATA , tmpoi.ID_NO , tmpoi.CUST_NAME , tmpoi.DUKCAPIL_RESULT , neg.negative_cust_id
from T_MKT_POLO_ORDER_IN tmpoi  
join T_MKT_POLO_ORDER_IN_X tmpoix on tmpoi.T_MKT_POLO_ORDER_IN_ID =tmpoix.T_MKT_POLO_ORDER_IN_ID 
left join confins..negative_cust neg on neg.id_no=tmpoi.ID_NO 
where tmpoix.PENGAJUAN_NO ='KWNI848320230007711'
order by tmpoi.dtm_crt desc

select * from populate

select top 20 json_value(PARAMETERs, '$.check_type')check_type
, json_value(PARAMETERs, '$.nik')nik
, json_value(PARAMETERs, '$.fullname')fullname
, json_value(response, '$.result')result
, PARAMETERs
, response
, created_datetime
From creditscore_backend..api_call_log cae
where cae.created_datetime >= '2023-11-30 19:20:00.000'
and cae.created_datetime <= '2023-11-30 19:40:00.000'
and json_value(PARAMETERs, '$.nik') in ('3573041506640007', '3513210410010001')
order by cae.created_datetime desc

 select --count(1) total_hit_telestatus
 top 20 json_value(PARAMETERs, '$.check_type')check_type
, json_value(PARAMETERs, '$.nik')nik
, json_value(PARAMETERs, '$.fullname')fullname
, json_value(response, '$.result')result
, PARAMETERs
, response
, created_datetime
From creditscore_backend..api_call_log cae
where cae.created_datetime >= DATEADD(MINUTE ,-20,getdate()) 
and cae.created_datetime <= getdate() 
and json_value(PARAMETERs, '$.check_type') not in  ('tele status','customer rating')
--and json_value(PARAMETERs, '$.nik') in ('3573041506640007', '3603281405880004')
order by cae.created_datetime desc

 

--search data cukcapil
;with _temp 
as(
SELECT 
check_type, JSON_VALUE(response,'$.result') result, JSON_VALUE(parameters,'$.nik') nik, JSON_VALUE(parameters,'$.fullname') fullname, JSON_VALUE(parameters,'$.birthdate') birthdate, JSON_VALUE(parameters,'$.birthplace') birthplace
, DATEDIFF(year, convert( date,JSON_VALUE(parameters,'$.birthdate'),103), cast(getdate() as date )) age
FROM creditscore_backend..api_call_result WITH(NOLOCK)
WHERE check_type = 'data dukcapil'
--and JSON_VALUE(response,'$.result') = 'NOT MATCH'
--and JSON_VALUE(parameters,'$.nik') = '3212044104940003'
--order by execution_datetime desc
)select * from _temp 
where age>21
and result='MATCH'

/**
 * single , dukcapil not match  => 3573041506640007
 * guarantor dukcapil match / not found => 3603281405880004
 * */
 

--customer only
SELECT TOP(1)A.DISTRIBUTED_DT, A.SOURCE_DATA,A.TASK_ID,B.PENGAJUAN_NO,C.PENGAJUAN_NO PENGAJUAN_NO_HIST, A.JENIS_TASK, C.JENIS_TASK JENIS_TASK_HIST,
A.POLO_STEP,B.NEXT_STEP,A.CUST_NAME,A.ID_NO,A.BIRTH_DT,A.BIRTH_PLACE,
A.NEGATIVE_CUST,A.DUKCAPIL_STAT,  A.MOBILE1, B.TELESTATUS, A.DTM_CRT
FROM WISE_STAGING..T_MKT_POLO_ORDER_IN A WITH(NOLOCK)
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_X B WITH(NOLOCK) ON A.T_MKT_POLO_ORDER_IN_ID = B.T_MKT_POLO_ORDER_IN_ID
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_HIST C WITH(NOLOCK) ON C.TASK_ID = A.TASK_ID
WHERE CONVERT(DATE,A.DISTRIBUTED_DT) = '2023-12-1'
--and c.PENGAJUAN_NO ='3573041506640007'
and a.id_no='3573041506640007'
--AND A.TASK_ID = 'POL000795087'
ORDER BY A.DISTRIBUTED_DT DESC

SELECT TOP(1)A.DISTRIBUTED_DT, A.SOURCE_DATA,A.TASK_ID,B.PENGAJUAN_NO,C.PENGAJUAN_NO PENGAJUAN_NO_HIST, B.IS_PRE_APPROVAL, A.FINAL_RESULT_CAE, C.FINAL_RESULT_CAE FINAL_RESULT_CAE_HIST,
A.JENIS_TASK,C.JENIS_TASK,A.POLO_STEP,B.NEXT_STEP,
A.TASK_ID, A.CUST_NAME,A.ID_NO,A.BIRTH_DT,A.BIRTH_PLACE,A.GUARANTOR_NAME,A.GUARANTOR_ID_NO, A.GUARANTOR_BIRTH_DT,A.GUARANTOR_BIRTH_PLACE,
A.TASK_ID, A.NEGATIVE_CUST,B.NEGATIVE_GUARANTOR,A.DUKCAPIL_STAT,A.DUKCAPIL_GUARANTOR_RESUT, A.MOBILE1, B.TELESTATUS, A.GUARANTOR_MOBILE_PHONE_NO, A.PHONE_CHECK_GUARANTOR, 
B.BIOMETRIK, A.GUARANTOR_BIOMETRIC_RESULT, A.TASK_ID
FROM WISE_STAGING..T_MKT_POLO_ORDER_IN A WITH(NOLOCK)
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_X B WITH(NOLOCK) ON A.T_MKT_POLO_ORDER_IN_ID = B.T_MKT_POLO_ORDER_IN_ID
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_HIST C WITH(NOLOCK) ON C.TASK_ID = A.TASK_ID
WHERE CONVERT(DATE,A.DISTRIBUTED_DT) = '2023-12-1'
and a.id_no='3573041506640007'
--A.TASK_ID = 'POL000795098'
--and a.id_no=''
--and c.pengajuan_no='KWNI848320230007721'
ORDER BY A.DISTRIBUTED_DT ASC

select top 1 tmpoi.DISTRIBUTED_DT , tmpoi.SOURCE_DATA , tmpoi.ID_NO , tmpoi.CUST_NAME , tmpoi.DUKCAPIL_RESULT , neg.negative_cust_id
from T_MKT_POLO_ORDER_IN tmpoi 
join T_MKT_POLO_ORDER_IN_X tmpoix on tmpoi.T_MKT_POLO_ORDER_IN_ID =tmpoix.T_MKT_POLO_ORDER_IN_ID
left join confins..negative_cust neg on neg.id_no=tmpoi.ID_NO
where tmpoix.PENGAJUAN_NO ='KWNI848320230007732'
order by tmpoi.dtm_crt desc




select  
top 4 json_value(PARAMETERs, '$.check_type')check_type
, json_value(PARAMETERs, '$.nik')nik
, json_value(PARAMETERs, '$.fullname')fullname
, json_value(response, '$.result')result 
--, response
 from creditscore_backend..api_call_log cae
where cae.created_datetime >= DATEADD(MINUTE ,-60,getdate())
and cae.created_datetime <= getdate()
and json_value(PARAMETERs, '$.check_type') not in  ('tele status','customer rating')
and json_value(PARAMETERs, '$.nik') in ('3402175003890002', '3573041506640007')
order by cae.created_datetime desccreated_datetim

SELECT TOP(1)A.DISTRIBUTED_DT, A.SOURCE_DATA,A.TASK_ID,B.PENGAJUAN_NO,C.PENGAJUAN_NO PENGAJUAN_NO_HIST, B.IS_PRE_APPROVAL, A.FINAL_RESULT_CAE, C.FINAL_RESULT_CAE FINAL_RESULT_CAE_HIST,
A.JENIS_TASK,C.JENIS_TASK,A.POLO_STEP,B.NEXT_STEP,
A.TASK_ID, A.CUST_NAME,A.ID_NO,A.BIRTH_DT,A.BIRTH_PLACE,a.spouse_id_no, a.spouse_name ,A.GUARANTOR_NAME,A.GUARANTOR_ID_NO, A.GUARANTOR_BIRTH_DT,A.GUARANTOR_BIRTH_PLACE,
A.TASK_ID, A.NEGATIVE_CUST,B.NEGATIVE_GUARANTOR,A.DUKCAPIL_STAT,A.DUKCAPIL_GUARANTOR_RESUT, A.MOBILE1, B.TELESTATUS, A.GUARANTOR_MOBILE_PHONE_NO, A.PHONE_CHECK_GUARANTOR,
B.BIOMETRIK, A.GUARANTOR_BIOMETRIC_RESULT, A.TASK_ID, a.dtm_crt
FROM WISE_STAGING..T_MKT_POLO_ORDER_IN A WITH(NOLOCK)
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_X B WITH(NOLOCK) ON A.T_MKT_POLO_ORDER_IN_ID = B.T_MKT_POLO_ORDER_IN_ID
JOIN WISE_STAGING..T_MKT_POLO_ORDER_IN_HIST C WITH(NOLOCK) ON C.TASK_ID = A.TASK_ID
WHERE CONVERT(DATE,A.DISTRIBUTED_DT) = '2023-12-1'
and a.id_no='3573041506640007' 
and c.pengajuan_no='KWNI848320230007732'
ORDER BY A.DISTRIBUTED_DT ASC





--cek data 
select a.AGRMNT_ID,AGRMNT_NO,SLIK_API_DT,CAE_DT,CAE_FINAL_RESULT,a.CAE_RESULT,PIPELINE_DUMMY_ID,PIPELINE_ID,IS_ACTIVE,IS_COMPLETE,MARITAL_STAT,ID_NO , a.dtm_crt
from wise_staging..t_mkt_polo_eligible a with(nolock) 
join wise_staging..t_mkt_polo_eligible_cae b with(nolock) on a.agrmnt_id = b.agrmnt_id
where is_active = 1 and is_processed = 1


