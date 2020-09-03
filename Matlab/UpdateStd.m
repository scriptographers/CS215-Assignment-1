function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
    newVar = OldStd^2 + OldMean^2 - NewMean^2 + NewDataValue^2 / n;
    newStd = newVar^0.5;
end