.include TSMC_180nm.txt
.include and.sub
.include or.sub
.include xor.sub
.include fadder.sub
** Parameters **
.PARAM Lmin=180n
.PARAM Wmin=180n
.PARAM XX = 1
.PARAM tr=0.1p
.PARAM pvdd = 1
.temp 25
** Input Voltages **
VDS vdd 0 dc='pvdd'
GRD gnd 0 dc=0

V1 in1 gnd pulse pvdd 0 0 100p 100p 10n 20n
V2 in2 gnd pulse pvdd 0 0 100p 100p 20n 40n
V3 in3 gnd pulse pvdd 0 0 100p 100p 40n 80n 

** Circuit Description **
* xand in1 in2 out vdd gnd and
* xor in1 in2 out vdd gnd or
* xxor in1 in2 out vdd gnd xor
xfadd in1 in2 in3 cout sum vdd gnd fadder

** Analysis **
.tran 1p 80n

** Plotting **
.control
run
* plot out in1+2 in2+4
plot cout sum+2 in1+4 in2+6 in3+8
.endc
.end
