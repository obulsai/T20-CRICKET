module t20_cricket_tb;
    reg clk_fpga;
    reg reset;
    reg start;
    reg teamSwitch;
    wire dp;
    wire [6:0] ca;
    wire [3:0] an;
    wire [15:0] leds;

    Cricket uut (
        .clk_fpga(clk_fpga),
        .reset(reset),
        .start(start),
        .teamSwitch(teamSwitch),
        .dp(dp),
        .ca(ca),
        .an(an),
        .leds(leds)
    );

    initial begin
        clk_fpga = 0;
        forever #5 clk_fpga = ~clk_fpga;
    end

    initial begin

        reset = 1;
        start = 0;
        teamSwitch = 0;
        #20;
        reset = 0;

        #50;
        start = 1;
        #10;
        start = 0;

        repeat (50) @(posedge clk_fpga);

        #100;
        teamSwitch = 1;

        repeat (20) begin
            #50;
            start = 1;
            #10;
            start = 0;
            @(posedge clk_fpga);
        end

        #200;
        reset = 1;
        #20;
        reset = 0;
        #500;
        $stop;
    end
    initial begin
        $monitor("Time: %0t | reset: %b | start: %b | teamSwitch: %b | leds: %b | ca: %b | an: %b ",
                 $time, reset, start, teamSwitch, leds, ca, an);
    end


endmodule
