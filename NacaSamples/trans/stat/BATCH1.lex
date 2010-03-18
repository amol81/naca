1:
1:[IDENTIFICATION][DIVISION][DOT]
2:[COMMENT: =================================================================]
3:[PROGRAM-ID][DOT][ID:BATCH1][DOT]
4:[AUTHOR][DOT][ID:XXXXXXXXX][DOT]
5:[DATE-WRITTEN][DOT](2008)[DOT]
7:[COMMENT: REMARKS.                   ]
8:[COMMENT: ]
9:[COMMENT:  Programme demo BATCH]
10:[COMMENT: ]
11:[COMMENT: ]
12:[ENVIRONMENT][DIVISION][DOT]
13:[COMMENT: =================================================================]
14:[CONFIGURATION][SECTION][DOT]
15:[COMMENT: -----------------------------------------------------------------]
16:[SOURCE-COMPUTER][DOT][ID:IBM-3081][DOT]
17:[OBJECT-COMPUTER][DOT][ID:IBM-3081][DOT]
19:[INPUT-OUTPUT][SECTION][DOT]
20:[COMMENT: -----------------------------------------------------------------]
21:[FILE-CONTROL][DOT]
22:[SELECT][ID:FILEIN][ASSIGN][TO][ID:UT-S-FILEIN][DOT]
23:[SELECT][ID:FILEOUT][ASSIGN][TO][ID:UT-S-FILEOUT][DOT]
24:[DATA][DIVISION][DOT]
25:[COMMENT: =================================================================]
26:[FILE][SECTION][DOT]
27:[COMMENT: -----------------------------------------------------------------]
28:[FD][ID:FILEIN]
29:[LABEL][RECORDS][STANDARD]
30:[BLOCK](0)
31:[RECORD](69)
32:[RECORDING][ID:F][DOT]
33:(01)[ID:FILEIN-Z][DOT]
34:(05)[ID:FILEIN-CODE][PIC][ID:X][LEFT_BRACKET](1)[RIGHT_BRACKET][DOT]
35:(05)[FILLER][PIC][ID:X][LEFT_BRACKET](68)[RIGHT_BRACKET][DOT]
37:[FD][ID:FILEOUT]
38:[LABEL][RECORDS][STANDARD]
39:[BLOCK](0)
40:[RECORD](69)
41:[RECORDING][ID:F][DOT]
42:(01)[ID:FILEOUT-Z][PIC][ID:X][LEFT_BRACKET](69)[RIGHT_BRACKET][DOT]
44:[WORKING-STORAGE][SECTION][DOT]
45:[COMMENT: ------------------------]
46:(77)[ID:CPT-IN][PIC][ID:S9][LEFT_BRACKET](7)[RIGHT_BRACKET][COMP-3][VALUE][ZERO][DOT]
47:(77)[ID:CPT-OUT][PIC][ID:S9][LEFT_BRACKET](7)[RIGHT_BRACKET][COMP-3][VALUE][ZERO][DOT]
49:(77)[ID:FIN-TRAIT][PIC][ID:X][VALUE][SPACE][DOT]
51:(01)[ID:SYS-TIME][PIC](9)[LEFT_BRACKET](8)[RIGHT_BRACKET][VALUE][ZEROS][DOT]
52:(01)[FILLER][REDEFINES][ID:SYS-TIME][DOT]
53:(03)[ID:SYS-TIME1][PIC](9)[LEFT_BRACKET](7)[RIGHT_BRACKET][DOT]
54:(03)[ID:SYS-TIME2][PIC](9)[DOT]
56:[COPY][ID:MSGZONE][DOT]
58:[COMMENT: ]
59:[PROCEDURE][DIVISION][DOT]
60:[COMMENT: =================================================================]
62:[OPEN][INPUT][ID:FILEIN]
63:[OUTPUT][ID:FILEOUT]
65:[ACCEPT][ID:SYS-TIME][FROM][TIME]
67:[DISPLAY]("DEBUG - TIME : ")[ID:SYS-TIME1]
69:[PERFORM][ID:READ-FILEIN]
71:[PERFORM][ID:TRAITEMENT][UNTIL][ID:FIN-TRAIT][EQUALS]("F")
73:[DISPLAY]("STAT FILEIN  - READ RECORDS   : ")
74:[ID:CPT-IN][UPON][CONSOLE][DOT]
75:[DISPLAY]("STAT FILEOUT - WRITE RECORDS  : ")
76:[ID:CPT-OUT][UPON][CONSOLE][DOT]
78:[CLOSE][ID:FILEIN]
79:[ID:FILEOUT]
81:[STOP][RUN][DOT][END_OF_BLOCK]
83:[ID:READ-FILEIN][DOT]
84:[COMMENT: -----------------------------------------------------------------]
85:[READ][ID:FILEIN]
86:[AT][END][MOVE]("F")[TO][ID:FIN-TRAIT][DOT][END_OF_BLOCK]
88:[ID:TRAITEMENT][DOT]
89:[COMMENT: -----------------------------------------------------------------]
90:[ADD](1)[TO][ID:CPT-IN]
91:[EVALUATE][ID:FILEIN-CODE]
92:[WHEN]("1")
93:[DISPLAY]("DEBUG 1 - ")[ID:FILEIN-Z]
94:[WRITE][ID:FILEOUT-Z][FROM][ID:FILEIN-Z]
95:[ADD](1)[TO][ID:CPT-OUT]
96:[WHEN]("2")
97:[MOVE]("0001")[TO][ID:MSG-NO]
98:[CALL]("CALLMSG")[USING][ID:MSG-ZONE]
99:[DISPLAY]("DEBUG 2 - ")[ID:MSG-TEXT]
100:[END-EVALUATE]
101:[PERFORM][ID:READ-FILEIN][DOT]