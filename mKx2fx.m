function D = mKx2fx(X,model)
    D = zeros(size(X,1),size(model,1));
    for i = 1:size(X,1)
        for j = 1:size(model,1)
            D(i,j) = prod(X(i,:).^model(j,:));
        end
    end
end