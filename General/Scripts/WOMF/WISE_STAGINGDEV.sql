select pinx.pengajuan_no, TASK_ID  ,pin.DISTRIBUTED_DT , SOURCE_DATA  , OFFICE_REGION_NAME , OFFICE_NAME , AGRMNT_NO 
, ID_NO , CUST_NAME , MOBILE1 , MONTHLY_INSTALMENT , BIRTH_DT , pinx.HOME_STAT , HOUSE_OWNERSHIP 
, DUKCAPIL_STAT , DUKCAPIL_RESULT ,NEGATIVE_CUST , pinx.TELESTATUS , pinx.BIOMETRIK , pinx.MARITAL_STAT
, pinx.IS_PRE_APPROVAL ,ELIGIBLE_FLAG , FINAL_RESULT_CAE , POLO_STAT , POLO_STEP , pinx.NEXT_STEP 
, SUBMIT_BY , ROLE_NAME 
, NOTES , pinx.LOB 
from t_mkt_polo_order_in pin
join t_mkt_polo_order_in_x pinx on pin.t_mkt_polo_order_in_id=pinx.t_mkt_polo_order_in_id
where 1=1 
--and pin.ID_NO ='3275065910910015'
and pin.TASK_ID ='POL000910857'  
--and pin.agrmnt_no ='802200048719'

 SELECT * FROM confins.dbo.REF_EMP re WHERE EMP_NO ='030100461'

select T_MKT_POLO_ORDER_IN_ID ,POLO_STEP, PROD_OFFERING_CODE from T_MKT_POLO_ORDER_IN tmpoi where TASK_ID ='POL000797620'

select T_MKT_POLO_ORDER_IN_ID,NEXT_STEP from T_MKT_POLO_ORDER_IN_X tmpoi where tmpoi.T_MKT_POLO_ORDER_IN_ID =1085414


SELECT * FROM M_MKT_POLO_PARAMETER mmpp WHERE PARAMETER_ID LIKE '%IDE%'

INSERT INTO WISE_STAGING.dbo.M_MKT_POLO_PARAMETER
( PARAMETER_ID, PARAMETER_TYPE, PARAMETER_VALUE, IS_ACTIVE, USR_CRT, DTM_CRT, USR_UPD, DTM_UPD)
VALUES( N'URL_DASHBOARD_IDE', N'URL_DASHBOARD_IDE', N'https://dashboardidedev.wom.co.id:10025/api/update_status_mss_ide', N'1', N'Initial', '2024-07-19 15:31:19.547', NULL, NULL);


SELECT * FROM CONFINS.dbo.CUST_PERSONAL_JOB_DTA cpjd WHERE MR_JOB_POSITION ='JOBPOS001' AND INDUSTRY_TYPE_ID =3

SELECT * FROM CONFINS.dbo.REF_MASTER rm WHERE REF_MASTER_TYPE_CODE  LIKE '%JOB_POSITION%' AND MASTER_CODE ='JOBPOS001'

select a.id_no,a.AGRMNT_ID,a.AGRMNT_NO,tmpoi.TASK_ID ,tmpoix.PENGAJUAN_NO , tmpoi.ORDER_NO  
,tmpoix.IS_PRE_APPROVAL , tmpoi.FINAL_RESULT_CAE 
,PIPELINE_DUMMY_ID,PIPELINE_ID
,a.city_res,a.KECAMATAN_RES , a.KELURAHAN_RES  ,a.office_name, a.PRODUCT_CATEGORY, a.is_pre_approval
, DATEDIFF(year, cast(a.BIRTH_DT as date ), cast(getdate() as date))  age
, a.MOTHER_NAME , a.SPOUSE_MOTHER_NAME 
, a.CUST_NAME , a.ID_NO , a.BIRTH_PLACE , a.BIRTH_DT 
, a.SPOUSE_ID_NO , a.SPOUSE_NAME , a.SPOUSE_BIRTH_DT , a.SPOUSE_BIRTH_PLACE 
, a.GUARANTOR_ID_NO , a.GUARANTOR_NAME , a.GUARANTOR_BIRTH_PLACE , a.GUARANTOR_BIRTH_DT 
, a.ZIPCODE_RES , a.SUB_ZIPCODE_RES 
, a.AGRMNT_NO , a.contract_stat
, a.PRODUCT_CATEGORY ,a.LOB_CODE  , a.ITEM_YEAR , a.ITEM_DESCRIPTION , a.ASSET_MODEL , a.ASSET_CATEGORY_CODE 
, rm.DESCR HOME_STAT , json_value(a.CAE_RESULT, '$.result[10].score_category')Cust_rating_CAE
, a.OTR_PRICE OTR, a.DOWNPAYMENT DP, a.NTF_AMT NTF, a.TENOR , a.MONTHLY_INSTALLMENT 
, a.JOB_POSITION , a.MONTHLY_INCOME , a.EDUCATION , a.INDUSTRY_TYPE_NAME , a.JOB_STATUS , a.JOB_ID, rm.DESCR JOB_NAME
, tmpoi.SUB_ZIPCODE_RES SUB_ZIPCODE_RES_POLO, a.SUB_ZIPCODE_RES SUB_ZIPCODE_RES_ELIGBL 
, tmpoi.OTR_PRICE OTR, tmpoi.DOWN_PAYMENT  DP, tmpoi.NTF_AMT NTF, tmpoi.TENOR , tmpoi.MONTHLY_INSTALMENT  
, tmpoi.FINAL_RESULT_CAE , tmpoi.SPOUSE_ID_NO , tmpoi.SPOUSE_NAME ,tmpoi.SPOUSE_BIRTH_DT , tmpoi.SPOUSE_BIRTH_PLACE  
, tmpoi.GUARANTOR_ID_NO , tmpoi.GUARANTOR_NAME ,tmpoi.GUARANTOR_BIRTH_DT , tmpoi.GUARANTOR_BIRTH_PLACE 
, tmpoi.DUKCAPIL_STAT , tmpoi.NEGATIVE_CUST , tmpoi.NUM_OF_RESET_CYCLING 
, tmpoix.NEGATIVE_SPOUSE , tmpoix.NEGATIVE_GUARANTOR , tmpoi.DUKCAPIL_SPOUSE_RESUT , tmpoi.DUKCAPIL_GUARANTOR_RESUT 
, tmpoi.POLO_STAT , tmpoi.POLO_STEP , tmpoix.NEXT_STEP 
, tmpoi.NOTES
from wise_staging.dbo.t_mkt_polo_eligible a with(nolock) 
LEFT join wise_staging.dbo.t_mkt_polo_eligible_cae b with(nolock) on a.agrmnt_id = b.agrmnt_id
LEFT JOIN T_MKT_POLO_ORDER_IN tmpoi ON tmpoi.AGRMNT_NO = a.agrmnt_no
LEFT JOIN T_MKT_POLO_ORDER_IN_X tmpoix ON tmpoix.T_MKT_POLO_ORDER_IN_ID = tmpoi.T_MKT_POLO_ORDER_IN_ID
LEFT JOIN CONFINS.dbo.REF_MASTER rm ON rm.MASTER_CODE = a.HOME_STAT AND rm.REF_MASTER_TYPE_CODE ='HOUSE_OWNERSHIP'
LEFT JOIN CONFINS.dbo.REF_MASTER job ON job.MASTER_CODE =a.JOB_POSITION AND  job.REF_MASTER_TYPE_CODE  = 'JOB_POSITION'
where a.is_active = 1 
--and is_processed = 1
and a.is_pre_approval = 0
and a.office_name='BEKASI'
and a.marital_stat='SIN'
AND a.LOB_CODE LIKE '%MGBMTRKON%'
--and a.contract_stat <>'LIV'
--and a.product_category ='MOTORKU' 
--and DATEDIFF(year, cast(a.BIRTH_DT as date ), cast(getdate() as date))  >34
--AND a.id_no ='3275050602870017'
and a.ID_NO ='3275065910910015'
ORDER BY a.OFFICE_NAME 

