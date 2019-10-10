%% program
rtype_NoOp = formatcommand([dec2tc(0,6),dec2tc(0,5),dec2tc(0,5),dec2tc(0,5),dec2tc(0,5),dec2tc(32,6)]);

% ldr syntax: ldr(rt,rs,imm)
% rt = MEM[rs + imm]
% ldr rt, imm(rs)

% str syntax: str(rt,rs,imm)
% str rt, imm(rs)
% MEM[rs + imm] = rt

instructions =[ rtype_NoOp   %                                        // 0
                ldr(1,0,0)   %                                        // 4
                ldr(2,0,4)   %                                        // 8
                ldr(3,0,8)   %                                        //12
                ldr(4,0,12)  % _start                                 //16
                ldr(8,0,64)  % r8 = 32'hFFFFFFFF bits for io setup    //20
                str(8,0,513) % write r8 to address 513 to set io dir  //24
                ldr(8,0,72)  % r8 = 4                                 //28
                ldr(10,0,76) % r10 = 52                               //32
                ldr(11,0,80) % r11 = 1                                //36
                %restart loop here
                ldr(7,0,60)  % r7 = 7 seg value array address r7 = 16 //40
                %loop
                ldr(9,7,0)   % r9 = [r7]                              //44
                str(9,0,512) % write r9 to io output                  //48
                add(7,7,8)   % add 4 to r7 to get next value          //52
                slt(12,10,7) % if r10 < r7 then r12 = 1               //56
                beq(0,0,3)   % branch to delayStart                   //60
                rtype_NoOp   %                                        //64
                beq(12,11,-8)% if r12 == r11 branch reset r7          //68
                beq(0,0,-8)  % branch and reload r9 with updated r7   //72
                %delayStart  %                                        
                ldr(5,0,68)  % Load r5 with count value               //76
                ldr(6,0,20)  % r6 = 1                                 //80
                %delayloop   %                                        
                sub(5,5,6)   % r5 = r5 - r6                           //84
                beq(5,0,-7)  % branch to mem 64 if r5==0              //88
                rtype_NoOp   %                                        //92
                beq(0,0,-4)  % continue delay loop                    //96
                %program end
                beq(0,0,-1)  % while true                             //100
                ];                                                      
            
memdepth = 512;
filler = repelem(rtype_NoOp,((memdepth/4)-size(instructions,1)),1);
instructions = [instructions
            filler];
        
dlmwrite('instmem.mem',instructions,'');
