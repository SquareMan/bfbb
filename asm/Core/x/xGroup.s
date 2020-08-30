.include "macros.inc"

.section .text  # 0x8002CAA0 - 0x8002CF70

.global lbl_8002CAA0
lbl_8002CAA0:
/* 8002CAA0 000298A0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CAA4 000298A4  7C 08 02 A6 */	mflr r0
/* 8002CAA8 000298A8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CAAC 000298AC  48 00 00 15 */	bl func_8002CAC0
/* 8002CAB0 000298B0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CAB4 000298B4  7C 08 03 A6 */	mtlr r0
/* 8002CAB8 000298B8  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CABC 000298BC  4E 80 00 20 */	blr 

.global func_8002CAC0
func_8002CAC0:
/* 8002CAC0 000298C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CAC4 000298C4  7C 08 02 A6 */	mflr r0
/* 8002CAC8 000298C8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CACC 000298CC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002CAD0 000298D0  7C 7F 1B 78 */	mr r31, r3
/* 8002CAD4 000298D4  93 C1 00 08 */	stw r30, 8(r1)
/* 8002CAD8 000298D8  7C 9E 23 78 */	mr r30, r4
/* 8002CADC 000298DC  4B FD C9 25 */	bl func_80009400
/* 8002CAE0 000298E0  3C 60 80 03 */	lis r3, lbl_8002CC78@ha
/* 8002CAE4 000298E4  38 03 CC 78 */	addi r0, r3, lbl_8002CC78@l
/* 8002CAE8 000298E8  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8002CAEC 000298EC  93 DF 00 10 */	stw r30, 0x10(r31)
/* 8002CAF0 000298F0  88 1F 00 05 */	lbz r0, 5(r31)
/* 8002CAF4 000298F4  28 00 00 00 */	cmplwi r0, 0
/* 8002CAF8 000298F8  41 82 00 20 */	beq lbl_8002CB18
/* 8002CAFC 000298FC  A0 1E 00 08 */	lhz r0, 8(r30)
/* 8002CB00 00029900  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8002CB04 00029904  54 03 10 3A */	slwi r3, r0, 2
/* 8002CB08 00029908  38 03 00 0C */	addi r0, r3, 0xc
/* 8002CB0C 0002990C  7C 04 02 14 */	add r0, r4, r0
/* 8002CB10 00029910  90 1F 00 08 */	stw r0, 8(r31)
/* 8002CB14 00029914  48 00 00 0C */	b lbl_8002CB20
lbl_8002CB18:
/* 8002CB18 00029918  38 00 00 00 */	li r0, 0
/* 8002CB1C 0002991C  90 1F 00 08 */	stw r0, 8(r31)
lbl_8002CB20:
/* 8002CB20 00029920  7F E3 FB 78 */	mr r3, r31
/* 8002CB24 00029924  48 00 03 59 */	bl func_8002CE7C
/* 8002CB28 00029928  7C 60 1B 79 */	or. r0, r3, r3
/* 8002CB2C 0002992C  41 82 00 18 */	beq lbl_8002CB44
/* 8002CB30 00029930  80 6D 89 E0 */	lwz r3, lbl_803CB2E0-_SDA_BASE_(r13)
/* 8002CB34 00029934  54 04 10 3A */	slwi r4, r0, 2
/* 8002CB38 00029938  38 A0 00 00 */	li r5, 0
/* 8002CB3C 0002993C  48 00 6E 05 */	bl func_80033940
/* 8002CB40 00029940  48 00 00 08 */	b lbl_8002CB48
lbl_8002CB44:
/* 8002CB44 00029944  38 60 00 00 */	li r3, 0
lbl_8002CB48:
/* 8002CB48 00029948  90 7F 00 14 */	stw r3, 0x14(r31)
/* 8002CB4C 0002994C  38 00 00 00 */	li r0, 0
/* 8002CB50 00029950  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8002CB54 00029954  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8002CB58 00029958  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002CB5C 0002995C  83 C1 00 08 */	lwz r30, 8(r1)
/* 8002CB60 00029960  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CB64 00029964  7C 08 03 A6 */	mtlr r0
/* 8002CB68 00029968  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CB6C 0002996C  4E 80 00 20 */	blr 