select 'Exclude Fleet' "FLAG", COUNT(1) TOTAL 
from wise_staging.dbo.V_POT_EXCLUDE vpo
where vpo.PROD_OFFERING_NAME not like '%FLEET%'
union ALL 
select 'Include Fleet' "FLAG", COUNT(1) TOTAL 
from wise_staging.dbo.V_POT_EXCLUDE vpo
where vpo.PROD_OFFERING_NAME like '%FLEET%'

select 'Exclude Fleet' "FLAG",  COUNT(1) TOTAL 
from wise_staging.dbo.V_POT_EXCLUDE vpo
where vpo.PROD_OFFERING_NAME  like '%FLEET%'
and vpo.PROD_OFFERING_CODE ='MGBMTRKON' 
--group by vpo.PROD_OFFERING_CODE


select LOB_CODE,OFFICE_NAME ,Count(1)Total_Fleet 
from V_POT 
where PROD_OFFERING_NAME like '%fleet%'
--and LOB_CODE in  ('MGBMTRKON','MGBMTRS')
group by LOB_CODE ,OFFICE_NAME

select * From confins.dbo.PROD_OFFERING po where po.PROD_OFFERING_NAME like '%fleet%'

select top 10 * from T_MKT_POLO_APILOGREQUEST tmpa 
order by REQUEST_DT desc

--Vf
select * from T_VF_SMS_REQUEST tvsr 
select * from T_VF_SMS_RESPONSE tvsr 

--Sms BOX
select * from T_SMS_BOX_REQUEST tsbr 
select * from T_SMS_BOX_RESPONSE tsbr 

and a.id_no='3511000901707212'

SELECT * FROM confins.dbo.prod_offering WHERE prod_offering_name LIKE '%lease%motorku%'  AND IS_ACTIVE =1


SELECT DISTINCT lob_code, IS_PRE_APPROVAL,IS_ACTIVE  from wise_staging.dbo.t_mkt_polo_eligible a WHERE IS_ACTIVE  =1

SELECT SUBMIT_BY , ROLE_NAME  , tmpoix.LOB 
FROM T_MKT_POLO_ORDER_IN tmpoi 
JOIN T_MKT_POLO_ORDER_IN_X tmpoix ON tmpoix.T_MKT_POLO_ORDER_IN_ID =tmpoi.T_MKT_POLO_ORDER_IN_ID 
WHERE lob ='FASDANMBL'

UPDATE a 
SET is_active=1 
FROM t_mkt_polo_eligible  a
WHERE a.LOB_CODE ='FASDANMBL'

SELECT * FROM confins.dbo.ref_lob


SELECT po.PROD_OFFERING_ID ,po.PROD_OFFERING_CODE , po.PROD_OFFERING_NAME , ro.OFFICE_NAME 
FROM confins.dbo.PROD_OFFERING po
JOIN confins.dbo.PROD_BRANCH pb ON po.PROD_BRANCH_ID =pb.PROD_BRANCH_ID 
JOIN confins.dbo.REF_OFFICE ro ON ro.REF_OFFICE_ID =pb.REF_OFFICE_ID 
WHERE PROD_OFFERING_NAME LIKE '%MAS%'
AND po.IS_ACTIVE =1


