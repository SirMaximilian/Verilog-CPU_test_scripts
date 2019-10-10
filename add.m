function binary = add(rd,rs,rt)
%  rd = rs + rt                  
    binary = formatcommand([dec2tc(0,6),dec2tc(rs,5),dec2tc(rt,5),dec2tc(rd,5),dec2tc(0,5),dec2tc(32,6)]);
end