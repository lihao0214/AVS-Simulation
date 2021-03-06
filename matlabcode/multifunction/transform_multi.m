function [Z, Pz] = transform_multi(eventdata, avsdata, E)
%TRANSFORM_MULTI combine all events and calculate 
%   Detailed explanation goes he

    % Preallocate for speed
    Z = zeros(size(E, 1)/17, size(avsdata, 2), size(avsdata, 3));
    Pz = zeros(size(E, 1)/17, size(avsdata, 2), size(avsdata, 3));

    for i = 1:size(avsdata, 2)
        for k = 1:size(avsdata, 3)
            for j = 1:size(eventdata, 2)
                % calculate the vector for the transformation
                transvec = eventdata(1,j).location - avsdata(1,i,k).location;
                [avswave, pressure] = loctransform(transvec, E(:,j));
                % sum up the different sources. 
                Z(:,i,k) = Z(:,i,k) + avswave;
                Pz(:,i,k) = Pz(:,i,k) + pressure;
            end
        end
    end
end

