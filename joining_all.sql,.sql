SELECT buffered.geometry,buffered.Alias,QueryLayer.LCTYPE,QueryLayer.LCRATIO
FROM (buffered
INNER JOIN QueryLayer ON buffered.Alias=QueryLayer.Alias)