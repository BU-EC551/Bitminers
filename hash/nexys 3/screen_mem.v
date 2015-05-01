`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:49 04/17/2015 
// Design Name: 
// Module Name:    screen_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module screen_mem(
	input wire clk,
	input wire [6:0] x,
	input wire [4:0] y,
	input wire [1023:0] hashin,
	input wire [255:0] hashout,
	output wire [7:0] index
    );

	reg [7:0] mem[0:127][0:63];
	reg [7:0] i;
	reg [5:0] j;
	reg[3:0] amem[255:0];
	reg[3:0] bmem[63:0];
	integer k=0;
	
	
	initial begin
		for (j = 0; j < 32; j = j + 1)
			for (i = 0; i < 128; i = i + 1)begin
				mem[i][j] = 8'h16;end
//				mem[1][0]=8'ha;mem[2][0]=8'ha;mem[3][0]=8'hb;mem[4][0]=8'hb;mem[5][0]=8'hc;mem[6][0]=8'hc;mem[7][0]=8'hd;mem[8][0]=8'hd;mem[9][0]=8'he;mem[10][0]=8'he;
//				mem[11][0]=8'ha;mem[12][0]=8'ha;mem[13][0]=8'hb;mem[14][0]=8'hb;mem[15][0]=8'hc;mem[16][0]=8'hc;mem[17][0]=8'hd;mem[18][0]=8'hd;mem[19][0]=8'he;mem[20][0]=8'he;
//	
//				mem[1][2]=8'ha;mem[2][0]=8'ha;mem[3][2]=8'hb;mem[4][2]=8'hb;mem[5][2]=8'hc;mem[6][2]=8'hc;mem[7][2]=8'hd;mem[8][2]=8'hd;mem[9][2]=8'he;mem[10][2]=8'he;
	end
	
	always@(*) begin
	
	amem[	0	]=hashin[	3	:	0	];
	amem[	1	]=hashin[	7	:	4	];
	amem[	2	]=hashin[	11	:	8	];
	amem[	3	]=hashin[	15	:	12	];
	amem[	4	]=hashin[	19	:	16	];
	amem[	5	]=hashin[	23	:	20	];
	amem[	6	]=hashin[	27	:	24	];
	amem[	7	]=hashin[	31	:	28	];
	amem[	8	]=hashin[	35	:	32	];
	amem[	9	]=hashin[	39	:	36	];
	amem[	10	]=hashin[	43	:	40	];
	amem[	11	]=hashin[	47	:	44	];
	amem[	12	]=hashin[	51	:	48	];
	amem[	13	]=hashin[	55	:	52	];
	amem[	14	]=hashin[	59	:	56	];
	amem[	15	]=hashin[	63	:	60	];
	amem[	16	]=hashin[	67	:	64	];
	amem[	17	]=hashin[	71	:	68	];
	amem[	18	]=hashin[	75	:	72	];
	amem[	19	]=hashin[	79	:	76	];
	amem[	20	]=hashin[	83	:	80	];
	amem[	21	]=hashin[	87	:	84	];
	amem[	22	]=hashin[	91	:	88	];
	amem[	23	]=hashin[	95	:	92	];
	amem[	24	]=hashin[	99	:	96	];
	amem[	25	]=hashin[	103	:	100	];
	amem[	26	]=hashin[	107	:	104	];
	amem[	27	]=hashin[	111	:	108	];
	amem[	28	]=hashin[	115	:	112	];
	amem[	29	]=hashin[	119	:	116	];
	amem[	30	]=hashin[	123	:	120	];
	amem[	31	]=hashin[	127	:	124	];
	amem[	32	]=hashin[	131	:	128	];
	amem[	33	]=hashin[	135	:	132	];
	amem[	34	]=hashin[	139	:	136	];
	amem[	35	]=hashin[	143	:	140	];
	amem[	36	]=hashin[	147	:	144	];
	amem[	37	]=hashin[	151	:	148	];
	amem[	38	]=hashin[	155	:	152	];
	amem[	39	]=hashin[	159	:	156	];
	amem[	40	]=hashin[	163	:	160	];
	amem[	41	]=hashin[	167	:	164	];
	amem[	42	]=hashin[	171	:	168	];
	amem[	43	]=hashin[	175	:	172	];
	amem[	44	]=hashin[	179	:	176	];
	amem[	45	]=hashin[	183	:	180	];
	amem[	46	]=hashin[	187	:	184	];
	amem[	47	]=hashin[	191	:	188	];
	amem[	48	]=hashin[	195	:	192	];
	amem[	49	]=hashin[	199	:	196	];
	amem[	50	]=hashin[	203	:	200	];
	amem[	51	]=hashin[	207	:	204	];
	amem[	52	]=hashin[	211	:	208	];
	amem[	53	]=hashin[	215	:	212	];
	amem[	54	]=hashin[	219	:	216	];
	amem[	55	]=hashin[	223	:	220	];
	amem[	56	]=hashin[	227	:	224	];
	amem[	57	]=hashin[	231	:	228	];
	amem[	58	]=hashin[	235	:	232	];
	amem[	59	]=hashin[	239	:	236	];
	amem[	60	]=hashin[	243	:	240	];
	amem[	61	]=hashin[	247	:	244	];
	amem[	62	]=hashin[	251	:	248	];
	amem[	63	]=hashin[	255	:	252	];
	amem[	64	]=hashin[	259	:	256	];
	amem[	65	]=hashin[	263	:	260	];
	amem[	66	]=hashin[	267	:	264	];
	amem[	67	]=hashin[	271	:	268	];
	amem[	68	]=hashin[	275	:	272	];
	amem[	69	]=hashin[	279	:	276	];
	amem[	70	]=hashin[	283	:	280	];
	amem[	71	]=hashin[	287	:	284	];
	amem[	72	]=hashin[	291	:	288	];
	amem[	73	]=hashin[	295	:	292	];
	amem[	74	]=hashin[	299	:	296	];
	amem[	75	]=hashin[	303	:	300	];
	amem[	76	]=hashin[	307	:	304	];
	amem[	77	]=hashin[	311	:	308	];
	amem[	78	]=hashin[	315	:	312	];
	amem[	79	]=hashin[	319	:	316	];
	amem[	80	]=hashin[	323	:	320	];
	amem[	81	]=hashin[	327	:	324	];
	amem[	82	]=hashin[	331	:	328	];
	amem[	83	]=hashin[	335	:	332	];
	amem[	84	]=hashin[	339	:	336	];
	amem[	85	]=hashin[	343	:	340	];
	amem[	86	]=hashin[	347	:	344	];
	amem[	87	]=hashin[	351	:	348	];
	amem[	88	]=hashin[	355	:	352	];
	amem[	89	]=hashin[	359	:	356	];
	amem[	90	]=hashin[	363	:	360	];
	amem[	91	]=hashin[	367	:	364	];
	amem[	92	]=hashin[	371	:	368	];
	amem[	93	]=hashin[	375	:	372	];
	amem[	94	]=hashin[	379	:	376	];
	amem[	95	]=hashin[	383	:	380	];
	amem[	96	]=hashin[	387	:	384	];
	amem[	97	]=hashin[	391	:	388	];
	amem[	98	]=hashin[	395	:	392	];
	amem[	99	]=hashin[	399	:	396	];
	amem[	100	]=hashin[	403	:	400	];
	amem[	101	]=hashin[	407	:	404	];
	amem[	102	]=hashin[	411	:	408	];
	amem[	103	]=hashin[	415	:	412	];
	amem[	104	]=hashin[	419	:	416	];
	amem[	105	]=hashin[	423	:	420	];
	amem[	106	]=hashin[	427	:	424	];
	amem[	107	]=hashin[	431	:	428	];
	amem[	108	]=hashin[	435	:	432	];
	amem[	109	]=hashin[	439	:	436	];
	amem[	110	]=hashin[	443	:	440	];
	amem[	111	]=hashin[	447	:	444	];
	amem[	112	]=hashin[	451	:	448	];
	amem[	113	]=hashin[	455	:	452	];
	amem[	114	]=hashin[	459	:	456	];
	amem[	115	]=hashin[	463	:	460	];
	amem[	116	]=hashin[	467	:	464	];
	amem[	117	]=hashin[	471	:	468	];
	amem[	118	]=hashin[	475	:	472	];
	amem[	119	]=hashin[	479	:	476	];
	amem[	120	]=hashin[	483	:	480	];
	amem[	121	]=hashin[	487	:	484	];
	amem[	122	]=hashin[	491	:	488	];
	amem[	123	]=hashin[	495	:	492	];
	amem[	124	]=hashin[	499	:	496	];
	amem[	125	]=hashin[	503	:	500	];
	amem[	126	]=hashin[	507	:	504	];
	amem[	127	]=hashin[	511	:	508	];
	amem[	128	]=hashin[	515	:	512	];
	amem[	129	]=hashin[	519	:	516	];
	amem[	130	]=hashin[	523	:	520	];
	amem[	131	]=hashin[	527	:	524	];
	amem[	132	]=hashin[	531	:	528	];
	amem[	133	]=hashin[	535	:	532	];
	amem[	134	]=hashin[	539	:	536	];
	amem[	135	]=hashin[	543	:	540	];
	amem[	136	]=hashin[	547	:	544	];
	amem[	137	]=hashin[	551	:	548	];
	amem[	138	]=hashin[	555	:	552	];
	amem[	139	]=hashin[	559	:	556	];
	amem[	140	]=hashin[	563	:	560	];
	amem[	141	]=hashin[	567	:	564	];
	amem[	142	]=hashin[	571	:	568	];
	amem[	143	]=hashin[	575	:	572	];
	amem[	144	]=hashin[	579	:	576	];
	amem[	145	]=hashin[	583	:	580	];
	amem[	146	]=hashin[	587	:	584	];
	amem[	147	]=hashin[	591	:	588	];
	amem[	148	]=hashin[	595	:	592	];
	amem[	149	]=hashin[	599	:	596	];
	amem[	150	]=hashin[	603	:	600	];
	amem[	151	]=hashin[	607	:	604	];
	amem[	152	]=hashin[	611	:	608	];
	amem[	153	]=hashin[	615	:	612	];
	amem[	154	]=hashin[	619	:	616	];
	amem[	155	]=hashin[	623	:	620	];
	amem[	156	]=hashin[	627	:	624	];
	amem[	157	]=hashin[	631	:	628	];
	amem[	158	]=hashin[	635	:	632	];
	amem[	159	]=hashin[	639	:	636	];
	amem[	160	]=hashin[	643	:	640	];
	amem[	161	]=hashin[	647	:	644	];
	amem[	162	]=hashin[	651	:	648	];
	amem[	163	]=hashin[	655	:	652	];
	amem[	164	]=hashin[	659	:	656	];
	amem[	165	]=hashin[	663	:	660	];
	amem[	166	]=hashin[	667	:	664	];
	amem[	167	]=hashin[	671	:	668	];
	amem[	168	]=hashin[	675	:	672	];
	amem[	169	]=hashin[	679	:	676	];
	amem[	170	]=hashin[	683	:	680	];
	amem[	171	]=hashin[	687	:	684	];
	amem[	172	]=hashin[	691	:	688	];
	amem[	173	]=hashin[	695	:	692	];
	amem[	174	]=hashin[	699	:	696	];
	amem[	175	]=hashin[	703	:	700	];
	amem[	176	]=hashin[	707	:	704	];
	amem[	177	]=hashin[	711	:	708	];
	amem[	178	]=hashin[	715	:	712	];
	amem[	179	]=hashin[	719	:	716	];
	amem[	180	]=hashin[	723	:	720	];
	amem[	181	]=hashin[	727	:	724	];
	amem[	182	]=hashin[	731	:	728	];
	amem[	183	]=hashin[	735	:	732	];
	amem[	184	]=hashin[	739	:	736	];
	amem[	185	]=hashin[	743	:	740	];
	amem[	186	]=hashin[	747	:	744	];
	amem[	187	]=hashin[	751	:	748	];
	amem[	188	]=hashin[	755	:	752	];
	amem[	189	]=hashin[	759	:	756	];
	amem[	190	]=hashin[	763	:	760	];
	amem[	191	]=hashin[	767	:	764	];
	amem[	192	]=hashin[	771	:	768	];
	amem[	193	]=hashin[	775	:	772	];
	amem[	194	]=hashin[	779	:	776	];
	amem[	195	]=hashin[	783	:	780	];
	amem[	196	]=hashin[	787	:	784	];
	amem[	197	]=hashin[	791	:	788	];
	amem[	198	]=hashin[	795	:	792	];
	amem[	199	]=hashin[	799	:	796	];
	amem[	200	]=hashin[	803	:	800	];
	amem[	201	]=hashin[	807	:	804	];
	amem[	202	]=hashin[	811	:	808	];
	amem[	203	]=hashin[	815	:	812	];
	amem[	204	]=hashin[	819	:	816	];
	amem[	205	]=hashin[	823	:	820	];
	amem[	206	]=hashin[	827	:	824	];
	amem[	207	]=hashin[	831	:	828	];
	amem[	208	]=hashin[	835	:	832	];
	amem[	209	]=hashin[	839	:	836	];
	amem[	210	]=hashin[	843	:	840	];
	amem[	211	]=hashin[	847	:	844	];
	amem[	212	]=hashin[	851	:	848	];
	amem[	213	]=hashin[	855	:	852	];
	amem[	214	]=hashin[	859	:	856	];
	amem[	215	]=hashin[	863	:	860	];
	amem[	216	]=hashin[	867	:	864	];
	amem[	217	]=hashin[	871	:	868	];
	amem[	218	]=hashin[	875	:	872	];
	amem[	219	]=hashin[	879	:	876	];
	amem[	220	]=hashin[	883	:	880	];
	amem[	221	]=hashin[	887	:	884	];
	amem[	222	]=hashin[	891	:	888	];
	amem[	223	]=hashin[	895	:	892	];
	amem[	224	]=hashin[	899	:	896	];
	amem[	225	]=hashin[	903	:	900	];
	amem[	226	]=hashin[	907	:	904	];
	amem[	227	]=hashin[	911	:	908	];
	amem[	228	]=hashin[	915	:	912	];
	amem[	229	]=hashin[	919	:	916	];
	amem[	230	]=hashin[	923	:	920	];
	amem[	231	]=hashin[	927	:	924	];
	amem[	232	]=hashin[	931	:	928	];
	amem[	233	]=hashin[	935	:	932	];
	amem[	234	]=hashin[	939	:	936	];
	amem[	235	]=hashin[	943	:	940	];
	amem[	236	]=hashin[	947	:	944	];
	amem[	237	]=hashin[	951	:	948	];
	amem[	238	]=hashin[	955	:	952	];
	amem[	239	]=hashin[	959	:	956	];
	amem[	240	]=hashin[	963	:	960	];
	amem[	241	]=hashin[	967	:	964	];
	amem[	242	]=hashin[	971	:	968	];
	amem[	243	]=hashin[	975	:	972	];
	amem[	244	]=hashin[	979	:	976	];
	amem[	245	]=hashin[	983	:	980	];
	amem[	246	]=hashin[	987	:	984	];
	amem[	247	]=hashin[	991	:	988	];
	amem[	248	]=hashin[	995	:	992	];
	amem[	249	]=hashin[	999	:	996	];
	amem[	250	]=hashin[	1003	:	1000	];
	amem[	251	]=hashin[	1007	:	1004	];
	amem[	252	]=hashin[	1011	:	1008	];
	amem[	253	]=hashin[	1015	:	1012	];
	amem[	254	]=hashin[	1019	:	1016	];
	amem[	255	]=hashin[	1023	:	1020	];
	
	
	
			
		bmem[	0	]=hashout[	3	:	0	];
		bmem[	1	]=hashout[	7	:	4	];
		bmem[	2	]=hashout[	11	:	8	];
		bmem[	3	]=hashout[	15	:	12	];
		bmem[	4	]=hashout[	19	:	16	];
		bmem[	5	]=hashout[	23	:	20	];
		bmem[	6	]=hashout[	27	:	24	];
		bmem[	7	]=hashout[	31	:	28	];
		bmem[	8	]=hashout[	35	:	32	];
		bmem[	9	]=hashout[	39	:	36	];
		bmem[	10	]=hashout[	43	:	40	];
		bmem[	11	]=hashout[	47	:	44	];
		bmem[	12	]=hashout[	51	:	48	];
		bmem[	13	]=hashout[	55	:	52	];
		bmem[	14	]=hashout[	59	:	56	];
		bmem[	15	]=hashout[	63	:	60	];
		bmem[	16	]=hashout[	67	:	64	];
		bmem[	17	]=hashout[	71	:	68	];
		bmem[	18	]=hashout[	75	:	72	];
		bmem[	19	]=hashout[	79	:	76	];
		bmem[	20	]=hashout[	83	:	80	];
		bmem[	21	]=hashout[	87	:	84	];
		bmem[	22	]=hashout[	91	:	88	];
		bmem[	23	]=hashout[	95	:	92	];
		bmem[	24	]=hashout[	99	:	96	];
		bmem[	25	]=hashout[	103	:	100	];
		bmem[	26	]=hashout[	107	:	104	];
		bmem[	27	]=hashout[	111	:	108	];
		bmem[	28	]=hashout[	115	:	112	];
		bmem[	29	]=hashout[	119	:	116	];
		bmem[	30	]=hashout[	123	:	120	];
		bmem[	31	]=hashout[	127	:	124	];
		bmem[	32	]=hashout[	131	:	128	];
		bmem[	33	]=hashout[	135	:	132	];
		bmem[	34	]=hashout[	139	:	136	];
		bmem[	35	]=hashout[	143	:	140	];
		bmem[	36	]=hashout[	147	:	144	];
		bmem[	37	]=hashout[	151	:	148	];
		bmem[	38	]=hashout[	155	:	152	];
		bmem[	39	]=hashout[	159	:	156	];
		bmem[	40	]=hashout[	163	:	160	];
		bmem[	41	]=hashout[	167	:	164	];
		bmem[	42	]=hashout[	171	:	168	];
		bmem[	43	]=hashout[	175	:	172	];
		bmem[	44	]=hashout[	179	:	176	];
		bmem[	45	]=hashout[	183	:	180	];
		bmem[	46	]=hashout[	187	:	184	];
		bmem[	47	]=hashout[	191	:	188	];
		bmem[	48	]=hashout[	195	:	192	];
		bmem[	49	]=hashout[	199	:	196	];
		bmem[	50	]=hashout[	203	:	200	];
		bmem[	51	]=hashout[	207	:	204	];
		bmem[	52	]=hashout[	211	:	208	];
		bmem[	53	]=hashout[	215	:	212	];
		bmem[	54	]=hashout[	219	:	216	];
		bmem[	55	]=hashout[	223	:	220	];
		bmem[	56	]=hashout[	227	:	224	];
		bmem[	57	]=hashout[	231	:	228	];
		bmem[	58	]=hashout[	235	:	232	];
		bmem[	59	]=hashout[	239	:	236	];
		bmem[	60	]=hashout[	243	:	240	];
		bmem[	61	]=hashout[	247	:	244	];
		bmem[	62	]=hashout[	251	:	248	];
		bmem[	63	]=hashout[	255	:	252	]; 
		
	end
	
	always @ (posedge clk) begin
   	
	for (j = 0; j < 4; j = j + 1)
			for (i = 0; i < 64; i = i + 1)
			begin
				k=255-(i+j*64);
				mem[i][j] = amem[k];
			end
	end
	
	
	always @ (posedge clk) begin	
			for (j = 0; j < 1; j = j + 1)
			for (i = 0; i < 64; i = i + 1)
			begin
				k=63-(i+j*64);
				mem[i][j+5] = bmem[k];
			end

	end
	
	assign index = mem[x][y];

endmodule