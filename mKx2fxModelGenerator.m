function model = mKx2fxModelGenerator(nVariables,orders)
    ordersMatrix = repmat(orders,nVariables,1);
    % Convert to cell such that it can be used in the mKcartesian function.
    % Below is an adaptation of the mKcartesian function.
    ordersCell = mat2cell(ordersMatrix,ones(size(ordersMatrix,1),1)).';
    
    [F{1:nVariables}] = ndgrid(ordersCell{:});
    
    for i=nVariables:-1:1
        G(:,i) = F{i}(:);
    end
    
    model = unique(G , 'rows');
end