SELECT ag.AGRMNT_NO , ap.APP_NO  , ro.OFFICE_NAME , ag.CONTRACT_STAT , ap.APP_STAT 
FROM confins.dbo.agrmnt ag
JOIN confins.dbo.app ap ON ag.APP_ID =ap.APP_ID 
JOIN confins.dbo.REF_OFFICE ro ON ro.REF_OFFICE_ID =ag.REF_OFFICE_ID 
WHERE ag.PROD_OFFERING_ID =15751
AND ro.OFFICE_NAME ='BEKASI SYARIAH'

SELECT DISTINCT ASSET_TYPE_NAME  FROM confins.dbo.STAGING_AUTO_INSCO_BRANCH saib 


SELECT TOP 1 MACHINE_NO , CHASSIS_NO  FROM T_MKT_POLO_ORDER_IN tmpoi 

select  * from confins.dbo.NEGATIVE_CUST nc where nc.id_no='7371026204730006'

SELECT * FROM confins.dbo.REF_EMP re WHERE re.EMP_NO ='000170567'

select is_active,count(1) from wise_staging..t_mkt_polo_eligible a with(nolock) group by is_active

select * from confins..ref_master where ref_master_type_code ='HOUSE_OWNERSHIP'

SELECT * FROM confins.dbo.REF_ZIPCODE rz WHERE rz.SUB_ZIPCODE ='E5660'

SELECT * FROM CONFINS.dbo.REF_USER ru WHERE ru.USERNAME ='030100461' OR USERNAME ='030100461'--002170272

SELECT * FROM confins.dbo.REFERANTOR_X rx 
WHERE REFERANTOR_NAME LIKE '%IT QA%'
ORDER BY USR_CRT desc



--market price
--select * from sys.all_objects where 
select * from information_schema.routines where ROUTINE_DEFINITION  like '%ITEM_DESC%'
sp_helptext spMKT_POLO_API_TASK_KONFIRMASI_TO_PENAWARAN

select ID_NO,agrmnt_no ,cust_no, CUST_NAME , SPOUSE_ID_NO , SPOUSE_NAME ,MARITAL_STAT , GUARANTOR_ID_NO , GUARANTOR_NAME , BIRTH_DT , BIRTH_PLACE 
, DATEDIFF(year, cast(BIRTH_DT as date ), cast(getdate() as date))  age
,e.IS_ACTIVE , DISTRIBUTED_DT , CAE_FINAL_RESULT , e.IS_PRE_APPROVAL  , DUKCAPIL , DUKCAPIL_API_DT 
, SCHEME_ID , SLIK_CBASID 
,ADDR_RES , CITY_RES , KECAMATAN_RES , KELURAHAN_RES 
,CUST_RATING ,ASSET_TYPE , ITEM_DESCRIPTION 
, OFFICE_CODE , OFFICE_NAME  ,OFFICE_REGION_NAME 
, json_value(e.CAE_RESULT, '$.result[10].score_category')Cust_rating_CAE
--data survey
, HOME_STAT , rm.descr HOME_STAT_NAME
--data product
, PRODUCT_CATEGORY , ITEM_BRAND , ITEM_DESCRIPTION , ITEM_TYPE , ITEM_YEAR 
, lob.LOB_CODE , lob.lob_name, prod_offering_code, e.ASSET_AGE 
--data Simulasi Kredit
, e.TENOR , e.NTF_AMT , e.MONTHLY_INSTALLMENT ANGSURAN, e.DOWNPAYMENT , e.OTR_PRICE 
--data penghasilan
,e.MONTHLY_INCOME , e.EDUCATION 
from t_mkt_polo_eligible e 
left join confins..ref_lob lob on e.LOB_CODE =lob.lob_code
left join confins..ref_master rm on e.HOME_STAT = rm.master_code and rm.ref_master_type_code ='HOUSE_OWNERSHIP'

where agrmnt_no='1531120220203454'--'806000055842'

  
3275061612700010	6629627	1133120210708035

POL000795387
POL000795386
POL000795385


select top 1000 json_value(parameters, '$.check_type')check_type
,isnull(json_value(parameters, '$.nik'),json_value(parameters, '$.phone')) "nik/phone"
,json_value(parameters, '$.IsPreApproval') IsPreApproval
,json_value(response, '$.result') result
,json_value(response, '$.ResponseMessage') responseMessage
--,left(cae.parameters,100)parameters
--,left(cae.response,100)response
--,cae.parameters
,cae.response
, cae.created_source
,cae.created_datetime
from creditscore_backend..api_call_log cae
where cast(created_datetime as date) = cast(getdate() as date)
and created_datetime >'2023-12-30 14:40:19.110'
--and created_datetime <='2023-12-28 11:38:05.907'
and json_value(parameters, '$.check_type') <>'customer rating'
and created_source <>'POSTMAN'

--and json_value(parameters, '$.check_type') in ('data dukcapil' , 'data dukcapil')
--and (json_value(parameters, '$.nik') in ('6403030107840034','6403030107840034','3603281405880004') or json_value(parameters, '$.phone') in ('085217780299','085217780299','085217780299'))
order by created_datetime desc

select top 10 * from creditscore_backend..api_call_log cae order by created_datetime desc

select * 
from creditscore_backend..error_log with(nolock)
where 
error_source like '%workflow%' and
 convert(date,created_datetime)='2023-12-29'and
 error like '%POL000795641%' 

