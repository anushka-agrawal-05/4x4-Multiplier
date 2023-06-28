import os

a = 0
b = 0

while a<16:

    b = 0

    while b<16:

        file_ptr = open("testbench.v", "r")
        file_ptr_write = open("testbench1.v", "w")

        for line in file_ptr:
            str = f"#10 a = 4'd{a}; b = 4'd{b};"
            file_ptr_write.write(line.replace("#10 a = 4'd0; b = 4'd0",str))
        file_ptr_write.close()
        file_ptr.close()

        cmd = f"iverilog -o mul testbench1.v multiplier.v"
        os.system(cmd)

        cmd = f"vvp mul"
        os.system(cmd)

        b= b+1
    a = a+1
    