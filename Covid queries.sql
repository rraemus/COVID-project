
-- Queries to be used in tableau project

-- 1) Total covid numbers
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From [Portfolio project]..covid_deaths
where continent is not null 
order by 1,2


-- 2) Death count grouped by location/income level
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From [Portfolio project]..covid_deaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International', 'Upper middle income', 'High income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc


-- 3) Infection rates per location
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio project]..covid_deaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4) Percentage of covid infections over time
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio project]..covid_deaths
--Where location like '%states%'
Group by Location, Population, date
order by location asc