select  lrr.LOG_ID  , LOG_DT  
,case when isjson(LOG_PAYLOAD)=1 then json_value(LOG_PAYLOAD,'$.IsPreApproval') end IsPreApproval 
,case when isjson(LOG_PAYLOAD)=1  then json_value(LOG_PAYLOAD, '$[0].NextStep.value') end NextStep 
,LOG_FUNCTION ,LOG_PAYLOAD ,LOG_TYPE  ,LOG_METHOD ,  LOG_IP
from LOG_REQUEST_RESPONSE lrr 
where log_dt>'2024-08-20 10:00:25.670'
--and log_dt <='2023-12-22 15:10:53.077'
and (LOG_FUNCTION  like '%UpdateFromMSS%'
or LOG_PAYLOAD like '%5834667%')
--and LOG_ID in ('a94423ba-1024-4ed7-a11c-b9a24f512cdb')
order by LOG_DT  desc

https://wom-polo-cae-uat.wom.co.id:8443/api/Pengajuan/UpdateFromMSS

SELECT * FROM LOG_REQUEST_RESPONSE lrr WHERE lrr.LOG_ID ='ac78c645-48a6-436b-9c81-e3ab5790a8ce'

select top 10 * 
from LOG_REQUEST_RESPONSE lrr where lrr.LOG_PAYLOAD like '%mrNapCancelReason%'
and LOG_FUNCTION not like '%http://%/cae_score%'
and LOG_FUNCTION  not like '%http://%/override_cae_result%'

select * from confins..ref_office where office_code=1331
select * from confins..ref_office_x where ref_office_id=454

SELECT * FROM confins.dbo.REF_LOB rl 

select *
--json_value(LOG_PAYLOAD, '$[0].NextStep.value')
,case when isjson(LOG_PAYLOAD)=1  then json_value(LOG_PAYLOAD, '$[0].NextStep.value') end NextStep 
from LOG_REQUEST_RESPONSE lrr 
where LOG_ID in ('99bff6b0-8835-420c-96e7-b82ccc9bda3c')
order by LOG_DT  desc

select pin.CUST_NO, pin.CUST_NAME  , pin.ID_NO ,pin.MOBILE1  ,t_mkt_polo_order_in_x_id,TASK_ID, pin.AGRMNT_NO,pin.ORDER_NO  ,pin.PROSPECT_STAT , pinx.LOB , pin.ITEM_TYPE , ITEM_DESCRIPTION 
,pinx.IS_PRE_APPROVAL ,ELIGIBLE_FLAG , FINAL_RESULT_CAE , POLO_STAT , POLO_STEP , pinx.NEXT_STEP
, pin.DTM_CRT , pin.USR_CRT , pin.USR_UPD , pin.DTM_UPD ,pin.SOURCE_DATA , pinx.OPSI_PENANGANAN 
, pin.NUM_OF_RESET_CYCLING , pin.JENIS_TASK 
, pin.GUARANTOR_ID_NO , pin.SPOUSE_NAME  , pin.SPOUSE_BIRTH_DT , pin.GUARANTOR_NAME , GUARANTOR_ID_NO , pin.NEGATIVE_CUST 
, pin.OFFICE_NAME , pin.OFFICE_CODE 
, pin.SUB_ZIPCODE_RES 
, pinx.MARITAL_STAT 
, pin.NEGATIVE_CUST , pinx.NEGATIVE_SPOUSE , pinx.NEGATIVE_GUARANTOR  
,pin.DUKCAPIL_STAT  , pin.DUKCAPIL_RESULT  , pin.DUKCAPIL_GUARANTOR_RESUT , pin.DUKCAPIL_SPOUSE_RESUT , pin.STATUS_TASK_MSS 
, pin.POLO_STAT,pin.POLO_STEP  , pinx.NEXT_STEP 
, pin.USR_UPD 
from t_mkt_polo_order_in pin
join t_mkt_polo_order_in_x pinx on pin.t_mkt_polo_order_in_id=pinx.t_mkt_polo_order_in_id
where TASK_ID in ('POL000797020')

SELECT ap.APP_NO, ag.AGRMNT_NO  , ap.APP_STEP , ap.APP_STAT , apx.IS_FOLLOW_UP , apx.IS_PROD_INFO  
, ap.CUST_ID , cu.CUST_NO , cu.CUST_NAME, cpx.MOBILE_PHN_PREFIX_1  ,cp.MOBILE_PHN_NO_1 , cp.MOBILE_PHN_NO_2  
, cpsp.CUST_ID , cusp.CUST_NAME SPOUSE_NAME ,cpxsp.MOBILE_PHN_PREFIX_1, cpsp.MOBILE_PHN_NO_1 , cpsp.MOBILE_PHN_NO_2 
, ro.OFFICE_NAME , cp.E_MAIL_1 , cp.E_MAIL_2 
FROM confins.dbo.app ap 
JOIN confins.dbo.agrmnt ag ON ap.APP_ID =ag.APP_ID 
JOIN confins.dbo.app_x apx ON ap.APP_ID =apx.APP_ID 
JOIN confins.dbo.cust cu ON cu.CUST_ID =ap.CUST_ID 
JOIN confins.dbo.CUST_PERSONAL cp ON cp.CUST_ID =ap.CUST_ID 
JOIN confins.dbo.CUST_PERSONAL_X cpx ON cp.CUST_ID =cpx.CUST_ID 
LEFT JOIN confins.dbo.cust cusp ON cusp.CUST_ID =ap.SPOUSE_ID 
LEFT JOIN confins.dbo.CUST_PERSONAL cpsp ON cpsp.CUST_ID =ap.SPOUSE_ID 
LEFT JOIN confins.dbo.CUST_PERSONAL_X cpxsp ON cpxsp.CUST_ID =ap.SPOUSE_ID 
LEFT JOIN confins.dbo.REF_OFFICE ro ON ro.REF_OFFICE_ID =ap.REF_OFFICE_ID 
WHERE ap.APP_NO ='APP356220240300001'

