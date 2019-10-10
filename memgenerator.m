%% hex genrator

%data = dec2tc(randi(255,(512-4*4),1));

% ldr =35 str =43 R-type =0 branch =4
% Rtype funct add=32 sub=34 AND=36 OR=37 less-then=42

%                     type R       Rs           Rt           rd           shamount     funct
rtype_NoOp_command = [dec2tc(0,6),dec2tc(0,5),dec2tc(0,5),dec2tc(0,5),dec2tc(0,5),dec2tc(32,6)];
rtype_ADD__command = [dec2tc(0,6),dec2tc(2,5),dec2tc(3,5),dec2tc(5,5),dec2tc(0,5),dec2tc(32,6)];
rtype_SUB__command = [dec2tc(0,6),dec2tc(2,5),dec2tc(3,5),dec2tc(6,5),dec2tc(0,5),dec2tc(34,6)];

ldr0command = [dec2tc(35,6),dec2tc(0,5),dec2tc(1,5),dec2tc(0 ,16)];
ldr1command = [dec2tc(35,6),dec2tc(0,5),dec2tc(2,5),dec2tc(4 ,16)];
ldr2command = [dec2tc(35,6),dec2tc(0,5),dec2tc(3,5),dec2tc(8 ,16)];
ldr3command = [dec2tc(35,6),dec2tc(0,5),dec2tc(4,5),dec2tc(12,16)];
str0command = [dec2tc(43,6),dec2tc(0,5),dec2tc(1,5),dec2tc(16,16)];
str1command = [dec2tc(43,6),dec2tc(0,5),dec2tc(3,5),dec2tc(20,16)];

commands = [formatcommand(rtype_NoOp_command) %no_op //0
            formatcommand(ldr0command)              %//4
            formatcommand(ldr1command)              %//8
            formatcommand(ldr2command)              %//12
            formatcommand(ldr3command)              %//16
            formatcommand(str0command)              %//20
            formatcommand(str1command)              %//24
            formatcommand(rtype_ADD__command)       %//28
            formatcommand(rtype_SUB__command)       %//32
            beq(0,0,-8)                             %//36
            formatcommand(rtype_NoOp_command)];     %//40
        
memdepth = 512;
filler = repelem(formatcommand(rtype_NoOp_command),((memdepth/4)-size(commands,1)),1);
commands = [commands
            filler];
%dlmwrite('instmem.mem',commands,'');

%% data

% data = ['11011110101011011011111011101111,' %deadbeef //0
%         '11011110101011011100000011011110,' %deadc0de //4
%         '11001010111111101011101010111110,' %cafebabe //8
%         '10101011101011011011101010111110,' %abadbabe //12

data = ['11011110 10101101 10111110 11101111' %deadbeef //0
        '11011110 10101101 11000000 11011110' %deadc0de //4
        '11001010 11111110 10111010 10111110' %cafebabe //8
        '10101011 10101101 10111010 10111110' %abadbabe //12
        
        formatcommand(dec2tc(0 ,32)) %16
        formatcommand(dec2tc(1 ,32)) %20
        formatcommand(dec2tc(2 ,32)) %24
        formatcommand(dec2tc(3 ,32)) %28
        formatcommand(dec2tc(4 ,32)) %32
        formatcommand(dec2tc(5 ,32)) %36
        formatcommand(dec2tc(6 ,32)) %40
        formatcommand(dec2tc(7 ,32)) %44
        formatcommand(dec2tc(8 ,32)) %48
        formatcommand(dec2tc(9 ,32)) %52
        formatcommand(dec2tc(10,32)) %56
        
        formatcommand(dec2tc(16,32)) %60 //     address of array start
        formatcommand(dec2tc((2^32)-1,32)) %64 //32'hFFFFFFFF
        formatcommand(dec2tc(5,32))  %68  was 12500000 for 50MHz
        formatcommand(dec2tc(4,32))  %72
        formatcommand(dec2tc(52,32)) %76
        formatcommand(dec2tc(1 ,32)) %80
        ];

memdepth = 512;
filler = repelem(formatcommand(dec2tc(0,32)),((memdepth/4)-size(data,1)),1);
data = [data
        filler];

dlmwrite('datamem.mem',data,'');