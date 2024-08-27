select * from information_schema.columns where TABLE_SCHEMA ='db_wom' and column_name like '%agent%'

select group_id, count(1) from cc_group_agent group by group_id 

select * from cc_group_agent where group_id =8

select * from cc_group_leader where agent_id =144

select cc.login_status ,cc.* from cc_agent_profile cc where agent_name like 'Putri Dila Ivanka' 

select cc.login_status ,cc.* from cc_agent_profile cc where login_status=0

select  * from cc_app_log limit 10

select * from cc_hit_log_api order by create_time desc limit 10

select * from cc_log_sync_data order by exe_time desc limit 10

select * from cc_recording_log limit 10

select   * from cc_ts_penawaran_log limit 10

select  * from cc_ts_penawaran_log_api  order by create_time desc limit 10

select ctp.task_id,ctp.is_pre_approval, ctp.priority , ctp.is_eligible_crm, ctp.assign_by 
, ctp.assign_to  ,cap.agent_id , cap.agent_name , cap.login_status, cap.agent_level  
, ctp.nik_ktp ,ctp.customer_name  , ctp.spouse_nik , ctp.spouse_name , ctp.guarantor_nik , ctp.guarantor_name
, ctp.AGRMNT_ID , ctp.agrmnt_no , ctp.is_process 
, ctp.distributed_date   
from cc_ts_penawaran ctp 
left join cc_agent_profile cap on cap.id=ctp.assign_to 
where ctp.priority =0
-- and cap.agent_id =092216259
and ctp.task_id ='POL000795397'

task_id in ('POL000795132','POL000795022')
 
select * from cc_ts_penawaran ctp where

select * from cc_ts_penawaran 
where task_id  is null
and is_pre_approval =1



#and opsi_penanganan ='DiA Rumah' 

 select priority, assign_to from cc_ts_penawaran ctp where task_id='POL000795551 '  
 
 #'POL000795551' 

 select * from cc_agent_profile cap  where id='416'
 
 update cc_ts_penawaran 
 set priority=1
 where task_id ='POL000795551'
 
update  cc_ts_penawaran
set priority=0
,usr_upd ='POL000795551'
where assign_to =416 and  task_id !='POL000795551' and priority=1

select count(1) from cc_ts_penawaran ctp  where task_id ='POL000795267'

select  ctp.task_id, ctp.is_pre_approval  ,ctp.nik_ktp , ctp.assign_to  ,ctp.is_pre_approval,ctp.opsi_penanganan  ,ctp.priority , ctp.is_eligible_crm,ctp.assign_to  
-- ,ctp.* 
from cc_ts_penawaran ctp 
where ctp.source_data ='wise' 
and ctp.agrmnt_id=2332492

select a.priority, a.task_id  ,a.* from cc_ts_penawaran a where assign_to =416 and priority =0

select * from cc_agent_profile cap where agent_name like '%SULIVAN%'

select * from cc_agent_profile 
where id<>'144' and agent_level =2

select * from cc_agent_profile where agent_name ='NURJEN'

select * from cc_agent_profile cap where  id=144

select * from cc_ts_penawaran where assign_to =135

select assign_to  , count(0)
from cc_ts_penawaran  cap 
group by assign_to  

select region, branch , count(1) 
from cc_agent_profile 
where status =1
and login_status =0
group by region, branch order by region, branch 

select AGRMNT_ID , agrmnt_no , task_id  from cc_ts_penawaran ctp  where agrmnt_no ='1133120221113701XX'

select * from cc_agent_profile where agent_level <>1 and cc_agent_profile.agent_password ='e10adc3949ba59abbe56e057f20f883e'

select data_id , type_api , url_api ,  respon_desc , respon_time , post_api 
From cc_respons_log crl  
where respon_time >'2023-12-28 08:30:11'
-- and respon_time <='2023-12-18 13:25:41'
-- and post_api  like '%6472021605760002%'
order by crl.respon_time desc limit 10

 
select * from cc_ts_cae_log
where task_id='POL000795572'
order by create_time desc  limit 10

update   cc_ts_penawaran_job  
set SYNC_TIME ='2023-12-12 09:43:13'
where cast(SYNC_TIME as date) ='2023-12-13'


select * from cc_ts_penawaran ctp  where source_data like '%MOBILE%' and ctp.branch_name  ='MAKASAR'

select ctpj.campaign_id ,ctpj.DTM_CRT,SYNC_TIME  , ctpj.* From cc_ts_penawaran_job ctpj limit 1

select max(SYNC_TIME) from cc_ts_penawaran_job where OFFICE_NAME ='MAKASSAR'

select cast(ctpj.SYNC_TIME as date) SYNC_TIME, OFFICE_REGION_CODE ,  OFFICE_REGION_NAME , OFFICE_CODE , OFFICE_NAME , ctpj.IS_PRE_APPROVAL , count(1) TOTAL
from cc_ts_penawaran_job ctpj 
where cast(ctpj.SYNC_TIME as date) ='2023-12-29'
and is_pre_approval=1
group by cast(ctpj.SYNC_TIME as date) , OFFICE_REGION_CODE ,  OFFICE_REGION_NAME , OFFICE_CODE , OFFICE_NAME,ctpj.IS_PRE_APPROVAL
order by  cast(ctpj.SYNC_TIME as date) desc 
#2023-07-06