.global func_8002CB70
func_8002CB70:
/* 8002CB70 00029970  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8002CB74 00029974  7C 08 02 A6 */	mflr r0
/* 8002CB78 00029978  90 01 00 24 */	stw r0, 0x24(r1)
/* 8002CB7C 0002997C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8002CB80 00029980  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8002CB84 00029984  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8002CB88 00029988  93 81 00 10 */	stw r28, 0x10(r1)
/* 8002CB8C 0002998C  7C 7C 1B 78 */	mr r28, r3
/* 8002CB90 00029990  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 8002CB94 00029994  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8002CB98 00029998  40 82 00 48 */	bne lbl_8002CBE0
/* 8002CB9C 0002999C  48 00 02 E1 */	bl func_8002CE7C
/* 8002CBA0 000299A0  7C 7F 1B 78 */	mr r31, r3
/* 8002CBA4 000299A4  3B A0 00 00 */	li r29, 0
/* 8002CBA8 000299A8  3B C0 00 00 */	li r30, 0
/* 8002CBAC 000299AC  48 00 00 20 */	b lbl_8002CBCC
lbl_8002CBB0:
/* 8002CBB0 000299B0  7F 83 E3 78 */	mr r3, r28
/* 8002CBB4 000299B4  7F A4 EB 78 */	mr r4, r29
/* 8002CBB8 000299B8  48 00 03 31 */	bl func_8002CEE8
/* 8002CBBC 000299BC  80 9C 00 14 */	lwz r4, 0x14(r28)
/* 8002CBC0 000299C0  3B BD 00 01 */	addi r29, r29, 1
/* 8002CBC4 000299C4  7C 64 F1 2E */	stwx r3, r4, r30
/* 8002CBC8 000299C8  3B DE 00 04 */	addi r30, r30, 4
lbl_8002CBCC:
/* 8002CBCC 000299CC  7C 1D F8 40 */	cmplw r29, r31
/* 8002CBD0 000299D0  41 80 FF E0 */	blt lbl_8002CBB0
/* 8002CBD4 000299D4  80 1C 00 1C */	lwz r0, 0x1c(r28)
/* 8002CBD8 000299D8  60 00 00 01 */	ori r0, r0, 1
/* 8002CBDC 000299DC  90 1C 00 1C */	stw r0, 0x1c(r28)
lbl_8002CBE0:
/* 8002CBE0 000299E0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8002CBE4 000299E4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8002CBE8 000299E8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8002CBEC 000299EC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8002CBF0 000299F0  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8002CBF4 000299F4  7C 08 03 A6 */	mtlr r0
/* 8002CBF8 000299F8  38 21 00 20 */	addi r1, r1, 0x20
/* 8002CBFC 000299FC  4E 80 00 20 */	blr 

.global func_8002CC00
func_8002CC00:
/* 8002CC00 00029A00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CC04 00029A04  7C 08 02 A6 */	mflr r0
/* 8002CC08 00029A08  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CC0C 00029A0C  4B FD C8 41 */	bl func_8000944C
/* 8002CC10 00029A10  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CC14 00029A14  7C 08 03 A6 */	mtlr r0
/* 8002CC18 00029A18  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CC1C 00029A1C  4E 80 00 20 */	blr 

.global func_8002CC20
func_8002CC20:
/* 8002CC20 00029A20  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CC24 00029A24  7C 08 02 A6 */	mflr r0
/* 8002CC28 00029A28  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CC2C 00029A2C  4B FD C8 71 */	bl func_8000949C
/* 8002CC30 00029A30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CC34 00029A34  7C 08 03 A6 */	mtlr r0
/* 8002CC38 00029A38  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CC3C 00029A3C  4E 80 00 20 */	blr 

