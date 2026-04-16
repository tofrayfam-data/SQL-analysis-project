select*
from layoffs1_staging2;

select (total_laid_off)
from layoffs1_staging2;

select min(total_laid_off)
from layoffs1_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs1_staging2;

select*
from layoffs1_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select*
from layoffs1_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select*
from layoffs1_staging2
where percentage_laid_off = 1
order by 9 desc;

select company, sum(total_laid_off)
from layoffs1_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs1_staging2;

select industry, sum(total_laid_off)
from layoffs1_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs1_staging2
group by country
order by 2 desc;

select `date`, sum(total_laid_off)
from layoffs1_staging2
group by `date`
order by 1 desc;

/*working by date series*/
select year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by year(`date`)
order by 1 desc;


select substring(`date`, 6,2) as `month`
from layoffs1_staging2;

select substring(`date`, 6,2) as `month`, sum(total_laid_off)
from layoffs1_staging2
group by `month`;

select substring(`date`, 1,7) as `month`, sum(total_laid_off)
from layoffs1_staging2
group by `month`
order by 1 asc;

/*select substring(`date`, 1,7) as `month`, sum(total_laid_off)
from layoffs1_staging2
where `month` is not null
group by `month`
order by 1 asc;----unknown column `month`*/


select substring(`date`, 1,7) as `month`, sum(total_laid_off)
from layoffs1_staging2
where substring(`date`, 1,7) is not null
group by `month`
order by 1 asc;

select substring(`date`, 1,7) as `month`, sum(total_laid_off)
from layoffs1_staging2
where substring(`date`, 1,7) is not null
group by substring(`date`, 1,7)
order by 1 asc;

/*create a cte for rolling total*/ 
with Rolling_figure as
(
select substring(`date`, 1,7) as `month`, sum(total_laid_off) as final_off
from layoffs1_staging2
where substring(`date`, 1,7) is not null
group by substring(`date`, 1,7)
order by 1 asc
)
select `month`, final_off,
sum(final_off) over(order by `month`) as rolling_total 
from Rolling_figure;

/*check company -- rank*/

select company, sum(total_laid_off)
from layoffs1_staging2
group by company
order by 2 desc;

select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
order by company asc;

select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
order by 2 desc;

select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
order by 3 desc;


with company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
)
select*,
dense_rank () over(partition by `years` order by total_laid_off desc)
from company_year
where years is not null;


with company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
)
select*,
dense_rank () over(partition by `years` order by total_laid_off desc) as Ranking
from company_year
where years is not null
order by Ranking;


with company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs1_staging2
group by company, year(`date`)
),
company_year_rank as
(
select*,
dense_rank () over(partition by `years` order by total_laid_off desc) as Ranking
from company_year
where years is not null
)
select*
from company_year_rank
where ranking <= 5;