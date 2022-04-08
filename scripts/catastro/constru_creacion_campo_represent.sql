--CREACIÓN DE CAMPO Y ASIGANCIÓN DE VALOR POR DEFECTO--
ALTER TABLE public.constru ADD COLUMN represent smallint DEFAULT 1;
--GARAJES Y SOTANOS--
UPDATE public.constru SET represent = 5 Where constru NOT LIKE '%+%' AND constru LIKE '%-%';
--SUELOS DESNUDOS O PARCELAS--
UPDATE public.constru SET represent = 2 where constru LIKE '%SUELO%' or constru LIKE '%TERRENY%' or constru LIKE '%P%';
-- MAS EDIFICACIONES--
UPDATE public.constru SET represent = 1 where constru LIKE '%SOP%' or constru LIKE '%PJE%' or constru LIKE '%EPT%' or constru LIKE '%PRG%' or constru LIKE '%DEP%';
--LAMINA DE AGUA--
UPDATE public.constru SET represent = 4 where constru LIKE '%PI%' or constru LIKE '%PRESA%' or constru LIKE '%ZBE%' or constru LIKE '%DARSENA%' or constru LIKE '%ETQ%';
-- JARDINES Y PARQUES--
UPDATE public.constru SET represent = 3 where constru LIKE '%JD%' or constru LIKE '%YJD%' or constru LIKE '%GOLF%' or constru LIKE '%TEN%' or constru LIKE '%FUT%' or constru LIKE '%ZD%';