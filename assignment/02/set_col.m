function [X,Y,COL] = set_col(X, Y, XV, YV, COL, colour)
% SET_COL with a matrix of X and Y indices of polygons (where the indices
%         of the individual polygon i are X(i,:) and Y(i,:)), initial 
%         setting of colours of the polygons are COL (so that length(X) == 
%         length(COL)), XV and YV are indices of verteces of polygons and 
%         colour is a vector of colour specs of the polygons
%         (length(colour) == length(XV)), this function updates COL for all
%         the polygons X,Y based on whether the polygons are in XV,YV to
%         the corresponding colour in colour.

for set_poly_i=1:size(XV,1)
    col = colour(set_poly_i,:);
    IN = inpolygon(X,Y,XV(set_poly_i,:),YV(set_poly_i,:));
    poly_i_in = all(IN'); % logical index for all the vertices of polygon i
                          % are in XV(set_poly_i,:),YV(set_poly_i,:)
    COL(poly_i_in,:) = repmat(col, sum(poly_i_in), 1);
end
end