select count(1) from cc_ts_penawaran_job #139799

select cast(ctpj.SYNC_TIME as date) SYNC_TIME, OFFICE_REGION_NAME , OFFICE_NAME , ctpj.IS_PRE_APPROVAL
, SOURCE_DATA , AGRMNT_NO , TASK_ID 
, CUST_ID ,CUST_NO , CUST_NAME 
from cc_ts_penawaran_job ctpj 
where cast(ctpj.SYNC_TIME as date) ='2023-12-15'
and is_pre_approval=0
and OFFICE_CODE =1331  
and AGRMNT_NO  in ('1133120191002041' ,'1133120191102305' ,'1133120191203348' ,'1133120200905209' ,'1133120200905346')
order by  cast(ctpj.SYNC_TIME as date) desc  

select ctp.id ,ctp.AGRMNT_NO , ctp.TASK_ID  , ctpj.is_pre_approval is_pre_approval_job, ctp.is_pre_approval , ctp.customer_name 
, ctp.assign_to ,cap.agent_id, cap.agent_name , ctp.assign_by 
from cc_ts_penawaran_job ctpj 
join cc_ts_penawaran ctp on ctpj.AGRMNT_NO =ctp.agrmnt_no 
left join cc_agent_profile cap on cap.id = ctp.assign_to
where cast(ctpj.SYNC_TIME as date) ='2023-12-15'
-- and ctpj.is_pre_approval=0
and OFFICE_CODE =1331 
and ctpj.AGRMNT_NO  in ('1133120210708035' ,'1133120201206010' ,'1133120211008769','1133120211109168','1133120210106188','1133120210106191','1133120211109044','1133120201206025','1133120220209954',  '1133120221113701','1133120191102305','1133120210106143','1133120200905346')
order by  cast(ctpj.SYNC_TIME as date) desc 


select ctpj.SOURCE_DATA ,ctpj.AGRMNT_NO , ctpj.ID_NO , ctpj.CONTRACT_STAT 
, ctpj.is_pre_approval is_pre_approval_job, ctp.is_pre_approval
,ctp.task_id, ctp.customer_name  , ctp.assign_to ,cap.agent_id, cap.agent_name , ctpj.MARITAL_STAT 
, ctpj.office_name
,ctp.mobile_1 
, ctp.spouse_nik , ctp.spouse_name , ctp.spouse_mobile_phone_no 
, ctp.guarantor_nik , ctp.guarantor_name , ctp.guarantor_mobile_phone 
, FLOOR( DATEDIFF( cast(now() as date),cast(BIRTH_DT as date ))/365)  age 
, ctpj.IS_ACTIVE , ctpj.DISTRIBUTED_DT , ctpj.CAE_FINAL_RESULT , ctpj.DUKCAPIL ,ctpj.DUKCAPIL_API_DT 
, ctpj.SCHEME_ID , ctpj.SLIK_CBASID 
, ctpj.ADDR_RES , ctpj.SUB_ZIPCODE_RES ,ctpj.CITY_RES , ctpj.KECAMATAN_RES , ctpj.KELURAHAN_RES 
,ctpj.LOB_CODE  , ctpj.CUST_RATING ,ctpj.ASSET_TYPE , ctpj.ITEM_DESCRIPTION 
, ctpj.OFFICE_CODE , ctpj.OFFICE_NAME  ,ctpj.OFFICE_REGION_NAME 
, ctpj.CUST_RATING   
, (CASE WHEN ctpj.HOME_STAT =1 then "MILIK SENDIRI"
  	WHEN ctpj.HOME_STAT =2 then "SEWA"
  	WHEN ctpj.HOME_STAT =3 then "KOST"
  	WHEN ctpj.HOME_STAT =4 then "MILIK KELUARGA"
  	WHEN ctpj.HOME_STAT =5 then "MILIK PERUSAHAAN"
  	WHEN ctpj.HOME_STAT =6 then "KONTRAK"
  	WHEN ctpj.HOME_STAT =7 then "DINAS"
  	WHEN ctpj.HOME_STAT =8 then "SEWA"
  	ELSE "GAJELAS" END
  )HOME_STAT 
-- , json_value(ctpj.CAE_RESULT, '$.result[10].score_category')Cust_rating_CAE 
#data product
, ctpj.PRODUCT_CATEGORY , ctpj.ITEM_BRAND , ctpj.ITEM_DESCRIPTION , ctpj.ITEM_TYPE , ctpj.ITEM_YEAR , ctpj.ASSET_AGE
, ctpj.LOB_CODE,ctpj.prod_offering_code 
#data Simulasi Kredit
, ctpj.TENOR  , ctpj.DOWNPAYMENT , ctpj.OTR_PRICE , ctpj.MONTHLY_INSTALLMENT ANGSURAN
#(Excellent <=200 %. Good <=150%, Normal <=125)"
, (case when ctpj.CUST_RATING ='EXCELLENT' 
	then (ctpj.MONTHLY_INSTALLMENT*(200/100))
	when ctpj.CUST_RATING ='NORMAL'
	then (ctpj.MONTHLY_INSTALLMENT*(125/100))
	when ctpj.CUST_RATING ='GOOD'
	then (ctpj.MONTHLY_INSTALLMENT*(150/100))
  END)MAX_ANGSURAN
