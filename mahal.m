function [mahal_distance] = mahal(muA, SigmaA, muB, SigmaB)


if (SigmaB ~= 0)
    SigmaA = SigmaA + SigmaB;
end
dmu = muA;
if (muB ~= 0)
    dmu = muA - muB;
end
if (ndims(SigmaA) == 2)
    D = dmu' * inv(SigmaA) * dmu;
    D = D(1);
else
    D = (dmu * dmu) / SigmaA;
end
mahal_distance = sqrt(D);