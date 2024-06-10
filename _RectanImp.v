//генератор прямоугольных импульсов с управлением по длительности, амплитуде и смещению по времени

module RectanImp (SW,clk,out);

input[11:0] SW; //первые 4 -длительность, вторые- амплитуда, третьи- смещение
input clk;
output reg [2:0] out; //сигнал по оси ординат
///reg[1:0] a; //вспомогательный счётчик для изменения каждого импульса в always-блоке 
///reg [2:0] Amplituda; //значение амплитуды сигнала (от 0 до 4)
integer c; // счётчик импульсов
integer SW_dlit_sum; //cумма включённых свичей для длительности
integer SW_ampl_sum; //cумма включённых свичей для амплитуды

/*
PLLPWM pllpwm1
(
.inclk0(clk),
.c0(clk25MHz)
); 
*/

initial begin
SW_dlit_sum = SW[0] + SW[1] + SW[2] + SW[3];
SW_ampl_sum = SW[4] + SW[5] + SW[6] + SW[7];
c=0;
end

//Управление длительностью и амплитудой
always@( posedge clk)
begin
	if(c<SW_dlit_sum)
		out <= SW_ampl_sum;
	else 
		out <=1'b0;
	c<=c+1;
	if (c==3) 
	begin
		///a<=2'b01;
		c<=0;
	end
	SW_dlit_sum <= SW[0] + SW[1] + SW[2] + SW[3];
	SW_ampl_sum = SW[4] + SW[5] + SW[6] + SW[7];
end








endmodule