#data penghasilan
,ctpj.MONTHLY_INCOME , ctpj.EDUCATION 
, ctpj.CAE_RESULT , ctp.opsi_penanganan
-- , JSON_EXTRACT(ctpj.CAE_RESULT, '$.data.app_no') 
, ctp.assign_to, ctp.is_pre_approval, ctpj.BIRTH_DT 
, ctp.notes
from cc_ts_penawaran_job ctpj 
left join cc_ts_penawaran ctp on ctpj.AGRMNT_NO =ctp.agrmnt_no 
left join cc_agent_profile cap on cap.id = ctp.assign_to
where cast(ctpj.SYNC_TIME as date) ='2023-12-29' 
and ctpj.SOURCE_DATA ='WISE'
and ctpj.IS_PRE_APPROVAL =1
and ctpj.MARITAL_STAT='MAR'
and ctpj.ASSET_AGE <10
and ctpj.OFFICE_NAME ='BERAU'
and ctpj.LOB_CODE like 'MGJ%'
-- and ctpj.SUB_ZIPCODE_RES ='F7889'
-- and ctp.task_id is null
-- and ctpj.GUARANTOR_ID_NO = ''
and FLOOR( DATEDIFF( cast(now() as date),cast(BIRTH_DT as date ))/365) >35

and ctpj.AGRMNT_NO ='1531120221005027     '

 

update cc_agent_profile 
set login_status =0    
where agent_id in ('000213262','000000513')

select ctp.agrmnt_no ,ctp.task_id,ctp.is_duplicate , is_process  ,ctp.is_pre_approval,ctp.opsi_penanganan  ,ctp.priority , ctp.is_eligible_crm  ,ctp.assign_to 
, ctp.polo_stat , ctp.dtm_crt , ctp.usr_upd , is_pre_approval , assign_to , notes 
from cc_ts_penawaran ctp where task_id='POL000795642      '

select cast(ctpj.SYNC_TIME as date)dates,ctpj.SOURCE_DATA,ctpj.OFFICE_NAME,ctpj.MARITAL_STAT, IS_PRE_APPROVAL
, case when FLOOR( DATEDIFF( cast(now() as date),cast(BIRTH_DT as date ))/365) >35 then '>35' else '<35' end range_age
, count(1) total
from cc_ts_penawaran_job ctpj 
where cast(ctpj.SYNC_TIME as date) =cast(ctpj.SYNC_TIME as date)
and not exists (select 1 from cc_ts_penawaran cc where cc.agrmnt_no = ctpj.AGRMNT_NO  )
and ctpj.LOB_CODE like 'MGJ%'
group by dates,SOURCE_DATA ,ctpj.OFFICE_NAME ,ctpj.MARITAL_STAT,IS_PRE_APPROVAL ,range_age
order by dates,ctpj.OFFICE_NAME ,ctpj.MARITAL_STAT  desc


select task_id,assign_to, priority  from cc_ts_penawaran ctp  where ctp.assign_to =200

select priority, count(1)total  
from cc_ts_penawaran ctp  
where ctp.assign_to =200
group by priority 


update cc_ts_penawaran
set assign_to = 144
, priority =1
where task_id ='POL000795267'
and priority =0
 


select  AGRMNT_NO ,OFFICE_REGION_CODE ,  OFFICE_REGION_NAME , OFFICE_CODE , OFFICE_NAME
from cc_ts_penawaran_job ctpj  where cast(ctpj.SYNC_TIME as date) ='2023-12-14'
order by OFFICE_REGION_NAME


select count(1)
from cc_ts_penawaran_job ctpj 

select max(SYNC_TIME) from cc_ts_penawaran_job_copy ctpjc 
select max(SYNC_TIME) from cc_ts_penawaran_job_copy2 ctpjc2  
select max(SYNC_TIME) from cc_ts_penawaran_job_copy3 ctpjc3 

select ctpc.campaign_code , ctpc.campaign_name , ctpc.pipeline , ctpc.type_asset , ctpc.data_source ,ctpc.pipeline ,ctpc.regional , ctpc.branch, ctpc.branch_code  
,ctpc.start_date , ctpc.end_date , ctpc.end_time , ctpc.status  , ctpc.distribution_spv 
From cc_ts_penawaran_campaign ctpc 
where ctpc.campaign_code ='033'
order by ctpc.campaign_code    desc

select *
From cc_ts_penawaran_campaign ctpc  
where id >1
order by ctpc.campaign_code    desc limit 1

update cc_ts_penawaran_campaign   
set  status=0

cc_ts_penawaran_campaign.end_date 

select * from cc_master_pipeline cmp 





 