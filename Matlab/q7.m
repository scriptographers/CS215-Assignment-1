clc;
clear;

% A = 1:1:100;
% newtau = UpdateMedian(50.5, 50, A, 100)

function newMean = UpdateMean (OldMean, NewDataValue, n)
    newMean = OldMean + NewDataValue/n;
end

function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
    x = NewDataValue;
    mid = floor(n/2); % mid is n/2 for Even and (Index of Median) - 1 for Odd
    if mod(n,2) == 1 % Odd
        if x < A(mid)
            newMedian = (A(mid) + A(mid+1)) / 2;
        elseif x < A(mid + 2)
            newMedian = (A(mid+1) + x) / 2;
        else
            newMedian = (A(mid+1) + A(mid+2)) / 2;
        end
    else % Even
        if x < A(mid)
            newMedian = A(mid);
        elseif x < A(mid+1)
            newMedian = x;
        else
            newMedian = A(mid+1);
        end
    end
end

function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
    newVar = OldStd^2 + OldMean^2 - NewMean^2 + NewDataValue^2 / n;
    newStd = newVar^0.5;
end



