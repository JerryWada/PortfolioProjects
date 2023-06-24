select *
from PortfolioProjects..CovidDeaths
order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProjects..CovidDeaths
order by 1,2

-- looking at Total Cases VS Total Deaths 

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProjects..CovidDeaths
where location like '%Nigeria%'
order by 1,2

-- Looking at Total Cases VS Total Population
-- Shows what percentage of population got covid

select location, date, total_cases, population, (total_cases/population)*100 as InfectedPercentage
from PortfolioProjects..CovidDeaths
where location like '%Nigeria%'
order by 1,2

-- Looking at countries with highest infection rate

select location, MAX(total_cases) as HighestInfectionCount, population, MAX((total_cases/population))*100 as InfectedPercentage
from PortfolioProjects..CovidDeaths
--where location like '%Nigeria%'
group by population, location
order by InfectedPercentage desc


-- Looking at how many people died from covid

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProjects..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
group by location
order by TotalDeathCount desc


-- Looking at how many people died from covid by continents


select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProjects..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS


select date, SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(New_Cases) * 100 as DeathPercentage
from PortfolioProjects..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
group by date
order by 1,2





-- HEADING INTO JOINS 

-- LOOKING AT TOTAL POPULATION VS VACCINATION

select dea.date, dea.continent, dea.population, dea.location, vac.new_vaccinations
from PortfolioProjects..CovidDeaths dea
join PortfolioProjects..CovidVaccinations vac
     on dea.location = vac.location
	 and dea.date = vac.date 






