CREATE VIEW vw_cidade_empresa AS
SELECT 
   emp.nome as "empresa", 
   cid.nome as "cidade" 
FROM cidade cid
RIGHT JOIN empresa emp 
   ON emp.codcid = cid.codcid
UNION
SELECT 
   emp.nome as "empresa", 
   cid.nome as "cidade" 
FROM cidade cid
LEFT JOIN empresa emp 
   ON emp.codcid = cid.codcid
   

   
   
