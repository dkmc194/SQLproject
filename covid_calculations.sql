--The purpose of this project is to use various SQL skills to get desired outcomes from the two Covid datasets
--The datasets come from https://ourworldindata.org/covid-deaths
--I divided the initial dataset into two: covid_deaths & covid_vaccinations
--Through this project, I sought to display my skills as a data analyst to extract outcomes from the dataset



--select data we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
ORDER BY 1,2


--Total Cases vs Total Deaths
--The likelihood of deaths upon contraction of Covid 19

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as deaths_per
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
WHERE location = "Canada"
ORDER BY 1, 2


--Total Cases vs Population
--Percentage of the population infected

SELECT location, date, total_cases, population, ROUND((total_cases/population) * 100, 2) as cases_per
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
WHERE location = "South Korea"
ORDER BY 1, 2


--Countries with Highest Infection Rate

SELECT location, MAX(total_cases) as max_cases, population, ROUND(MAX((total_cases/population)) * 100, 2) as cases_per
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
GROUP BY location, population
ORDER BY cases_per DESC  


--Countries with highest death count

SELECT location, MAX(total_deaths) as max_deaths
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
WHERE continent is not null 
GROUP BY location
ORDER BY max_deaths DESC


--Same Metric by Continent

SELECT continent, MAX(total_deaths) as max_deaths
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths` 
WHERE continent is not null 
GROUP BY continent
ORDER BY max_deaths DESC


--Worldwide Metric

SELECT date, SUM(new_cases) as global_new_cases, SUM(new_deaths) as global_new_deaths,
ROUND((SUM(new_deaths)/SUM(new_cases)*100),2) as global_death_rate
FROM `portfolioproject-338623.CovidDeaths.Covid_Deaths`
WHERE continent is not null 
GROUP BY date
ORDER BY 1, 2


--Population vs Vaccination Status by Country

SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vax.new_vaccinations,
SUM(vax.new_vaccinations) OVER(partition by deaths.location order by deaths.location, deaths.date) as vax_num_accumulated
FROM  `portfolioproject-338623.CovidDeaths.Covid_Deaths` deaths
JOIN `portfolioproject-338623.CovidVaccinations.Covid_Vaccinations` vax
ON deaths.location = vax.location and deaths.date = vax.date
WHERE deaths.continent is not null 
ORDER BY 2,3


--Calculating the percentage of people vaccinated using a Common Table Expression

WITH popvax 
AS
(
    SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vax.new_vaccinations,
    SUM(vax.new_vaccinations) OVER(partition by deaths.location order by deaths.location, deaths.date) as vax_num_accumulated
    FROM  `portfolioproject-338623.CovidDeaths.Covid_Deaths` deaths
    JOIN `portfolioproject-338623.CovidVaccinations.Covid_Vaccinations` vax
    ON deaths.location = vax.location and deaths.date = vax.date
    WHERE deaths.continent is not null 
)
SELECT *, ROUND((vax_num_accumulated/population)*100, 2) as vax_percentage
FROM popvax
WHERE vax_num_accumulated is not null