SELECT * FROM T_MKT_POLO_ORDER_IN tmpoi  WHERE AGRMNT_NO ='116312019000099'
 
SELECT * FROM confins.dbo.CUST_PERSONAL cp WHERE CUST_ID =19542353
SELECT * FROM confins.dbo.CUST_PERSONAL_X cpx WHERE CUST_ID =19542353

SELECT * FROM confins.dbo.ref_form WHERE REF_FORM_ID =41259--form_name LIKE '%ERROR%'
SELECT * FROM confins.dbo.ref_folder WHERE REF_FOLDER_ID =41259
SELECT * FROM confins.dbo.ref_user WHERE username='008224908' OR username='008222038'


select * from confins..cust where cust_no='CUS133120211120262'

select * from confins.dbo.negative_cust where id_no='3511000901707212'

select NEXT_STEP, opsi_penanganan  from t_mkt_polo_order_in_x where t_mkt_polo_order_in_x_id  =899224
select SPOUSE_BIRTH_DT  from t_mkt_polo_order_in where TASK_ID ='POL000795284'

select * from 

TASK_ID ='POL000795385'

in ('POL000795385','POL000795386','POL000795387')

TASK_ID ='POL000795285'

in ('POL000795385','POL000795386','POL000795387')

EXEC sp_linkedservers;

SELECT * FROM confins.dbo.PROD p WHERE PRODUCT_NAME LIKE '%logam%'
SELECT * FROM confins.dbo.PROD_BRANCH pb 


SELECT * FROM LOG_REQUEST_RESPONSE lrr 
WHERE (lrr.LOG_FUNCTION LIKE '%POL000910857%' 
OR LOG_PAYLOAD LIKE '%POL000910857%')
AND lrr.LOG_PAYLOAD  LIKE '%5834667%'
ORDER BY log_dt desc



declare @data nvarchar(500)= '[{"ResetData":{"type":"String","value":"N","valueInfo":{}},"NextStep":{"type":"String","value":"TASK CAE","valueInfo":{}}}]'
select isjson(@data)
select json_value(@data, '$[0].NextStep.value')

select pinx.pengajuan_no, TASK_ID, pin.AGRMNT_NO  ,pin.DISTRIBUTED_DT , SOURCE_DATA  , OFFICE_REGION_NAME , OFFICE_NAME , AGRMNT_NO 
, ID_NO , CUST_NAME , MOBILE1 , MONTHLY_INSTALMENT , BIRTH_DT , pinx.HOME_STAT , HOUSE_OWNERSHIP , pin.SUB_ZIPCODE_RES 
, pin.SPOUSE_NAME , pin.SPOUSE_ID_NO , pin.SPOUSE_MOBILE_PHONE_NO 
, pin.GUARANTOR_NAME , pin.GUARANTOR_ID_NO , pin.GUARANTOR_MOBILE_PHONE_NO 
, DUKCAPIL_STAT , DUKCAPIL_RESULT ,NEGATIVE_CUST , pinx.TELESTATUS , pinx.BIOMETRIK , pinx.MARITAL_STAT, pin.IS_SPOUSE_APPROVAL 
, pinx.IS_PRE_APPROVAL ,ELIGIBLE_FLAG , FINAL_RESULT_CAE , POLO_STAT , POLO_STEP , pinx.NEXT_STEP 
, SUBMIT_BY , ROLE_NAME , pinx.IS_PRE_APPROVAL 
, NOTES , pinx.SUB_STATUS_CALL , pin.FLAG_VOID_SLA , pin.NUM_OF_RESET_CYCLING , pin.TASK_ID_MSS 
from t_mkt_polo_order_in pin
join t_mkt_polo_order_in_x pinx on pin.t_mkt_polo_order_in_id=pinx.t_mkt_polo_order_in_id
where pin.TASK_ID ='POL000797033'

SELECT pin.T_MKT_POLO_ORDER_IN_ID ID_polo ,TASK_ID, APP_NO  , CUST_NAME ,OFFICE_NAME , SUB_ZIPCODE_RES , POLO_STEP , pinx.NEXT_STEP 
, task_id_mss  , pinx.IS_FOLLOW_UP , pinx.IS_PRODUCT_INFORMATION 
from t_mkt_polo_order_in pin
join t_mkt_polo_order_in_x pinx on pin.t_mkt_polo_order_in_id=pinx.t_mkt_polo_order_in_id
where pin.TASK_ID ='POL000797033'

select * from T_MKT_POLO_ORDER_IN tmpoi  where AGRMNT_NO ='1133120221113701'

3275061612700010
pin.AGRMNT_NO ='1133120191001781'

pin.AGRMNT_NO ='1133120221113701'

pin.ID_NO ='7309084202860002'

TASK_ID in ( 'POL000795188')

select pinx.pengajuan_no, TASK_ID, pin.AGRMNT_NO  , pin.ORDER_NO  , pin.JENIS_TASK 
,pinx.IS_PRE_APPROVAL ,ELIGIBLE_FLAG , FINAL_RESULT_CAE , POLO_STAT , POLO_STEP , pinx.NEXT_STEP
, pin.DTM_CRT , pin.USR_CRT , pin.SOURCE_DATA , pin.NEGATIVE_CUST, pinx.OPSI_PENANGANAN , pinx.SUB_STATUS_CALL 
from t_mkt_polo_order_in pin
join t_mkt_polo_order_in_x pinx on pin.t_mkt_polo_order_in_id=pinx.t_mkt_polo_order_in_id
where  
TASK_ID = 'POL000795630  '

--in ('POL000795373' ,'POL000795376' ,'POL000795361' ,'POL000795365' ,'POL000795394' ,'s' ,'POL000795369' ,'POL000795188' ,'POL000795395' ,'POL000795396' ,'POL000795399' ,'POL000795398' ,'POL000795397')
 