.global func_8002CC40
func_8002CC40:
/* 8002CC40 00029A40  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CC44 00029A44  7C 08 02 A6 */	mflr r0
/* 8002CC48 00029A48  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CC4C 00029A4C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002CC50 00029A50  7C 7F 1B 78 */	mr r31, r3
/* 8002CC54 00029A54  80 83 00 10 */	lwz r4, 0x10(r3)
/* 8002CC58 00029A58  4B FD C8 A1 */	bl func_800094F8
/* 8002CC5C 00029A5C  38 00 00 00 */	li r0, 0
/* 8002CC60 00029A60  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8002CC64 00029A64  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CC68 00029A68  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002CC6C 00029A6C  7C 08 03 A6 */	mtlr r0
/* 8002CC70 00029A70  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CC74 00029A74  4E 80 00 20 */	blr 
lbl_8002CC78:
/* 8002CC78 00029A78  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8002CC7C 00029A7C  7C 08 02 A6 */	mflr r0
/* 8002CC80 00029A80  90 01 00 34 */	stw r0, 0x34(r1)
/* 8002CC84 00029A84  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8002CC88 00029A88  7C BB 2B 78 */	mr r27, r5
/* 8002CC8C 00029A8C  2C 1B 01 06 */	cmpwi r27, 0x106
/* 8002CC90 00029A90  7C DC 33 78 */	mr r28, r6
/* 8002CC94 00029A94  7C FD 3B 78 */	mr r29, r7
/* 8002CC98 00029A98  7C 9F 23 78 */	mr r31, r4
/* 8002CC9C 00029A9C  41 82 00 20 */	beq lbl_8002CCBC
/* 8002CCA0 00029AA0  40 80 00 20 */	bge lbl_8002CCC0
/* 8002CCA4 00029AA4  2C 1B 00 0A */	cmpwi r27, 0xa
/* 8002CCA8 00029AA8  41 82 00 08 */	beq lbl_8002CCB0
/* 8002CCAC 00029AAC  48 00 00 14 */	b lbl_8002CCC0
lbl_8002CCB0:
/* 8002CCB0 00029AB0  7F E3 FB 78 */	mr r3, r31
/* 8002CCB4 00029AB4  4B FF FF 8D */	bl func_8002CC40
/* 8002CCB8 00029AB8  48 00 00 08 */	b lbl_8002CCC0
lbl_8002CCBC:
/* 8002CCBC 00029ABC  3B 60 00 02 */	li r27, 2
lbl_8002CCC0:
/* 8002CCC0 00029AC0  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8002CCC4 00029AC4  3B C0 FF FF */	li r30, -1
/* 8002CCC8 00029AC8  A0 64 00 0A */	lhz r3, 0xa(r4)
/* 8002CCCC 00029ACC  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8002CCD0 00029AD0  41 82 00 20 */	beq lbl_8002CCF0
/* 8002CCD4 00029AD4  48 00 3F 95 */	bl func_80030C68
/* 8002CCD8 00029AD8  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8002CCDC 00029ADC  A0 84 00 08 */	lhz r4, 8(r4)
/* 8002CCE0 00029AE0  7C 03 23 96 */	divwu r0, r3, r4
/* 8002CCE4 00029AE4  7C 00 21 D6 */	mullw r0, r0, r4
/* 8002CCE8 00029AE8  7F C0 18 50 */	subf r30, r0, r3
/* 8002CCEC 00029AEC  48 00 00 2C */	b lbl_8002CD18
lbl_8002CCF0:
/* 8002CCF0 00029AF0  54 60 07 BD */	rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 8002CCF4 00029AF4  41 82 00 24 */	beq lbl_8002CD18
/* 8002CCF8 00029AF8  80 BF 00 18 */	lwz r5, 0x18(r31)
/* 8002CCFC 00029AFC  A0 64 00 08 */	lhz r3, 8(r4)
/* 8002CD00 00029B00  38 85 00 01 */	addi r4, r5, 1
/* 8002CD04 00029B04  7C BE 2B 78 */	mr r30, r5
/* 8002CD08 00029B08  7C 04 1B 96 */	divwu r0, r4, r3
/* 8002CD0C 00029B0C  7C 00 19 D6 */	mullw r0, r0, r3
/* 8002CD10 00029B10  7C 00 20 50 */	subf r0, r0, r4
/* 8002CD14 00029B14  90 1F 00 18 */	stw r0, 0x18(r31)
lbl_8002CD18:
/* 8002CD18 00029B18  2C 1B 01 F8 */	cmpwi r27, 0x1f8
/* 8002CD1C 00029B1C  41 82 00 84 */	beq lbl_8002CDA0
/* 8002CD20 00029B20  40 80 00 F0 */	bge lbl_8002CE10
/* 8002CD24 00029B24  2C 1B 01 F7 */	cmpwi r27, 0x1f7
/* 8002CD28 00029B28  40 80 00 08 */	bge lbl_8002CD30
/* 8002CD2C 00029B2C  48 00 00 E4 */	b lbl_8002CE10
lbl_8002CD30:
/* 8002CD30 00029B30  3B 20 00 00 */	li r25, 0
/* 8002CD34 00029B34  3B 40 00 00 */	li r26, 0
/* 8002CD38 00029B38  48 00 00 50 */	b lbl_8002CD88
lbl_8002CD3C:
/* 8002CD3C 00029B3C  2C 1E FF FF */	cmpwi r30, -1
/* 8002CD40 00029B40  41 82 00 0C */	beq lbl_8002CD4C
/* 8002CD44 00029B44  7C 1E C8 00 */	cmpw r30, r25
/* 8002CD48 00029B48  40 82 00 38 */	bne lbl_8002CD80
lbl_8002CD4C:
/* 8002CD4C 00029B4C  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8002CD50 00029B50  7C 63 D0 2E */	lwzx r3, r3, r26
/* 8002CD54 00029B54  28 03 00 00 */	cmplwi r3, 0
/* 8002CD58 00029B58  41 82 00 28 */	beq lbl_8002CD80
/* 8002CD5C 00029B5C  A0 03 00 06 */	lhz r0, 6(r3)
/* 8002CD60 00029B60  54 00 06 B5 */	rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 8002CD64 00029B64  41 82 00 0C */	beq lbl_8002CD70
/* 8002CD68 00029B68  4B FE EA 91 */	bl func_8001B7F8
/* 8002CD6C 00029B6C  48 00 00 14 */	b lbl_8002CD80
lbl_8002CD70:
/* 8002CD70 00029B70  7F 64 DB 78 */	mr r4, r27
/* 8002CD74 00029B74  7F 85 E3 78 */	mr r5, r28
/* 8002CD78 00029B78  7F A6 EB 78 */	mr r6, r29
/* 8002CD7C 00029B7C  4B FF 29 29 */	bl func_8001F6A4
lbl_8002CD80:
/* 8002CD80 00029B80  3B 5A 00 04 */	addi r26, r26, 4
/* 8002CD84 00029B84  3B 39 00 01 */	addi r25, r25, 1
lbl_8002CD88:
/* 8002CD88 00029B88  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8002CD8C 00029B8C  A0 03 00 08 */	lhz r0, 8(r3)
/* 8002CD90 00029B90  7C 19 00 00 */	cmpw r25, r0
/* 8002CD94 00029B94  41 80 FF A8 */	blt lbl_8002CD3C
/* 8002CD98 00029B98  38 60 00 01 */	li r3, 1
/* 8002CD9C 00029B9C  48 00 00 CC */	b lbl_8002CE68
lbl_8002CDA0:
/* 8002CDA0 00029BA0  3B 20 00 00 */	li r25, 0
/* 8002CDA4 00029BA4  3B 40 00 00 */	li r26, 0
/* 8002CDA8 00029BA8  48 00 00 50 */	b lbl_8002CDF8
lbl_8002CDAC:
/* 8002CDAC 00029BAC  2C 1E FF FF */	cmpwi r30, -1
/* 8002CDB0 00029BB0  41 82 00 0C */	beq lbl_8002CDBC
/* 8002CDB4 00029BB4  7C 1E C8 00 */	cmpw r30, r25
/* 8002CDB8 00029BB8  40 82 00 38 */	bne lbl_8002CDF0
lbl_8002CDBC:
/* 8002CDBC 00029BBC  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8002CDC0 00029BC0  7C 63 D0 2E */	lwzx r3, r3, r26
/* 8002CDC4 00029BC4  28 03 00 00 */	cmplwi r3, 0
/* 8002CDC8 00029BC8  41 82 00 28 */	beq lbl_8002CDF0
/* 8002CDCC 00029BCC  A0 03 00 06 */	lhz r0, 6(r3)
/* 8002CDD0 00029BD0  54 00 06 B5 */	rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 8002CDD4 00029BD4  41 82 00 0C */	beq lbl_8002CDE0
/* 8002CDD8 00029BD8  4B FE EA 11 */	bl func_8001B7E8
/* 8002CDDC 00029BDC  48 00 00 14 */	b lbl_8002CDF0
lbl_8002CDE0:
/* 8002CDE0 00029BE0  7F 64 DB 78 */	mr r4, r27
/* 8002CDE4 00029BE4  7F 85 E3 78 */	mr r5, r28
/* 8002CDE8 00029BE8  7F A6 EB 78 */	mr r6, r29
/* 8002CDEC 00029BEC  4B FF 28 B9 */	bl func_8001F6A4
lbl_8002CDF0:
/* 8002CDF0 00029BF0  3B 5A 00 04 */	addi r26, r26, 4
/* 8002CDF4 00029BF4  3B 39 00 01 */	addi r25, r25, 1
lbl_8002CDF8:
/* 8002CDF8 00029BF8  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8002CDFC 00029BFC  A0 03 00 08 */	lhz r0, 8(r3)
/* 8002CE00 00029C00  7C 19 00 00 */	cmpw r25, r0
/* 8002CE04 00029C04  41 80 FF A8 */	blt lbl_8002CDAC
/* 8002CE08 00029C08  38 60 00 01 */	li r3, 1
/* 8002CE0C 00029C0C  48 00 00 5C */	b lbl_8002CE68
lbl_8002CE10:
/* 8002CE10 00029C10  3B 20 00 00 */	li r25, 0
/* 8002CE14 00029C14  3B 40 00 00 */	li r26, 0
/* 8002CE18 00029C18  48 00 00 3C */	b lbl_8002CE54
lbl_8002CE1C:
/* 8002CE1C 00029C1C  2C 1E FF FF */	cmpwi r30, -1
/* 8002CE20 00029C20  41 82 00 0C */	beq lbl_8002CE2C
/* 8002CE24 00029C24  7C 1E C8 00 */	cmpw r30, r25
/* 8002CE28 00029C28  40 82 00 24 */	bne lbl_8002CE4C
lbl_8002CE2C:
/* 8002CE2C 00029C2C  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8002CE30 00029C30  7C 63 D0 2E */	lwzx r3, r3, r26
/* 8002CE34 00029C34  28 03 00 00 */	cmplwi r3, 0
/* 8002CE38 00029C38  41 82 00 14 */	beq lbl_8002CE4C
/* 8002CE3C 00029C3C  7F 64 DB 78 */	mr r4, r27
/* 8002CE40 00029C40  7F 85 E3 78 */	mr r5, r28
/* 8002CE44 00029C44  7F A6 EB 78 */	mr r6, r29
/* 8002CE48 00029C48  4B FF 28 5D */	bl func_8001F6A4
lbl_8002CE4C:
/* 8002CE4C 00029C4C  3B 5A 00 04 */	addi r26, r26, 4
/* 8002CE50 00029C50  3B 39 00 01 */	addi r25, r25, 1
lbl_8002CE54:
/* 8002CE54 00029C54  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8002CE58 00029C58  A0 03 00 08 */	lhz r0, 8(r3)
/* 8002CE5C 00029C5C  7C 19 00 00 */	cmpw r25, r0
/* 8002CE60 00029C60  41 80 FF BC */	blt lbl_8002CE1C
/* 8002CE64 00029C64  38 60 00 01 */	li r3, 1
lbl_8002CE68:
/* 8002CE68 00029C68  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 8002CE6C 00029C6C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8002CE70 00029C70  7C 08 03 A6 */	mtlr r0
/* 8002CE74 00029C74  38 21 00 30 */	addi r1, r1, 0x30
/* 8002CE78 00029C78  4E 80 00 20 */	blr 

