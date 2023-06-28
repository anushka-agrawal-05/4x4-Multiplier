.INCLUDE TSMC_180nm.txt
.include and.sub
.include fadder.sub
.include xor.sub
.include or.sub

*****Parameters*****
.PARAM Lmin=180n
.PARAM Wmin=180n
.PARAM XX = 1
.PARAM tr=0.1p
.PARAM pvdd = 1

.temp 25

VDS vdd 0 dc='pvdd'
GRD gnd 0 dc=0


VinA3 nodeA3 gnd 0
VinA2 nodeA2 gnd 0
VinA1 nodeA1 gnd 0
VinA0 nodeA0 gnd 0
VinB3 nodeB3 gnd 0
VinB2 nodeB2 gnd 0
VinB1 nodeB1 gnd 0
VinB0 nodeB0 gnd 0

Xand1 nodeB3 nodeA3 a1 vdd gnd and
Xand2 nodeB2 nodeA3 a2 vdd gnd and
Xand3 nodeB3 nodeA2 a3 vdd gnd and
Xand4 nodeB3 nodeA1 a4 vdd gnd and
Xand5 nodeB1 nodeA3 a5 vdd gnd and
Xand6 nodeB2 nodeA2 a6 vdd gnd and
Xand7 nodeB1 nodeA2 a7 vdd gnd and
Xand8 nodeB0 nodeA3 a8 vdd gnd and
Xand9 nodeB3 nodeA0 a9 vdd gnd and
Xand10 nodeB2 nodeA1 a10 vdd gnd and
Xand11 nodeB1 nodeA1 a11 vdd gnd and
Xand12 nodeB0 nodeA2 a12 vdd gnd and
Xand13 nodeB2 nodeA0 a13 vdd gnd and
Xand14 nodeB0 nodeA1 a14 vdd gnd and
Xand15 nodeB1 nodeA0 a15 vdd gnd and
Xand16 nodeB0 nodeA0 P0 vdd gnd and

Xfadd1 a7 a8 0 C_fa1 S_fa1 vdd gnd fadder
Xfadd2 a11 a12 0 C_fa2 S_fa2 vdd gnd fadder
Xfadd3 a14 a15 0 C_fa3 P1 vdd gnd fadder
Xfadd4 C_fa1 a5 a6 C_fa4 S_fa4 vdd gnd fadder
Xfadd5 a2 a3 C_fa4 C_fa5 S_fa5 vdd gnd fadder
Xfadd6 a10 C_fa2 S_fa1 C_fa6 S_fa6 vdd gnd fadder
Xfadd7 a13 S_fa2 C_fa3 C_fa7 P2 vdd gnd fadder
Xfadd8 a9 C_fa7 S_fa6 C_fa8 P3 vdd gnd fadder
Xfadd9 a4 S_fa4 C_fa6 C_fa9 S_fa9 vdd gnd fadder
Xfadd10 0 C_fa8 S_fa9 C_fa10 P4 vdd gnd fadder
Xfadd11 C_fa10 C_fa9 S_fa5 C_fa11 P5 vdd gnd fadder
Xfadd12 C_fa11 C_fa5 a1 C5 P6 vdd gnd fadder

.tran 0.1p {1*40p}

.control 
run 

let P7 = V(C5)
let temp7 = P7[1]
let P6 = V(P6)
let temp6 = P6[1]
let P5 = V(P5)
let temp5 = P5[1]
let P4 = V(P4)
let temp4 = P4[1]
let P3 = V(P3)
let temp3 = P3[1]
let P2 = V(P2)
let temp2 = P2[1]
let P1 = V(P1)
let temp1 = P1[1]
let P0 = V(P0)
let temp0 = P0[1]

let VA3 = V(nodeA3)
let inA3 = VA3[1]
let VA2 = V(nodeA2)
let inA2 = VA2[1]
let VA1 = V(nodeA1)
let inA1 = VA1[1]
let VA0 = V(nodeA0)
let inA0 = VA0[1]
let VB3 = V(nodeB3)
let inB3 = VB3[1]
let VB2 = V(nodeB2)
let inB2 = VB2[1]
let VB1 = V(nodeB1)
let inB1 = VB1[1]
let VB0 = V(nodeB0)
let inB0 = VB0[1]

let IA3 = I(VinA3)
let iinA3 = IA3[1]
let IA2 = I(VinA2)
let iinA2 = IA2[1]
let IA1 = I(VinA1)
let iinA1 = IA1[1]
let IA0 = I(VinA0)
let iinA0 = IA0[1]
let IB3 = I(VinB3)
let iinB3 = IB3[1]
let IB2 = I(VinB2)
let iinB2 = IB2[1]
let IB1 = I(VinB1)
let iinB1 = IB1[1]
let IB0 = I(VinB0)
let iinB0 = IB0[1]

let Vs = V(vdd)
let in = Vs[1]
let Is = I(VDS)
let iin = Is[1]

let power = inA3*iinA3 + inB3*iinB3 +inA2*iinA2 + inB2*iinB2 + inA1*iinA1 + inB1*iinB1 + inA0*iinA0 + inB0*iinB0 + in*iin

echo "input A: ", "$&inA3", "$&inA2", "$&inA1", "$&inA0" >> power_output.txt
echo "input B: ", "$&inB3", "$&inB2", "$&inB1", "$&inB0" >> power_output.txt
echo "output:", "$&temp7", "$&temp6", "$&temp5", "$&temp4", "$&temp3", "$&temp2", "$&temp1", "$&temp0" >> power_output.txt
echo "leakage power: ", "$&power" >> power_output.txt
quit
.endc



.end