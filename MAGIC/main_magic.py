import os

a = 0
b = 0

while a<16:
    
    b=0
    while b<16:

        file_ptr = open("power_magic.spice", "r")
        file_ptr_write = open("pow_mpython1.spice", "w")

        for line in file_ptr:
            a3 = 1&(a>>3)
            str1 = f"VinA3 A3 gnd {a3}"
            file_ptr_write.write(line.replace('VinA3 A3 gnd 0', str1))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython1.spice", "r")
        file_ptr_write = open("pow_mpython2.spice", "w")

        for line in file_ptr:
            a2 = 1&(a>>2)
            str2 = f"VinA2 A2 gnd {a2}"
            file_ptr_write.write(line.replace('VinA2 A2 gnd 0', str2))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython2.spice", "r")
        file_ptr_write = open("pow_mpython3.spice", "w")

        for line in file_ptr:
            a1 = 1&(a>>1)
            str3 = f"VinA1 A1 gnd {a1}"
            file_ptr_write.write(line.replace('VinA1 A1 gnd 0', str3))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython3.spice", "r")
        file_ptr_write = open("pow_mpython4.spice", "w")

        for line in file_ptr:
            a0 = 1&(a>>0)
            str4 = f"VinA0 A0 gnd {a0}"
            file_ptr_write.write(line.replace('VinA0 A0 gnd 0', str4))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython4.spice", "r")
        file_ptr_write = open("pow_mpython5.spice", "w")

        for line in file_ptr:
            b3 = 1&(b>>3)
            str5 = f"VinB3 B3 gnd {b3}"
            file_ptr_write.write(line.replace('VinB3 B3 gnd 0', str5))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython5.spice", "r")
        file_ptr_write = open("pow_mpython6.spice", "w")

        for line in file_ptr:
            b2 = 1&(b>>2)
            str6 = f"VinB2 B2 gnd {b2}"
            file_ptr_write.write(line.replace('VinB2 B2 gnd 0', str6))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython6.spice", "r")
        file_ptr_write = open("pow_mpython7.spice", "w")

        for line in file_ptr:
            b1 = 1&(b>>1)
            str7 = f"VinB1 B1 gnd {b1}"
            file_ptr_write.write(line.replace('VinB1 B1 gnd 0', str7))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_mpython7.spice", "r")
        file_ptr_write = open("pow_mpython8.spice", "w")

        for line in file_ptr:
            b0 = 1&(b>>0)
            str8 = f"VinB0 B0 gnd {b0}"
            file_ptr_write.write(line.replace('VinB0 B0 gnd 0', str8))
        file_ptr_write.close()
        file_ptr.close()

        cmd = f"ngspice pow_mpython8.spice"
        os.system(cmd)
        
        b = b+1
    
    a = a+1
