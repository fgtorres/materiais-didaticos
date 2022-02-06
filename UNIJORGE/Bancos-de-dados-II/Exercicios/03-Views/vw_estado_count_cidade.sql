CREATE VIEW vw_estado_count_cidade AS
SELECT est.nome, count(*) from estado est
JOIN cidade cid ON est.codest = cid.codest
JOIN empresa emp ON emp.codcid = cid.codcid
GROUP BY est.nome;
   

   
   
