/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 90426
 Source Host           : localhost:5432
 Source Catalog        : lab5
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90426
 File Encoding         : 65001

 Date: 21/03/2021 17:45:06
*/


-- ----------------------------
-- Table structure for alocacao
-- ----------------------------
DROP TABLE IF EXISTS "public"."alocacao";
CREATE TABLE "public"."alocacao" (
  "codemp" int4 NOT NULL,
  "codproj" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "qtdhoras" int4 NOT NULL
)
;

-- ----------------------------
-- Records of alocacao
-- ----------------------------
INSERT INTO "public"."alocacao" VALUES (101, 'PD', 100);
INSERT INTO "public"."alocacao" VALUES (508, 'TK', 120);
INSERT INTO "public"."alocacao" VALUES (832, 'PD', 200);
INSERT INTO "public"."alocacao" VALUES (270, 'FS', 80);
INSERT INTO "public"."alocacao" VALUES (101, 'MX', 120);
INSERT INTO "public"."alocacao" VALUES (245, 'MX', 80);
INSERT INTO "public"."alocacao" VALUES (330, 'TK', 160);
INSERT INTO "public"."alocacao" VALUES (619, 'MX', 100);

-- ----------------------------
-- Table structure for cidade
-- ----------------------------
DROP TABLE IF EXISTS "public"."cidade";
CREATE TABLE "public"."cidade" (
  "codcid" int4 NOT NULL,
  "nome" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "codest" int4 NOT NULL
)
;

-- ----------------------------
-- Records of cidade
-- ----------------------------
INSERT INTO "public"."cidade" VALUES (1, 'Sorocaba', 1);
INSERT INTO "public"."cidade" VALUES (2, 'SÆo Caetano', 1);
INSERT INTO "public"."cidade" VALUES (3, 'Resende', 2);
INSERT INTO "public"."cidade" VALUES (4, 'Blumenau', 3);
INSERT INTO "public"."cidade" VALUES (5, 'Salvador', 4);
INSERT INTO "public"."cidade" VALUES (6, 'Lauro de Freitas', 4);
INSERT INTO "public"."cidade" VALUES (7, 'Cama‡ari', 4);
INSERT INTO "public"."cidade" VALUES (8, 'Feira de Santana', 4);
INSERT INTO "public"."cidade" VALUES (9, 'Florian¢polis', 3);
INSERT INTO "public"."cidade" VALUES (10, 'Rio de Janeiro', 2);

-- ----------------------------
-- Table structure for contratacao
-- ----------------------------
DROP TABLE IF EXISTS "public"."contratacao";
CREATE TABLE "public"."contratacao" (
  "codcont" int4 NOT NULL,
  "dtadm" date NOT NULL,
  "dtdem" date,
  "codemp" int4
)
;

-- ----------------------------
-- Records of contratacao
-- ----------------------------
INSERT INTO "public"."contratacao" VALUES (1, '2000-01-01', NULL, 101);
INSERT INTO "public"."contratacao" VALUES (2, '2001-11-01', NULL, 204);
INSERT INTO "public"."contratacao" VALUES (3, '2002-10-01', '2015-02-11', 330);
INSERT INTO "public"."contratacao" VALUES (4, '2002-08-05', NULL, 134);
INSERT INTO "public"."contratacao" VALUES (5, '2008-09-09', NULL, 245);
INSERT INTO "public"."contratacao" VALUES (6, '2009-07-01', '2012-02-20', 508);
INSERT INTO "public"."contratacao" VALUES (7, '2010-02-11', '2014-10-15', 832);
INSERT INTO "public"."contratacao" VALUES (8, '2013-01-11', NULL, 496);
INSERT INTO "public"."contratacao" VALUES (9, '2011-09-10', NULL, 270);
INSERT INTO "public"."contratacao" VALUES (10, '2005-04-25', NULL, 619);
INSERT INTO "public"."contratacao" VALUES (11, '2014-03-21', '2014-10-11', 620);

-- ----------------------------
-- Table structure for empregado
-- ----------------------------
DROP TABLE IF EXISTS "public"."empregado";
CREATE TABLE "public"."empregado" (
  "codemp" int4 NOT NULL,
  "nome" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "codprof" int4
)
;