select POLO_STAT , POLO_STEP , NEXT_STEP , FINAL_RESULT_CAE, DTM_CRT , USR_CRT , DTM_UPD , USR_UPD  
from t_mkt_polo_order_in_hist 
where TASK_ID in ( 'POL000795611 ')
order by T_MKT_POLO_ORDER_IN_HIST_ID asc
--agrmnt_no='1133120210607486'


select tmpe.OFFICE_NAME, MARITAL_STAT  , count(1)
from T_MKT_POLO_ELIGIBLE tmpe 
where IS_PRE_APPROVAL =1
group by OFFICE_NAME ,MARITAL_STAT 
order by COUNT(1) desc 

select customer_id, customer_name, product, product_name, application_no 
, tele_status, biometric_status, biometric_score, branch, region
,layer, app_status, prospect_status_raw, taskIdPolo, polo_response
,is_pre_approval
From financing_application where application_no='KWNI908020230007798'

select * from confins..ref_emp where emp_no='001230812'--'100200477'--'028214861'
select  * from confins..ref_user where ref_emp_id='714173' and is_active=1

select * from T_MKT_POLO_ORDER_IN tmpoi  where tmpoi.USR_UPD  like '%MOBILE%'

select top 3 * from T_MKT_POLO_ORDER_IN tmpoi where orderid_no='3174081105800006' order by dtm_crt desc

select * from M_MKT_POLO_parameter tmpa where PARAMETER_value like '%.224%'
select * from T_MKT_POLO_APILOGREQUEST tmpa2 where id_name like '%penawaran%' order by request_dt desc

select top 10 * from T_MKT_POLO_APILOGREQUEST tmpa2 
where  TASK_ID in ( 'POL000795385 ')
order by request_dt desc

http://10.1.49.224/womapi/task_penawaran/taskpenawaran

SELECT ur.id AS role_id, ur.role, gmst.id, gmst.group_master, gmbr.userid, c.fullname , ur.is_pre_approval
FROM user_role ur LEFT JOIN user_role_detail urd ON urd.id_user_role = ur.id LEFT JOIN group_master gmst ON gmst.id = urd.id_group_master LEFT JOIN group_member gmbr ON gmbr.id_group_master = gmst.id LEFT JOIN customer c ON c.NIK = gmbr.userid WHERE ur.is_active = '1' AND ur.role LIKE '%FL%'  
and ur.is_pre_approval=1 
and gmbr.userid in ('100200886')
ORDER BY c.fullname ASC

select top 10 lrr.LOG_ID  , LOG_FUNCTION , LOG_TYPE  ,LOG_METHOD ,  LOG_IP , LOG_DT, LOG_PAYLOAD 
from LOG_REQUEST_RESPONSE lrr
where log_dt>'2023-12- 17:50:04.04'
--and log_dt <='2023-12-18 15:36:14.213'
and LOG_FUNCTION  like '%POLO%'
order by LOG_DT  desc

select tmpe.OFFICE_REGION_CODE , tmpe.OFFICE_REGION_NAME , tmpe.OFFICE_CODE , tmpe.OFFICE_NAME , IS_PRE_APPROVAL , count(1)
from T_MKT_POLO_ELIGIBLE tmpe 
join wise_staging..cc_ts_penawaran_job crm on tmpe.AGRMNT_NO =crm.agrmnt_no 
and tmpe.OFFICE_REGION_CODE = crm.OFFICE_REGION_CODE
and tmpe.OFFICE_CODE  = crm.OFFICE_CODE
group by tmpe.OFFICE_REGION_CODE , tmpe.OFFICE_REGION_NAME , tmpe.OFFICE_CODE , tmpe.OFFICE_NAME , IS_PRE_APPROVAL 

SELECT * FROM confins.dbo.agrmnt WHERE PROD_OFFERING  =45169

SELECT count(1) FROM confins.dbo.PROD_OFFERING po WHERE po.PROD_OFFERING_CODE ='PRODOFFERINGBARU'

-- LIKE '%leaseback%motorku%'


SELECT * FROM WISE_STAGING..T_MKT_POLO_APILOGREQUEST WITH(NOLOCK)
WHERE  ID_NAME IN ('Inbound_Task_Konfirmasi_To_CRM','Task_Penawaran')
AND TASK_ID = 'POL000795267'

SELECT * FROM WISE_STAGING..T_MKT_POLO_APILOGRESPONSE WITH(NOLOCK)
WHERE ID_NAME IN ('Inbound_Task_Konfirmasi_To_CRM','Task_Penawaran')
AND TASK_ID = 'POL000795267'


select * from wise_staging..cc_ts_penawaran_job

SELECT * FROM confins.dbo.cust WHERE CUST_NO ='CUS356220240601745'

select  lrr.LOG_ID  , LOG_FUNCTION ,LOG_PAYLOAD, LOG_TYPE  ,LOG_METHOD ,  LOG_IP , LOG_DT
from LOG_REQUEST_RESPONSE lrr
where log_dt>'2024-08-20 18:00:36.823'
--and log_dt <='2023-12-18 18:14:18.673'
and (LOG_FUNCTION  like '%POL000910857%'
or LOG_PAYLOAD like '%POL000910857%')
order by LOG_DT  desc



select * from LOG_REQUEST_RESPONSE lrr where LOG_ID  = '715dc42b-2d98-4e1a-8bdb-d4ceb17ff91a' 

declare @jsonStr nvarchar(max)

