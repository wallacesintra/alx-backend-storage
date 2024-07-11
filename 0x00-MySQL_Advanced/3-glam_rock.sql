-- script Lists all bands with Glam rock as their main style, ranked by their longevity.
-- Column names must be: band_name & lifespan.

SELECT band_name, IFNULL(split, 2022) - formed as lifespan FROM metal_bands
WHERE FIND_IN_SET('Glam rock', style)
ORDER BY lifespan DESC;