-- ----------------------------
-- Records of empregado
-- ----------------------------
INSERT INTO "public"."empregado" VALUES (101, 'Daniel Rand', 3);
INSERT INTO "public"."empregado" VALUES (204, 'Emma Frost', 5);
INSERT INTO "public"."empregado" VALUES (330, 'Alan Scott', 2);
INSERT INTO "public"."empregado" VALUES (134, 'Matt Murdock', 1);
INSERT INTO "public"."empregado" VALUES (245, 'Jay Garrick', 2);
INSERT INTO "public"."empregado" VALUES (508, 'Helena Bertinelli', 1);
INSERT INTO "public"."empregado" VALUES (832, 'Dinah Lance', 3);
INSERT INTO "public"."empregado" VALUES (496, 'Connor Hawke', 3);
INSERT INTO "public"."empregado" VALUES (270, 'Bart Allen', 5);
INSERT INTO "public"."empregado" VALUES (619, 'Carter Hall', 4);
INSERT INTO "public"."empregado" VALUES (620, 'Abin Sur', NULL);

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS "public"."empresa";
CREATE TABLE "public"."empresa" (
  "codempresa" int4 NOT NULL,
  "nome" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "codcid" int4 NOT NULL
)
;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO "public"."empresa" VALUES (1, 'Votorantim', 1);
INSERT INTO "public"."empresa" VALUES (2, 'BASF', 2);
INSERT INTO "public"."empresa" VALUES (3, 'General Eletric', 3);
INSERT INTO "public"."empresa" VALUES (4, 'Tigre', 4);
INSERT INTO "public"."empresa" VALUES (5, 'OAS', 5);
INSERT INTO "public"."empresa" VALUES (6, 'Odebrecht', 5);
INSERT INTO "public"."empresa" VALUES (7, 'White Martins', 10);
INSERT INTO "public"."empresa" VALUES (8, 'CostÆo do Santinho', 9);
INSERT INTO "public"."empresa" VALUES (9, 'Alcoa', 1);
INSERT INTO "public"."empresa" VALUES (10, 'Braskem', 7);

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS "public"."estado";
CREATE TABLE "public"."estado" (
  "codest" int4 NOT NULL,
  "nome" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO "public"."estado" VALUES (1, 'SP');
INSERT INTO "public"."estado" VALUES (2, 'RJ');
INSERT INTO "public"."estado" VALUES (3, 'SC');
INSERT INTO "public"."estado" VALUES (4, 'BA');
INSERT INTO "public"."estado" VALUES (5, 'RS');

-- ----------------------------
-- Table structure for profissao
-- ----------------------------
DROP TABLE IF EXISTS "public"."profissao";
CREATE TABLE "public"."profissao" (
  "codprof" int4 NOT NULL,
  "nome" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of profissao
-- ----------------------------
INSERT INTO "public"."profissao" VALUES (1, 'Eletricista');
INSERT INTO "public"."profissao" VALUES (2, 'Pedreiro');
INSERT INTO "public"."profissao" VALUES (3, 'Pintor');
INSERT INTO "public"."profissao" VALUES (4, 'Encanador');
INSERT INTO "public"."profissao" VALUES (5, 'Engenheiro');

-- ----------------------------
-- Table structure for projeto
-- ----------------------------
DROP TABLE IF EXISTS "public"."projeto";
CREATE TABLE "public"."projeto" (
  "codproj" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "nome" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of projeto
-- ----------------------------
INSERT INTO "public"."projeto" VALUES ('TK', 'Triskellion');
INSERT INTO "public"."projeto" VALUES ('MX', 'Mansao Xavier');
INSERT INTO "public"."projeto" VALUES ('PD', 'Jornal Planeta Diario');
INSERT INTO "public"."projeto" VALUES ('FS', 'Fortaleza da Solidao');

-- ----------------------------
-- Table structure for salario
-- ----------------------------
DROP TABLE IF EXISTS "public"."salario";
CREATE TABLE "public"."salario" (
  "codsal" int4 NOT NULL,
  "salario_hora" float8 NOT NULL,
  "codprof" int4
)
;

-- ----------------------------
-- Records of salario
-- ----------------------------
INSERT INTO "public"."salario" VALUES (1, 13, 1);
INSERT INTO "public"."salario" VALUES (2, 15, 2);
INSERT INTO "public"."salario" VALUES (3, 12, 3);
INSERT INTO "public"."salario" VALUES (4, 10, 4);
INSERT INTO "public"."salario" VALUES (5, 30, 5);

-- ----------------------------
-- Primary Key structure for table alocacao
-- ----------------------------
ALTER TABLE "public"."alocacao" ADD CONSTRAINT "alocacao_pkey" PRIMARY KEY ("codemp", "codproj");

-- ----------------------------
-- Primary Key structure for table cidade
-- ----------------------------
ALTER TABLE "public"."cidade" ADD CONSTRAINT "cidade_pkey" PRIMARY KEY ("codcid");

-- ----------------------------
-- Primary Key structure for table contratacao
-- ----------------------------
ALTER TABLE "public"."contratacao" ADD CONSTRAINT "contratacao_pkey" PRIMARY KEY ("codcont");

-- ----------------------------
-- Primary Key structure for table empregado
-- ----------------------------
ALTER TABLE "public"."empregado" ADD CONSTRAINT "empregado_pkey" PRIMARY KEY ("codemp");

-- ----------------------------
-- Primary Key structure for table empresa
-- ----------------------------
ALTER TABLE "public"."empresa" ADD CONSTRAINT "empresa_pkey" PRIMARY KEY ("codempresa");

-- ----------------------------
-- Primary Key structure for table estado
-- ----------------------------
ALTER TABLE "public"."estado" ADD CONSTRAINT "estado_pkey" PRIMARY KEY ("codest");

-- ----------------------------
-- Primary Key structure for table profissao
-- ----------------------------
ALTER TABLE "public"."profissao" ADD CONSTRAINT "profissao_pkey" PRIMARY KEY ("codprof");

-- ----------------------------
-- Primary Key structure for table projeto
-- ----------------------------
ALTER TABLE "public"."projeto" ADD CONSTRAINT "projeto_pkey" PRIMARY KEY ("codproj");

-- ----------------------------
-- Primary Key structure for table salario
-- ----------------------------
ALTER TABLE "public"."salario" ADD CONSTRAINT "salario_pkey" PRIMARY KEY ("codsal");
