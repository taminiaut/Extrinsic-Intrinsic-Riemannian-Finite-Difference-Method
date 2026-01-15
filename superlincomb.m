% Function for the linear combination in the ambient space (for the extrinsic method)
function res = superlincomb(x, a1, d1, a2, d2, M)

% We assume that the ambient space is either a matrix space or a product of matrix spaces
if isstruct(d1)
    elems = fieldnames(d1);
    for k = 1:numel(elems)
        res.(elems{k}) = matrixlincomb(x,a1,d1.(elems{k}),a2,d2.(elems{k}));
    end
else
    res = matrixlincomb(x,a1,d1,a2,d2);
end

end