select @jsonStr=LOG_PAYLOAD 
from LOG_REQUEST_RESPONSE lrr where LOG_ID  = 'bbb2ee70-7398-4a51-ba17-c1bf7a9e21c3' and LOG_TYPE ='REQUEST'
select * from openjson(@jsonStr,'$')

SELECT TASK_ID ,ID_NO  , AGRMNT_NO , app_no, CUST_NAME , SPOUSE_NAME , GUARANTOR_NAME , tmpoix.MARITAL_STAT , tmpoix.LOB 
, MOBILE1 , SUB_ZIPCODE_RES , tmpoix.INSCO_BRANCH_NAME 
FROM T_MKT_POLO_ORDER_IN tmpoi 
JOIN T_MKT_POLO_ORDER_IN_X tmpoix ON tmpoi.T_MKT_POLO_ORDER_IN_ID =tmpoix.T_MKT_POLO_ORDER_IN_ID 
WHERE tmpoi.TASK_ID ='POL000797081' --tmpoi.app_no='APP336220240300001'

SELECT * FROM CONFINS..PROD_OFFERING po WITH (nolock)
WHERE po.PROD_OFFERING_NAME LIKE '%fleet%'

SELECT ro.OFFICE_NAME ,po.PROD_OFFERING_NAME , po.IS_ACTIVE 
FROM confins.dbo.prod_offering po 
JOIN confins.dbo.PROD_BRANCH pb ON po.PROD_BRANCH_ID =pb.PROD_BRANCH_ID 
JOIN confins.dbo.REF_OFFICE ro ON ro.REF_OFFICE_ID =pb.REF_OFFICE_ID 
WHERE PROD_OFFERING_NAME  LIKE '%LOGAM MULIA%'
AND ro.OFFICE_name LIKE '%TANGERANG%'
AND PROD_OFFERING_CODE ='OFFLM10GRM30MNT'

select * from confins.dbo.ref_user where username='234160203' OR USERNAME ='000170845'

SELECT * FROM confins.dbo.ref_emp WHERE emp_name LIKE '%ana sur%'

select * from confins.dbo.agrmnt 



000170845	ANNE OCTAVIANI
000170471	DADAN SUNANDAR
ADINSPRD
000180611	SYAHRUL YULARDI
00908023	MOGA MULYA SAPUTRA
029110542 - HARIYANTO
234193753 - WIBOWO
234160203 - NJAUW VIDO ONADI

SELECT ag.AGRMNT_NO , ap.APP_NO  , ro.OFFICE_NAME , ag.CONTRACT_STAT , ap.APP_STAT , po.PROD_OFFERING_NAME , ag.LOB_CODE 
FROM confins.dbo.agrmnt ag
JOIN confins.dbo.app ap ON ag.APP_ID =ap.APP_ID 
JOIN confins.dbo.REF_OFFICE ro ON ro.REF_OFFICE_ID =ag.REF_OFFICE_ID 
JOIN confins.dbo.PROD_OFFERING po ON po.PROD_OFFERING_ID =ag.PROD_OFFERING_ID 
WHERE ag.LOB_CODE ='MGBMTRSYR'

SELECT SUPPL_NAME  FROM T_MKT_POLO_ORDER_IN tmpoi  WHERE PROD_OFFERING_CODE LIKE 'OFFLM%'

SELECT TOP 10 ag.AGRMNT_No, ag.APP_ID,ap.APP_NO ,  po.PROD_OFFERING_CODE, po.PROD_OFFERING_NAME 
FROM confins.dbo.agrmnt ag 
JOIN confins.dbo.PROD_OFFERING po ON po.PROD_OFFERING_ID =ag.PROD_OFFERING_ID 
JOIN confins.dbo.app ap ON ap.APP_ID =ag.APP_ID 
WHERE po.PROD_OFFERING_CODE='OFFOFFMTRKUK' 




SELECT a.APP_ID ,a.APP_NO,a.APP_STAT , a.APP_STEP, ag.AGRMNT_NO,c.CUST_NO ,cp.CUST_FULL_NAME,cpx.MOBILE_PHN_PREFIX_1 
,cp.MOBILE_PHN_NO_1, cp.MOBILE_PHN_NO_2, cp.E_MAIL_1 
,vwt.USERNAME, vwt.ROLE_CODE, vwt.OFFICE_CODE ,vwt.TRANSACTION_CODE , vwt.ACT_CODE , adhx.CATEGORY , vwt.STATE_DELEGATE 
--INTO #tempData
FROM confins.dbo.APP a 
JOIN confins.dbo.agrmnt ag ON ag.APP_ID = a.APP_ID 
JOIN confins.dbo.CUST_PERSONAL cp ON cp.CUST_ID =ag.CUST_ID 
JOIN confins.dbo.CUST_PERSONAL_X cpx ON cpx.CUST_ID = ag.CUST_ID 
JOIN confins.dbo.CUST c ON c.CUST_ID =ag.CUST_ID 
LEFT JOIN confins.dbo.AUTO_DIST_H_X adhx ON adhx.APP_ID=a.APP_ID 
LEFT JOIN confins.dbo.VIEW_WF_TASKLIST vwt ON vwt.TRANSACTION_CODE =a.APP_NO 
LEFT JOIN confins.dbo.REF_EMP re ON re.EMP_NO =vwt.USERNAME 
WHERE a.APP_NO IN ('APP356220240600009')
--AND vwt.USERNAME ='239160401'
--AND vwt.ACT_CODE in ('PHNVERF','CRD_REVIEW')
--AND adhx.CATEGORY = 'PRIORITY'
--AND vwt.STATE_DELEGATE =1

SELECT SPOUSE_ID FROM confins.dbo.agrmnt WHERE AGRMNT_NO ='1356220240600864_1'
SELECT APP_ID FROM confins.dbo.app a WHERE a.app_no='APP356220240600006'


