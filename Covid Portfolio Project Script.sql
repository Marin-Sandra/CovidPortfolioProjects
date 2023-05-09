select location,date,total_cases,new_cases,total_deaths,population
from .CovidDeaths 
where continent is not NULL order by 1,2

select location,date,total_cases,total_deaths,( total_deaths/total_cases)*100 as DeathPercentage
from .CovidDeaths 
where location = 'India' and  continent is not NULL
order by 1,2

select location,date,total_cases,population,( total_cases/population)*100 as PercentagePopulationInfected
from .CovidDeaths where continent is not NULL
--where location = 'India' 
order by 1,2


select location,MAX(total_cases) as HigestInfectionCount,population,MAX(( total_cases/population))*100 as PercentagePopulationInfected
from .CovidDeaths where continent is not NULL group by location,population
order by PercentagePopulationInfected desc


select location,MAX(total_deaths) as TotalDeathCount
from .CovidDeaths 
where continent is not NULL
group by location
order by TotalDeathCount desc

select location,MAX(total_deaths) as TotalDeathCount
from .CovidDeaths 
where continent is NULL
group by location
order by TotalDeathCount desc

select continent,MAX(total_deaths) as TotalDeathCount
from .CovidDeaths 
where continent is not NULL
group by continent
order by TotalDeathCount desc

select date,SUM(new_cases) as total_cases,SUM(new_deaths) as total_deaths,case when (SUM(new_cases) = 0) then 0 else SUM(new_deaths)/SUM(new_cases)*100 end as DeathPercentage
from .CovidDeaths 
--where location = 'India' 
where  continent is not NULL
group by date
order by 1,2

select SUM(new_cases) as total_cases,SUM(new_deaths) as total_deaths ,SUM(new_deaths)/SUM(new_cases)*100  as DeathPercentage
from .CovidDeaths 
--where location = 'India' 
where  continent is not NULL
--group by date
order by 1,2

	
with PopVsVac (continent,location,date,population,new_vaccinations,RollingPeopleVaccinated)
as (
select CD.continent,CD.location,CD.date,CD.population,CV.new_vaccinations,
SUM(CONVERT(bigint,new_vaccinations)) OVER ( partition by CD.location order by cast(CD.location as VARCHAR(50)),CD.date ) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/CD.population)*100
from .CovidDeaths CD
join .CovidVaccinations CV on CD.location=CV.location and CD.date=CV.date
where CD.continent is not NULL --and CD.location='India'

)
 select * ,(RollingPeopleVaccinated/population)*100
 from PopVsVac
 where location='India'

 create view PercentPopulationVaccinated as
 select CD.continent,CD.location,CD.date,CD.population,CV.new_vaccinations,
SUM(CONVERT(bigint,new_vaccinations)) OVER ( partition by CD.location order by cast(CD.location as VARCHAR(50)),CD.date ) as RollingPeopleVaccinated
--,(RollingPeopleVaccinated/CD.population)*100
from .CovidDeaths CD
join .CovidVaccinations CV on CD.location=CV.location and CD.date=CV.date
where CD.continent is not NULL
--order by 2,3

select * from PercentPopulationVaccinated



