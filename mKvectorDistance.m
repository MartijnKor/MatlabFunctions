% Deze functie berekent de lengte van een vector. Er wordt alleen gekeken naar de eerste kolom.

function distance = mKvectorDistance(vector)
som = 0;
for i=1:length(vector)
    som = som + vector(i,1)^2;
end

distance = sqrt(som)
end