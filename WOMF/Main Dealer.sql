 
/**
 * Maindealer
 * Sit doc : https://docs.google.com/document/d/1KVSno_qhQZBxJIpso_zhHuuJakovIHV5eDDsoBdKuSw/edit?pli=1
 * fsd : https://docs.google.com/document/d/1juPXxPujmdnOhVjFjI8qitJais1YFgGcW9Y8mnHJfOk/edit#
 * Date: Nov 28, 2023
 * 
 * agar maindealer mengirimkan data ke POLO, harus menggunakan data dengan subzipcode terdaftar sebagai piloting
 * untuk send ke polo akan jalan by job setiap 10 menit
 */




select top 10 * from T_MKT_MARKETPLACE_APILOGRESPONSE tmma  order by RESPONSE_DT desc

select top 10 * from T_MKT_MARKETPLACE_APILOGREQUEST tmma2   order by REQUEST_DT desc

select DISTINCT id_name , max(RESPONSE_DT) from T_MKT_MARKETPLACE_APILOGRESPONSE where cast(RESPONSE_DT as date) = cast(getdate() as date)

select  id_name , max(RESPONSE_DT) last_process from T_MKT_MARKETPLACE_APILOGRESPONSE group by id_name   order by  max(RESPONSE_DT) desc

select top 10 ID_NAME , ORDER_ID , TRANSACTION_ID RESPONSE_CODE , RESPONSE_MESSAGE, RESPONSE_DT  from T_MKT_MARKETPLACE_APILOGRESPONSE where TRANSACTION_ID ='MD0007984' order by RESPONSE_dt desc

SELECT SEND_FLAG_POLO,IS_PILOTING ,PARTNER_ID , ORDER_ID , TRANSACTION_ID , ID_NO , FULL_NAME , SURVEY_SUB_ZIP_CODE , LEGAL_SUB_ZIP_CODE   from T_MKT_MARKETPLACE_ACQ tmma where ORDER_ID ='SP1015-221228297'

select top 10 tmpoi.T_MKT_POLO_ORDER_IN_ID, tmpoi.DUKCAPIL_STAT  ,tmpoix.T_MKT_POLO_ORDER_IN_X_ID ,tmpoix.HOME_STAT , tmpoix.PENGAJUAN_NO  , SOURCE_DATA , ID_NO , CUST_NAME, TASK_ID , SUB_ZIPCODE_LEG , SUB_ZIPCODE_RES , ORDER_ID_DEALER  ,tmpoi.DTM_CRT , tmpoi.USR_CRT 
From T_MKT_POLO_ORDER_IN tmpoi 
join T_MKT_POLO_ORDER_IN_X tmpoix on tmpoi.T_MKT_POLO_ORDER_IN_ID = tmpoix.T_MKT_POLO_ORDER_IN_ID 
where ORDER_ID ='MD0007984'  

select top 100 * from creditscore_backend.dbo.api_call_log acl order by acl.created_datetime  desc
select top 20 * from creditscore_backend.dbo.api_call_log acl where id=81442 order by acl.created_datetime  desc




POL000795052
 
-- Cabang piloting
 SELECT PARTNER_ID , PART.NAME_MARKETPLACE  ,FIELD_MAPPING , DESCR_WOM , DESCR_PARTNER , MMMMC.IS_ACTIVE , ZIP.CITY, ZIP.SUB_ZIPCODE , PART.FLAG_MASTER 
FROM M_MKT_MARKETPLACE_MAPPING_CODE MMMMC
JOIN M_MKT_MARKETPLACE_PARTNER PART ON MMMMC.PARTNER_ID =PART.ID_MARKETPLACE
JOIN WISE_STAGING..V_REF_ZIPCODE ZIP ON ZIP.SUB_ZIPCODE = MMMMC.DESCR_WOM
WHERE FIELD_MAPPING ='CODE_TO_SUBZIPCODE' 
AND DESCR_WOM  LIKE '%E6799%'
AND PARTNER_ID ='03663'
AND PART.FLAG_MASTER =2



SELECT TRANSACTION_ID orderId, ORDER_ID orderIdDealer,SLIK_SETTING ,SLIK_CONFIRM,SEND_TIME_JOB_SLIK ,SLIK_CHECK_RESULT 
FROM T_MKT_MARKETPLACE_ACQ WITH (NOLOCK) WHERE SEND_FLAG_POLO='0' 
AND isnull(IS_PILOTING,'0')=1 
ORDER BY TRANSACTION_ID ASC

select  distinct job_name 
from confins..log_job_proc_wom 
where date_processed >='2023-11-10 01:41:32.780'

select top 10 * from CONFINS..log_job_proc_wom where job_name = 'JOB_SEND_DATA_CAE_PENGAJUAN_TO_POLO' order by date_processed desc
select top 10 * from CONFINS..log_job_proc_wom order by date_processed desc

 

select job_name, max(date_processed) CURRENT_PROCESS
from CONFINS..log_job_proc_wom  
--where job_name = 'JOB_SEND_DATA_CAE_PENGAJUAN_TO_POLO' 
group by job_name
order by max(date_processed)  desc


spMKT_MAINDEALER_JOB_DATA_PENGAJUAN_TO_POLO

sp_who2

