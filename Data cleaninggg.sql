-- Data cleaning

select*
from layoff;

-- 1. Remove duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove any columns or rows

create table layoff_practice
like layoff;

select*
from layoff_practice;

insert layoff_practice
select*
from layoff;

select*
from layoff_practice;

select*,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_practice;

with duplicate_cte as
(
select*,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_practice
)
select*
from duplicate_cte
where row_num > 1;

select*
from layoff_practice
where company = 'cazoo';


CREATE TABLE `layoff_practice2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from layoff_practice2;

insert into layoff_practice2
select*,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_practice;


select*
from layoff_practice2
where row_num > 1;


delete
from layoff_practice2
where row_num > 1;

select*
from layoff_practice2;

-- standardizind data

select company, trim(company)
from layoff_practice2;

update layoff_practice2
set company = trim(company);

select*
from layoff_practice2;

select distinct industry
from layoff_practice2
order by 1;


select*
from layoff_practice2
where industry like 'crypto%';

update layoff_practice2
set industry = 'crypto'
where industry like 'crypto%';

select distinct industry
from layoff_practice2;


select distinct country, trim(trailing '.' from country)
from layoff_practice2
where country like 'united states%';

update layoff_practice2
set country = trim(trailing '.' from country)
where country like 'united states%';

select distinct country
from layoff_practice2
order by 1;

-- Other way round

update layoff_practice2
set country = 'united states'
where country like 'united states%';

select distinct country
from layoff_practice2
order by 1;

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoff_practice2;

update layoff_practice2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoff_practice2;

alter table layoff_practice2
modify column `date` date;

select*
from layoff_practice2
where total_laid_off is null;

select*
from layoff_practice2
where industry is null
or industry = '';

update layoff_practice2
set industry = null
where industry = '';


select*
from layoff_practice2
where company = 'carvana';


select*
from layoff_practice2
where company = 'airbnb';

select*
from layoff_practice2 t1
join layoff_practice2 t2
	on t1.company = t2.company
	and   t2.location = t2.location
    where (t1.industry is null or t1.industry = '')
    and t2.industry is not null;
    
    
select t1.industry, t2.industry
from layoff_practice2 t1
join layoff_practice2 t2
	on t1.company = t2.company
	and   t2.location = t2.location
    where (t1.industry is null or t1.industry = '')
    and t2.industry is not null;
    
    update layoff_practice2 t1
    join layoff_practice2 t2
	on t1.company = t2.company
    set t1.industry = t2.industry
    where (t1.industry is null or t1.industry = '')
    and t2.industry is not null;
    
    select company, location, industry
    from layoff_practice2
    where industry = '';
    
    select company, location, industry
    from layoff_practice2
    where industry is null;
    
    
select*
from layoff_practice2
where total_laid_off is null
and percentage_laid_off is null;


alter table layoff_practice2
drop column row_num;


delete
from layoff_practice2
where total_laid_off is null
and percentage_laid_off is null;