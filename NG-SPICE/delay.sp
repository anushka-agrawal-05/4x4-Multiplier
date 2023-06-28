.INCLUDE TSMC_180nm.txt
.include and.sub
.include fadder.sub
.include xor.sub
.include or.sub

*****Parameters*****
.PARAM Lmin=180n
.PARAM Wmin=180n
.PARAM XX = 1
.PARAM tr=10p
.PARAM pvdd = 1
.temp 25

VDS vdd 0 dc='pvdd'
GRD gnd 0 dc=0

VinA3 nodeA3 gnd PWL ( {0*6000p} 1 {0*6000p+tr} 0 {0*6000p+3000p} 0 {0*6000p+3000p+tr} 1)
VinA2 nodeA2 gnd PWL ( {0*6000p} 0 {0*6000p+tr} 1 {0*6000p+3000p} 1 {0*6000p+3000p+tr} 0)
VinA1 nodeA1 gnd PWL ( {0*6000p} 0 {0*6000p+tr} 1 {0*6000p+3000p} 1 {0*6000p+3000p+tr} 0)
VinA0 nodeA0 gnd PWL ( {0*6000p} 0 {0*6000p+tr} 1 {0*6000p+3000p} 1 {0*6000p+3000p+tr} 0)
VinB3 nodeB3 gnd PWL ( {0*6000p} 0 {0*6000p+tr} 1 {0*6000p+3000p} 1 {0*6000p+3000p+tr} 0)
VinB2 nodeB2 gnd PWL ( {0*6000p} 1 {0*6000p+tr} 0 {0*6000p+3000p} 0 {0*6000p+3000p+tr} 1)
VinB1 nodeB1 gnd PWL ( {0*6000p} 0 {0*6000p+tr} 1 {0*6000p+3000p} 1 {0*6000p+3000p+tr} 0)
VinB0 nodeB0 gnd PWL ( {0*6000p} 1 {0*6000p+tr} 0 {0*6000p+3000p} 0 {0*6000p+3000p+tr} 1)

* VinA3 nodeA3 gnd 0
* VinA2 nodeA2 gnd 1
* VinA1 nodeA1 gnd 1
* VinA0 nodeA0 gnd 0
* VinB3 nodeB3 gnd 0
* VinB2 nodeB2 gnd 1
* VinB1 nodeB1 gnd 1
* VinB0 nodeB0 gnd 0

* .control 
* run 
* plot V(nodeA3)+30 V(nodeA2)+28 V(nodeA1)+26 V(nodeA0)+24 V(nodeB3)+22 V(nodeB2)+20 V(nodeB1)+18 V(nodeB0)+16 
* .endc

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

.tran 0.1p {1*6000p}

.control 
run 

let VA3 = V(nodeA3)
let inA3 = VA3[105]
let VA2 = V(nodeA2)
let inA2 = VA2[105]
let VA1 = V(nodeA1)
let inA1 = VA1[105]
let VA0 = V(nodeA0)
let inA0 = VA0[105]
let VB3 = V(nodeB3)
let inB3 = VB3[105]
let VB2 = V(nodeB2)
let inB2 = VB2[105]
let VB1 = V(nodeB1)
let inB1 = VB1[105]
let VB0 = V(nodeB0)
let inB0 = VB0[105]

meas tran delay_LH trig v(nodeA0) val=0.5 fall = 1 targ v(P3) val = 0.5 rise =1
meas tran delay_HL trig v(nodeA0) val=0.5 rise = 1 targ v(P5) val = 0.5 fall =1
let delay = (delay_HL+delay_LH)/2

plot V(nodeA3)+30 V(nodeA2)+28 V(nodeA1)+26 V(nodeA0)+24 V(nodeB3)+22 V(nodeB2)+20 V(nodeB1)+18 V(nodeB0)+16 V(P0)+14 V(P1)+12 V(P2)+10 V(P3)+8 V(P4)+6 V(P5)+4 V(P6)+2 V(C5)
echo "input A: ", "$&inA3", "$&inA2", "$&inA1", "$&inA0" >> delay_output.txt
echo "input B: ", "$&inB3", "$&inB2", "$&inB1", "$&inB0" >> delay_output.txt
echo "worst case propagation delay: ", "$&delay" >> delay_output.txt
.endc

.end