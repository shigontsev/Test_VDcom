--1:

SELECT aa.CounterpartyID, aa.Name, ttt.Cnt FROM Account AS aa
JOIN
(SELECT tt.CounterpartyID, COUNT(*) AS Cnt FROM
(SELECT a.CounterpartyID, t.AssetID FROM Account AS a, [Transaction] AS t
Where a.IsActive = 1 and (a.CounterpartyID = t.RcvID or a.CounterpartyID = t.SndID)
Group By a.CounterpartyID, t.AssetID) AS tt
Group By tt.CounterpartyID
having COUNT(*) > 1) AS ttt ON ttt.CounterpartyID = aa.CounterpartyID


--2)
--Не понял постановку вопроса либо так, с учетом только полученных активов
SELECT a.CounterpartyID, a.Name, t.AssetID, SUM(t.Quantity) AS Quantity FROM Account AS a
JOIN [Transaction] AS t on a.CounterpartyID = t.RcvID
WHERE A.IsActive = 1
Group By a.CounterpartyID, a.Name, t.AssetID

--Либо еще вычитаю и то что отправленные активы

SELECT aa.CounterpartyID, aa.Name, aa.AssetID, SUM(aa.Quantity) AS Quantity FROM
((SELECT a.CounterpartyID, a.Name, t.AssetID, SUM(t.Quantity) AS Quantity FROM Account AS a
JOIN [Transaction] AS t on a.CounterpartyID = t.RcvID
WHERE A.IsActive = 1
Group By a.CounterpartyID, a.Name, t.AssetID)
Union
(SELECT a.CounterpartyID, a.Name, t.AssetID, -SUM(t.Quantity) AS Quantity FROM Account AS a
JOIN [Transaction] AS t on a.CounterpartyID = t.SndID
WHERE A.IsActive = 1
Group By a.CounterpartyID, a.Name, t.AssetID)) as aa
Group By aa.CounterpartyID, aa.Name, aa.AssetID



--3)
--Как и в предыдущем, полученные активы без учета отправителя
SELECT a.CounterpartyID, a.Name, TTT.Oborot FROM Account AS a
Left JOIN
(
SELECT TT.CounterpartyID, SUM(TT.Quantity)/ COUNT(*) AS Oborot FROM
(SELECT tt.TransDate, tt.CounterpartyID, SUM(tt.Quantity)AS Quantity FROM
((SELECT t.RcvID AS CounterpartyID, t.TransDate, SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.RcvID, t.TransDate)) as tt
Group By tt.TransDate, tt.CounterpartyID) as TT
Group By TT.CounterpartyID
) AS TTT ON a.CounterpartyID = TTT.CounterpartyID

--С учетом вычитания от отправителя, 

SELECT a.CounterpartyID, a.Name, TTT.Oborot FROM Account AS a
Left JOIN
(
SELECT TT.CounterpartyID, SUM(TT.Quantity)/ COUNT(*) AS Oborot FROM
(SELECT tt.TransDate, tt.CounterpartyID, SUM(tt.Quantity)AS Quantity FROM
((SELECT t.RcvID AS CounterpartyID, t.TransDate, SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.RcvID, t.TransDate)
Union
(SELECT t.SndID AS CounterpartyID, t.TransDate, -SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.SndID, t.TransDate)) as tt
Group By tt.TransDate, tt.CounterpartyID) as TT
Group By TT.CounterpartyID
) AS TTT ON a.CounterpartyID = TTT.CounterpartyID


--4)
--Как и в предыдущем, полученные активы без учета отправителя

SELECT a.CounterpartyID, a.Name, TTT.Oborot FROM Account AS a
Left JOIN
(
SELECT TT.CounterpartyID, SUM(TT.Quantity)/ COUNT(*) AS Oborot FROM
(SELECT tt.TransDate, tt.CounterpartyID, SUM(tt.Quantity)AS Quantity FROM
((SELECT t.RcvID AS CounterpartyID, CONCAT(YEAR(t.TransDate),'-',MONTH(t.TransDate)) AS TransDate, SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.RcvID, t.TransDate)
) as tt
Group By TransDate, tt.CounterpartyID) as TT
Group By TT.CounterpartyID
) AS TTT ON a.CounterpartyID = TTT.CounterpartyID

--С учетом вычитания от отправителя, 

SELECT a.CounterpartyID, a.Name, TTT.Oborot FROM Account AS a
Left JOIN
(
SELECT TT.CounterpartyID, SUM(TT.Quantity)/ COUNT(*) AS Oborot FROM
(SELECT tt.TransDate, tt.CounterpartyID, SUM(tt.Quantity)AS Quantity FROM
((SELECT t.RcvID AS CounterpartyID, CONCAT(YEAR(t.TransDate),'-',MONTH(t.TransDate)) AS TransDate, SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.RcvID, t.TransDate)
Union
(SELECT t.SndID AS CounterpartyID, CONCAT(YEAR(t.TransDate),'-',MONTH(t.TransDate)) AS TransDate, -SUM(t.Quantity) AS Quantity FROM [Transaction] AS t
Group By t.SndID, t.TransDate)) as tt
Group By TransDate, tt.CounterpartyID) as TT
Group By TT.CounterpartyID
) AS TTT ON a.CounterpartyID = TTT.CounterpartyID
