import os

a = 0
b = 0

while a<16:
    
    b=0
    while b<16:

        file_ptr = open("power.sp", "r")
        file_ptr_write = open("pow_python1.sp", "w")

        for line in file_ptr:
            a3 = 1&(a>>3)
            str1 = f"VinA3 nodeA3 gnd {a3}"
            file_ptr_write.write(line.replace('VinA3 nodeA3 gnd 0', str1))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python1.sp", "r")
        file_ptr_write = open("pow_python2.sp", "w")

        for line in file_ptr:
            a2 = 1&(a>>2)
            str2 = f"VinA2 nodeA2 gnd {a2}"
            file_ptr_write.write(line.replace('VinA2 nodeA2 gnd 0', str2))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python2.sp", "r")
        file_ptr_write = open("pow_python3.sp", "w")

        for line in file_ptr:
            a1 = 1&(a>>1)
            str3 = f"VinA1 nodeA1 gnd {a1}"
            file_ptr_write.write(line.replace('VinA1 nodeA1 gnd 0', str3))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python3.sp", "r")
        file_ptr_write = open("pow_python4.sp", "w")

        for line in file_ptr:
            a0 = 1&(a>>0)
            str4 = f"VinA0 nodeA0 gnd {a0}"
            file_ptr_write.write(line.replace('VinA0 nodeA0 gnd 0', str4))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python4.sp", "r")
        file_ptr_write = open("pow_python5.sp", "w")

        for line in file_ptr:
            b3 = 1&(b>>3)
            str5 = f"VinB3 nodeB3 gnd {b3}"
            file_ptr_write.write(line.replace('VinB3 nodeB3 gnd 0', str5))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python5.sp", "r")
        file_ptr_write = open("pow_python6.sp", "w")

        for line in file_ptr:
            b2 = 1&(b>>2)
            str6 = f"VinB2 nodeB2 gnd {b2}"
            file_ptr_write.write(line.replace('VinB2 nodeB2 gnd 0', str6))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python6.sp", "r")
        file_ptr_write = open("pow_python7.sp", "w")

        for line in file_ptr:
            b1 = 1&(b>>1)
            str7 = f"VinB1 nodeB1 gnd {b1}"
            file_ptr_write.write(line.replace('VinB1 nodeB1 gnd 0', str7))
        file_ptr_write.close()
        file_ptr.close()

        file_ptr = open("pow_python7.sp", "r")
        file_ptr_write = open("pow_python8.sp", "w")

        for line in file_ptr:
            b0 = 1&(b>>0)
            str8 = f"VinB0 nodeB0 gnd {b0}"
            file_ptr_write.write(line.replace('VinB0 nodeB0 gnd 0', str8))
        file_ptr_write.close()
        file_ptr.close()

        cmd = f"ngspice pow_python8.sp"
        os.system(cmd)
        
        b = b+1
    
    a = a+1
