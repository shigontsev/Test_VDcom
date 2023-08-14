--1)

select P.PeriodID, P.Value from
(select p.PeriodID, p.[Value], 
	lag(p.[Value], 1, 0) over (order by p.PeriodID) as ValuePrev
from [Period] as p) as P
where P.Value != P.ValuePrev

--2) 

DELETE [Period] FROM
(select P.PeriodID, P.Value from
(select p.PeriodID, p.[Value], 
	lag(p.[Value], 1, 0) over (order by p.PeriodID) as ValuePrev
from [Period] as p) as P
where P.Value = P.ValuePrev) AS Selected
WHERE [Period].PeriodID = Selected.PeriodID

select * from [Period]