.global func_8002CE7C
func_8002CE7C:
/* 8002CE7C 00029C7C  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8002CE80 00029C80  A0 63 00 08 */	lhz r3, 8(r3)
/* 8002CE84 00029C84  4E 80 00 20 */	blr 

.global func_8002CE88
func_8002CE88:
/* 8002CE88 00029C88  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CE8C 00029C8C  7C 08 02 A6 */	mflr r0
/* 8002CE90 00029C90  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CE94 00029C94  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002CE98 00029C98  7C 9F 23 78 */	mr r31, r4
/* 8002CE9C 00029C9C  93 C1 00 08 */	stw r30, 8(r1)
/* 8002CEA0 00029CA0  7C 7E 1B 78 */	mr r30, r3
/* 8002CEA4 00029CA4  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 8002CEA8 00029CA8  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8002CEAC 00029CAC  40 82 00 08 */	bne lbl_8002CEB4
/* 8002CEB0 00029CB0  4B FF FC C1 */	bl func_8002CB70
lbl_8002CEB4:
/* 8002CEB4 00029CB4  80 7E 00 14 */	lwz r3, 0x14(r30)
/* 8002CEB8 00029CB8  28 03 00 00 */	cmplwi r3, 0
/* 8002CEBC 00029CBC  41 82 00 10 */	beq lbl_8002CECC
/* 8002CEC0 00029CC0  57 E0 10 3A */	slwi r0, r31, 2
/* 8002CEC4 00029CC4  7C 63 00 2E */	lwzx r3, r3, r0
/* 8002CEC8 00029CC8  48 00 00 08 */	b lbl_8002CED0
lbl_8002CECC:
/* 8002CECC 00029CCC  38 60 00 00 */	li r3, 0
lbl_8002CED0:
/* 8002CED0 00029CD0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CED4 00029CD4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002CED8 00029CD8  83 C1 00 08 */	lwz r30, 8(r1)
/* 8002CEDC 00029CDC  7C 08 03 A6 */	mtlr r0
/* 8002CEE0 00029CE0  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CEE4 00029CE4  4E 80 00 20 */	blr 

