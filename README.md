# Chinook Music Store: Sales Analysis in SQL

## Overview

I analysed sales data for the Chinook digital music store to see how the business is doing, where most of its revenue comes from, and which types of music and artists contribute the most to that revenue.

**Tools:** SQLite, DB Browser for SQLite
**Data:** [Chinook sample database](https://github.com/lerocha/chinook-database): 412 invoices from 59 customers in 24 countries, 2009 to 2013, totalling $2,328.60.
**Skills shown:** JOINs across up to four tables, GROUP BY with aggregates, date functions, sorting and limiting results.

## Key findings

- **Rock dominates.** Rock earns $826.65, about 35% of all revenue and more than double the next genre, Latin.
- **Revenue is flat.** Every year sits between $449 and $481, so nothing is driving growth year on year.
- **The USA is the biggest market**, at $523.06 (about 22% of revenue).
- **Spending is spread evenly across customers.** Every customer spent between $36.64 and $49.62, so the store doesn't depend on a few big spenders.
- **Jane Peacock is the top sales rep**, though she also looks after the most customers.

## Questions and results

The full queries are in [`queries.sql`](queries.sql).

### 1. Which countries bring in the most revenue?

| Country | Revenue |
|---|---|
| USA | $523.06 |
| Canada | $303.96 |
| France | $195.10 |
| Brazil | $190.10 |
| Germany | $156.48 |

The USA is the country with the highest sales revenue, well ahead of Canada in second place.

### 2. Who are the top 5 customers by total spend?

| Customer | Total spend |
|---|---|
| Helena Holý | $49.62 |
| Richard Cunningham | $47.62 |
| Luis Rojas | $46.62 |
| Ladislav Kovács | $45.62 |
| Hugh O'Reilly | $45.62 |

The top customers spend only slightly more than everyone else. Every customer made 6 or 7 purchases and the average customer spent $39.47, so revenue isn't concentrated in a handful of big spenders.

### 3. Which genres sell best?

| Genre | Revenue |
|---|---|
| Rock | $826.65 |
| Latin | $382.14 |
| Metal | $261.36 |
| Alternative & Punk | $241.56 |
| TV Shows | $93.53 |

Rock dominates, with Latin a distant second about $440 behind, so the gap between the top genre and the rest is large.

### 4. How has revenue changed by year?

| Year | Revenue |
|---|---|
| 2009 | $449.46 |
| 2010 | $481.45 |
| 2011 | $469.58 |
| 2012 | $477.53 |
| 2013 | $450.58 |

Revenue is flat: every year sits between $450 and $480, meaning nothing is increasing revenue year on year. The store would need to change something to grow.

### 5. Which sales rep brings in the most revenue?

| Sales rep | Customers | Revenue |
|---|---|---|
| Jane Peacock | 21 | $833.04 |
| Margaret Park | 20 | $775.40 |
| Steve Johnson | 18 | $720.16 |

Jane generates the most revenue. That could be because she has more customers than the other two reps, but it could also mean she is better at sales and has won more customers because of it. This data alone can't tell those apart.

### 6. Which artists sold the most tracks?

| Artist | Tracks sold |
|---|---|
| Iron Maiden | 140 |
| U2 | 107 |
| Metallica | 91 |
| Led Zeppelin | 87 |
| Os Paralamas Do Sucesso | 45 |

Iron Maiden is the best-selling artist in the store. The store also sells TV shows, so they appear in the artist results too (see Caveats).

## Caveats

- **Opera is missing from the genre results.** The database has 25 genres, but Opera never sold a track, so the inner JOIN leaves it out. A LEFT JOIN from the Genre table would show it with zero sales.
- **"Lost" appears among the top 10 artists**, but it is a TV show, not a band. The store sells TV episodes as tracks (media type "Protected MPEG-4 video file"). I've left it in the results and noted it here.
- **Sales rep comparison:** the reps look after different numbers of customers, so total revenue isn't a perfectly fair comparison. Revenue per customer would be a fairer measure.

## Files

- `queries.sql`: all six queries, each labelled with the question it answers
- `README.md`: this write-up

## How to reproduce

1. Download `Chinook_Sqlite.sqlite` from the [Chinook releases page](https://github.com/lerocha/chinook-database/releases).
2. Open it in DB Browser for SQLite (or any SQLite tool).
3. Run the queries in `queries.sql`.
