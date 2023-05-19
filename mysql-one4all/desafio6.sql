SELECT MIN(plan.value_plan)  AS faturamento_minimo,
MAX(plan.value_plan) AS faturamento_maximo,
ROUND(AVG(plan.value_plan),2) AS faturamento_medio,
SUM(plan.value_plan) AS faturamento_total
FROM SpotifyClone.spotify_plan AS plan
INNER JOIN SpotifyClone.spotify_user AS user
ON plan.plan_id = user.plan_id
;