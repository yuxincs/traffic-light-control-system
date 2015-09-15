`timescale 1ns / 1ps

module Traffic(
	output MR,MY,MG,CR,CY,CG,
   output[7:0] oSeg,
	output[3:0] oAn,
	output setLight,
	output onlineLight,
	input set,rst,
	input PQm,PQc,Cm,Cc,
	input online,
	input clk,
	input green,red,yellow,
	input peak
    );
	 
	wire[5:0] enb;
	wire feedback1;
	wire feedback2;
	wire feedback3;
	wire feedback4;
	wire feedbackRst;
	wire feedbackOnline;
   wire[1:0] light1;
   wire[4:0] lightTime1;
	wire[1:0] light2;
   wire[4:0] lightTime2;
   wire[1:0] light3;
   wire[4:0] lightTime3;
   wire[1:0] light4;
   wire[4:0] lightTime4;
	wire[1:0] lightRst;
   wire[4:0] lightTimeRst;
	wire[1:0] lightOnline;
   wire[4:0] lightTimeOnline;
   wire[1:0] light;
   wire[4:0] lightTime;
	wire flicker;
	wire [1:0]state;
	wire [1:0]state1;
	wire [1:0]state2;
	wire [1:0]state3;
	wire [1:0]state4;
	wire [1:0]stateRst;
	wire [1:0]stateOnline;
	 
Controller controller(.enb(enb),
                      .Cm(Cm),
                      .Cc(Cc),
							 .rst(rst),
							 .set(set),
							 .online(online),
							 .feedback1(feedback1),
							 .feedback2(feedback2),
							 .feedback3(feedback3),
							 .feedback4(feedback4),
							 .feedbackRst(feedbackRst),
							 .feedbackOnline(feedbackOnline),
							 .clk(clk)
);

Mode1 mode1(.light(light1),
            .lightTime(lightTime1),
				.feedback(feedback1),
				.set(set),
				.enb(enb[5]),
				.clk(clk),
				.peak(peak),
				.lastState(state),
				.currentState(state1)
);

Mode2 mode2(.light(light2),
            .lightTime(lightTime2),
				.feedback(feedback2),
				.PQm(PQm),
				.PQc(PQc),
				.set(set),
				.enb(enb[4]),
				.clk(clk),
				.lastState(state),
				.currentState(state2)
);

Mode3 mode3(.light(light3),
            .lightTime(lightTime3),
				.feedback(feedback3),
				.PQm(PQm),
				.PQc(PQc),
				.set(set),
				.enb(enb[3]),
				.clk(clk),
				.lastState(state),
				.currentState(state3)
);

Mode4 mode4(.light(light4),
            .lightTime(lightTime4),
				.feedback(feedback4),
				.PQm(PQm),
				.PQc(PQc),
				.set(set),
				.enb(enb[2]),
				.clk(clk),
				.lastState(state),
				.currentState(state4)
);

ModeRst modeRst(.light(lightRst),
            .lightTime(lightTimeRst),
				.set(set),
				.rst(rst),
				.clk(clk),
				.feedback(feedbackRst),
				.enb(enb[1])
);

ModeOnline modeOnline(.light(lightOnline),
					.lightTime(lightTimeOnline),
					.feedback(feedbackOnline),
					.set(set),
					.enb(enb[0]),
					.clk(clk),
					.online(online),
					.lastState(state),
					.red(red),
					.yellow(yellow),
					.green(green),
					.currentState(stateOnline)
);

DataSwitch dataSwitch(.light(light),
                      .lightTime(lightTime),
							 .enb(enb),
							 .light1(light1),
							 .lightTime1(lightTime1),
							 .light2(light2),
							 .lightTime2(lightTime2),
							 .light3(light3),
							 .lightTime3(lightTime3),
							 .light4(light4),
							 .lightTime4(lightTime4),
							 .lightRst(lightRst),
							 .lightTimeRst(lightTimeRst),
							 .lightOnline(lightOnline),
							 .lightTimeOnline(lightTimeOnline),
							 .clk(clk)
);


LightTrans lightTrans(.MR(MR),
                      .MY(MY),
							 .MG(MG),
							 .CR(CR),
							 .CY(CY),
							 .CG(CG),
							 .light(light),
							 .flicker(flicker),
							 .clk(clk)
);

TimeTrans timeTrans(.flicker(flicker),
						  .oSeg(oSeg),
                    .oAn(oAn),
						  .lightTime(lightTime),
						  .clk(clk),
						  .Cm(Cm),
						  .Cc(Cc)
);

StateSwitch stateSwitch(.state(state),
								.enb(enb),
								.state1(state1),
								.state2(state2),
								.state3(state3),
								.state4(state4),
								.stateRst(stateRst),
								.stateOnline(stateOnline),
								.clk(clk)
);

	assign setLight = set;
	assign onlineLight = online;

endmodule