.global func_8002CEE8
func_8002CEE8:
/* 8002CEE8 00029CE8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002CEEC 00029CEC  7C 08 02 A6 */	mflr r0
/* 8002CEF0 00029CF0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8002CEF4 00029CF4  54 80 10 3A */	slwi r0, r4, 2
/* 8002CEF8 00029CF8  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8002CEFC 00029CFC  7C 63 02 14 */	add r3, r3, r0
/* 8002CF00 00029D00  80 63 00 0C */	lwz r3, 0xc(r3)
/* 8002CF04 00029D04  48 08 7B 39 */	bl func_800B4A3C
/* 8002CF08 00029D08  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002CF0C 00029D0C  7C 08 03 A6 */	mtlr r0
/* 8002CF10 00029D10  38 21 00 10 */	addi r1, r1, 0x10
/* 8002CF14 00029D14  4E 80 00 20 */	blr 

.global func_8002CF18
func_8002CF18:
/* 8002CF18 00029D18  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8002CF1C 00029D1C  54 80 10 3A */	slwi r0, r4, 2
/* 8002CF20 00029D20  7C 63 02 14 */	add r3, r3, r0
/* 8002CF24 00029D24  80 63 00 0C */	lwz r3, 0xc(r3)
/* 8002CF28 00029D28  4E 80 00 20 */	blr 

