% Deze functie normaliseert de vector afhankelijk van de lengte van de eerste kolom van de gegeven vector.

function normalized = mKnormalize(vector)

% Bereken de lengte.
lengte = mKvectorDistance(vector);
normalized = (1/lengte)*vector;

end