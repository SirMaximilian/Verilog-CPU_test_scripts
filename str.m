function binary = str(rt,rs,imm)
%    MEM[rs + imm] = rt;
%    str rt, imm(rs)
    binary = formatcommand([dec2tc(43,6),dec2tc(rs,5),dec2tc(rt,5),dec2tc(imm ,16)]);
end