.global func_8002CF2C
func_8002CF2C:
/* 8002CF2C 00029D2C  80 C3 00 10 */	lwz r6, 0x10(r3)
/* 8002CF30 00029D30  A0 E6 00 08 */	lhz r7, 8(r6)
/* 8002CF34 00029D34  28 07 00 00 */	cmplwi r7, 0
/* 8002CF38 00029D38  40 82 00 0C */	bne lbl_8002CF44
/* 8002CF3C 00029D3C  38 60 00 00 */	li r3, 0
/* 8002CF40 00029D40  4E 80 00 20 */	blr 
lbl_8002CF44:
/* 8002CF44 00029D44  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 8002CF48 00029D48  38 85 00 01 */	addi r4, r5, 1
/* 8002CF4C 00029D4C  54 A5 10 3A */	slwi r5, r5, 2
/* 8002CF50 00029D50  7C 04 3B 96 */	divwu r0, r4, r7
/* 8002CF54 00029D54  7C A6 2A 14 */	add r5, r6, r5
/* 8002CF58 00029D58  80 A5 00 0C */	lwz r5, 0xc(r5)
/* 8002CF5C 00029D5C  7C 00 39 D6 */	mullw r0, r0, r7
/* 8002CF60 00029D60  7C 00 20 50 */	subf r0, r0, r4
/* 8002CF64 00029D64  90 03 00 18 */	stw r0, 0x18(r3)
/* 8002CF68 00029D68  7C A3 2B 78 */	mr r3, r5
/* 8002CF6C 00029D6C  4E 80 00 20 */	blr 