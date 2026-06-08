% This file contain the implementation of the linear combination between
% two vectors lying in the ambient space, used by the Extrinsic method.
% Note that the inputs d1 and d2 must be represented as vectors in the 
% ambient space corresponding to a matrix space or a product of matrix spaces.
% It is not always the case in manopt (see, e.g., the fixed-rank manifold),
% hence few transformations of the input may be needed in the function below.

function res = ambientlincomb(x, a1, d1, a2, d2, M)

if isstruct(d1)
    elems = fieldnames(d1);
    for k = 1:numel(elems)
        res.(elems{k}) = matrixlincomb(x,a1,d1.(elems{k}),a2,d2.(elems{k}));
    end
else
    res = matrixlincomb(x,a1,d1,a2,d2);
end

end


% If you are working with the fixed-rank manifold R^{m x n}_k,
% then you should add the following:

% fullMat1 = M.triplet2matrix(d1); % From SVD to full matrix
% fullMat2 = M.triplet2matrix(d2); % From SVD to full matrix
% matRes = matrixlincomb(x,a1,fullMat1,a2,fullMat2);
    
% res = M.matrix2triplet(matRes); % From full matrix to SVD
% The last line is not needed if f(.) can take as input the full matrix.
