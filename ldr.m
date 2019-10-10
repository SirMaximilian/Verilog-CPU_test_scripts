function binary = ldr(rt,rs,imm)
%   rt = MEM[rs + imm];
%   ldr rt, imm(rs)
    binary = formatcommand([dec2tc(35,6),dec2tc(rs,5),dec2tc(rt,5),dec2tc(imm ,16)]);
end