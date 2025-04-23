`timescale 1ns/1ps
module not_gate_tb;
    reg a;
    wire y;
    integer f;

    not_gate uut (
        .a(a),
        .y(y)
    );

    initial begin
        $dumpfile("not_gate.vcd");
        $dumpvars(0, not_gate_tb);
        f = $fopen("monitor_log_not.txt", "w");

        if (!f) begin
            $display("failed to open monitor_log_not.txt");
            $finish;
        end
        else begin
            $display("File opened.");
        end

        a = 0; #10;
        $fwrite(f, "a=%b, y=%b @ %0t ns\n", a, y, $time);

        a = 1; #10;
        $fwrite(f, "a=%b, y=%b @ %0t ns\n", a, y, $time);

        #10;
        $fclose(f);
        $display("Done writing to file");
        $finish;
    end
endmodule
