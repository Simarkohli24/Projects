function deck = CreateDeck(n, x)
    for k = 1:n
        deck(k) = ceil(x*rand);
    end
end