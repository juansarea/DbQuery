-- New script in WISE_STAGING(142).
-- Date: Jan 2, 2024
-- Time: 2:06:35 PM
SELECT
	ur.id AS role_id,
	ur.role,
	gmst.id,
	gmst.group_master,
	gmbr.userid,
	c.fullname
FROM
	user_role ur
LEFT JOIN user_role_detail urd ON
	urd.id_user_role = ur.id
LEFT JOIN group_master gmst ON
	gmst.id = urd.id_group_master
LEFT JOIN group_member gmbr ON
	gmbr.id_group_master = gmst.id
LEFT JOIN customer c ON
	c.NIK = gmbr.userid
WHERE
	ur.is_active = '1'
	AND ur.role LIKE '%FL%'
	AND gmbr.user_id IN (,'000213350' ,'000214004' ,'000214285' ,'000216416' ,'000220440' ,'000222275' ,'000222917' ,'000223860' ,'000224118' ,'000224233' ,'000224837' ,'000225641' ,'000225765' ,'000230067' ,'000230068' ,'000230623' ,'00904060' ,'02504040' ,'041100042' ,'041100557' ,'044170975' ,'05707054' ,'065120688' ,'08310763' ,'285191088' ,'285192597' ,'285210103' ,'285212203' ,'285215488' ,'285215794' ,'285222328' ,'285222486' ,'285222586' ,'285222587' ,'285222930' ,'285223872' ,'285223928' ,'285225607' ,'285225681' ,'285225795' ,'285230790' ,'285230795' ,'285230869' ,'451223457')
ORDER BY
	c.fullname ASC
LIMIT 20