SELECT username,act_code,CATEGORY,STATE_DELEGATE, count(1) 
FROM #tempData
WHERE category = 'PRIORITY' 
GROUP BY username,act_code,CATEGORY,STATE_DELEGATE

SELECT *FROM #tempData WHERE category = 'PRIORITY'

/cek priority/
SELECT vw.USERNAME, vw.ACT_CODE, ax.CATEGORY, vw.STATE_DELEGATE, count(1)
--UPDATE ax 
--SET ax.CATEGORY ='NORMAL'
FROM confins.dbo.AUTO_DIST_H_X ax 
JOIN confins.dbo.app a ON a.APP_ID =ax.APP_ID 
JOIN confins.dbo.VIEW_WF_TASKLIST vw ON vw.TRANSACTION_CODE =a.APP_NO 
--JOIN #tempData tmp ON tmp.app_id=a.APP_ID 
WHERE ax.category = 'PRIORITY' 
AND vw.act_code IN ('PHNVERF','CRD_REVIEW')
AND vw.STATE_DELEGATE =2
AND vw.USERNAME ='239160401'
GROUP BY vw.USERNAME, vw.ACT_CODE, ax.CATEGORY, vw.STATE_DELEGATE 

SELECT ax.*
FROM confins.dbo.AUTO_DIST_H_X ax 
WHERE ax.APP_ID =6616480

SELECT a.APP_ID ,a.APP_NO ,CATEGORY 
FROM confins.dbo.AUTO_DIST_H_X ax 
JOIN confins.dbo.app a ON a.APP_ID =ax.APP_ID 
WHERE a.APP_NO ='APP004120240600172'

SELECT b.app_id,a.ACT_CODE, c.CATEGORY , APP_NO , a.STATE_DELEGATE 
FROM confins.dbo.VIEW_WF_TASKLIST A
JOIN confins.dbo.APP B ON A.TRANSACTION_CODE = B.APP_NO
JOIN confins.dbo.AUTO_DIST_H_X C ON B.APP_ID = C.APP_ID
WHERE A.STATE_DELEGATE = 1 AND (A.ACT_CODE = 'PHNVERF' OR A.ACT_CODE = 'CRD_REVIEW')
AND A.USERNAME = '00807005'
--AND  c.app_id=10489237
AND C.CATEGORY = 'PRIORITY'

-- kalo AUTO_DIST_H_Xnya normal & VIEW_WF_TASKLIST jumlahnya > 0 kena validasi

SELECT *
FROM WFFOUNDATION.dbo.wf_task_list a WITH(NOLOCK)
WHERE a.TRANSACTION_CODE='APP004120240600167'
ORDER BY wf_task_list_id

UPDATE a
SET STATE_DELEGATE=2
FROM WFFOUNDATION.dbo.wf_task_list a WITH(NOLOCK)
WHERE a.TRANSACTION_CODE='APP004120240600167'
AND act_code='CRD_REVIEW' AND STATE_DELEGATE=1


SELECT LOB_CODE  FROM confins.dbo.app WHERE app_no='APP004120240600153'

SELECT * FROM confins.dbo.AGRMNT a  WHERE LOB_CODE ='SLBMTR'

SELECT * FROM confins.dbo.REF_EMP re WHERE re.emp_no ='239160585'

SELECT * FROM confins.dbo.REF_user WHERE username IN ('00807005' , '00810580')

SELECT * FROM confins.dbo.APP a 

select * from MOBILE_SURVEY.WOMFMSS.dbo.TR_TASK_H




-- user wise
select utr.USER_TITLE_ROLE_ID  ,ru.username,re.emp_name,ep.REF_OFFICE_ID,ro.OFFICE_NAME 
, ep.ORG_JOB_TITLE_ID , utr.*, rr.REF_ROLE_ID,rr.role_code,rr.role_name, ep.ORG_JOB_TITLE_ID 
, rf2.folder_Name,rf.REF_FORM_ID ,rf.FORM_NAME 
, ru.REF_EMP_ID , ep.EMP_POSITION_ID , ep.ref_office_id
, ru.ref_emp_id,utr.ref_role_id, ep.REF_EMP_ID 
,utr.IS_ACTIVE
from CONFINS.dbo.REF_USER ru with (nolock)
left join CONFINS.dbo.EMP_POSITION ep with (nolock) on ru.ref_emp_id=ep.ref_emp_id
left join CONFINS.dbo.USER_TITLE_ROLE utr with (nolock) on ep.EMP_POSITION_ID=utr.EMP_POSITION_ID
left join CONFINS.dbo.REF_ROLE rr with (nolock) on utr.ref_role_id=rr.ref_role_id
left join CONFINS.dbo.ref_office ro with (nolock) on ep.ref_office_id =ro.ref_office_id
left join CONFINS.dbo.ref_emp re with (nolock) on re.emp_no=ru.username
left join confins.dbo.AUTH_FORM af with (nolock) on af.REF_ROLE_ID = rr.REF_ROLE_ID 
left join confins.dbo.REF_FORM rf with (nolock) on rf.REF_FORM_ID = af.REF_FORM_ID 
LEFT JOIN confins.dbo.REF_FOLDER rf2 ON rf.ref_folder_id=rf2.ref_folder_id
where rr.role_code=rr.role_code--'00005'  
--and role_name like '%credit%at_dealer'
--and rf.FORM_NAME  like '%credit%%'
and utr.IS_ACTIVE=1
and ru.IS_ACTIVE =1
and ro.office_name like '%BEKASI%'--446170797
--and ro.REF_OFFICE_ID =103
--and ru.USERNAME in ('459210098','')--103
--ORDER BY 4