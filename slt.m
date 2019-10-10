function binary = slt(rd,rs,rt)
%   if (rs < rt) rd = 1               
    binary = formatcommand([dec2tc(0,6),dec2tc(rs,5),dec2tc(rt,5),dec2tc(rd,5),dec2tc(0,5),dec2tc(42,6)]);
end