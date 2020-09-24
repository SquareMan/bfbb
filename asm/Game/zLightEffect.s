.include "macros.inc"

.section .text  # 0x8009E7F8 - 0x8009EC78

.global zLightEffectSet__FP7_zLighti
zLightEffectSet__FP7_zLighti:
/* 8009E7F8 0009B5F8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009E7FC 0009B5FC  7C 08 02 A6 */	mflr r0
/* 8009E800 0009B600  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009E804 0009B604  80 03 00 5C */	lwz r0, 0x5c(r3)
/* 8009E808 0009B608  28 00 00 00 */	cmplwi r0, 0
/* 8009E80C 0009B60C  41 82 00 2C */	beq lbl_8009E838
/* 8009E810 0009B610  90 83 00 60 */	stw r4, 0x60(r3)
/* 8009E814 0009B614  3C 80 80 29 */	lis r4, lbl_8028FB08@ha
/* 8009E818 0009B618  38 84 FB 08 */	addi r4, r4, lbl_8028FB08@l
/* 8009E81C 0009B61C  80 03 00 60 */	lwz r0, 0x60(r3)
/* 8009E820 0009B620  54 00 10 3A */	slwi r0, r0, 2
/* 8009E824 0009B624  7D 84 00 2E */	lwzx r12, r4, r0
/* 8009E828 0009B628  28 0C 00 00 */	cmplwi r12, 0
/* 8009E82C 0009B62C  41 82 00 0C */	beq lbl_8009E838
/* 8009E830 0009B630  7D 89 03 A6 */	mtctr r12
/* 8009E834 0009B634  4E 80 04 21 */	bctrl 
lbl_8009E838:
/* 8009E838 0009B638  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009E83C 0009B63C  7C 08 03 A6 */	mtlr r0
/* 8009E840 0009B640  38 21 00 10 */	addi r1, r1, 0x10
/* 8009E844 0009B644  4E 80 00 20 */	blr 

.global zLightOn__FP7_zLighti
zLightOn__FP7_zLighti:
/* 8009E848 0009B648  2C 04 00 00 */	cmpwi r4, 0
/* 8009E84C 0009B64C  41 82 00 14 */	beq lbl_8009E860
/* 8009E850 0009B650  80 03 00 10 */	lwz r0, 0x10(r3)
/* 8009E854 0009B654  60 00 00 01 */	ori r0, r0, 1
/* 8009E858 0009B658  90 03 00 10 */	stw r0, 0x10(r3)
/* 8009E85C 0009B65C  4E 80 00 20 */	blr 
lbl_8009E860:
/* 8009E860 0009B660  80 03 00 10 */	lwz r0, 0x10(r3)
/* 8009E864 0009B664  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 8009E868 0009B668  90 03 00 10 */	stw r0, 0x10(r3)
/* 8009E86C 0009B66C  4E 80 00 20 */	blr 

.global func_8009E870
func_8009E870:
/* 8009E870 0009B670  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009E874 0009B674  7C 08 02 A6 */	mflr r0
/* 8009E878 0009B678  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009E87C 0009B67C  48 14 79 65 */	bl rand
/* 8009E880 0009B680  54 63 04 3E */	clrlwi r3, r3, 0x10
/* 8009E884 0009B684  3C 00 43 30 */	lis r0, 0x4330
/* 8009E888 0009B688  90 01 00 08 */	stw r0, 8(r1)
/* 8009E88C 0009B68C  C8 42 91 E8 */	lfd f2, lbl_803CDB68-_SDA2_BASE_(r2)
/* 8009E890 0009B690  90 61 00 0C */	stw r3, 0xc(r1)
/* 8009E894 0009B694  C0 02 91 E0 */	lfs f0, lbl_803CDB60-_SDA2_BASE_(r2)
/* 8009E898 0009B698  C8 21 00 08 */	lfd f1, 8(r1)
/* 8009E89C 0009B69C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009E8A0 0009B6A0  EC 21 10 28 */	fsubs f1, f1, f2
/* 8009E8A4 0009B6A4  EC 21 00 24 */	fdivs f1, f1, f0
/* 8009E8A8 0009B6A8  7C 08 03 A6 */	mtlr r0
/* 8009E8AC 0009B6AC  38 21 00 10 */	addi r1, r1, 0x10
/* 8009E8B0 0009B6B0  4E 80 00 20 */	blr 
/* 8009E8B4 0009B6B4  4E 80 00 20 */	blr 
/* 8009E8B8 0009B6B8  4E 80 00 20 */	blr 
/* 8009E8BC 0009B6BC  4E 80 00 20 */	blr 
/* 8009E8C0 0009B6C0  4E 80 00 20 */	blr 
/* 8009E8C4 0009B6C4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009E8C8 0009B6C8  7C 08 02 A6 */	mflr r0
/* 8009E8CC 0009B6CC  38 80 00 01 */	li r4, 1
/* 8009E8D0 0009B6D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009E8D4 0009B6D4  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009E8D8 0009B6D8  80 A3 00 5C */	lwz r5, 0x5c(r3)
/* 8009E8DC 0009B6DC  D0 05 00 00 */	stfs f0, 0(r5)
/* 8009E8E0 0009B6E0  4B FF FF 69 */	bl zLightOn__FP7_zLighti
/* 8009E8E4 0009B6E4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009E8E8 0009B6E8  7C 08 03 A6 */	mtlr r0
/* 8009E8EC 0009B6EC  38 21 00 10 */	addi r1, r1, 0x10
/* 8009E8F0 0009B6F0  4E 80 00 20 */	blr 

.global func_8009E8F4
func_8009E8F4:
/* 8009E8F4 0009B6F4  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8009E8F8 0009B6F8  7C 08 02 A6 */	mflr r0
/* 8009E8FC 0009B6FC  90 01 00 44 */	stw r0, 0x44(r1)
/* 8009E900 0009B700  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 8009E904 0009B704  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 8009E908 0009B708  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 8009E90C 0009B70C  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 8009E910 0009B710  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8009E914 0009B714  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8009E918 0009B718  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8009E91C 0009B71C  7C 7D 1B 78 */	mr r29, r3
/* 8009E920 0009B720  FF C0 10 90 */	fmr f30, f2
/* 8009E924 0009B724  83 C3 00 5C */	lwz r30, 0x5c(r3)
/* 8009E928 0009B728  FF E0 18 90 */	fmr f31, f3
/* 8009E92C 0009B72C  3B FD 00 18 */	addi r31, r29, 0x18
/* 8009E930 0009B730  C0 1E 00 00 */	lfs f0, 0(r30)
/* 8009E934 0009B734  EC 00 08 28 */	fsubs f0, f0, f1
/* 8009E938 0009B738  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8009E93C 0009B73C  C0 3E 00 00 */	lfs f1, 0(r30)
/* 8009E940 0009B740  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009E944 0009B744  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009E948 0009B748  4C 40 13 82 */	cror 2, 0, 2
/* 8009E94C 0009B74C  40 82 01 00 */	bne lbl_8009EA4C
/* 8009E950 0009B750  4B FF FF 21 */	bl func_8009E870
/* 8009E954 0009B754  EC 1F 00 72 */	fmuls f0, f31, f1
/* 8009E958 0009B758  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8009E95C 0009B75C  C0 1E 00 00 */	lfs f0, 0(r30)
/* 8009E960 0009B760  EC 00 F0 2A */	fadds f0, f0, f30
/* 8009E964 0009B764  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8009E968 0009B768  4B FF FF 09 */	bl func_8009E870
/* 8009E96C 0009B76C  C0 42 91 F8 */	lfs f2, lbl_803CDB78-_SDA2_BASE_(r2)
/* 8009E970 0009B770  C0 02 91 F4 */	lfs f0, lbl_803CDB74-_SDA2_BASE_(r2)
/* 8009E974 0009B774  80 7D 00 14 */	lwz r3, 0x14(r29)
/* 8009E978 0009B778  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 8009E97C 0009B77C  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8009E980 0009B780  EC 00 08 28 */	fsubs f0, f0, f1
/* 8009E984 0009B784  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 8009E988 0009B788  4B FF FE E9 */	bl func_8009E870
/* 8009E98C 0009B78C  C0 42 91 F8 */	lfs f2, lbl_803CDB78-_SDA2_BASE_(r2)
/* 8009E990 0009B790  C0 02 91 F4 */	lfs f0, lbl_803CDB74-_SDA2_BASE_(r2)
/* 8009E994 0009B794  80 7D 00 14 */	lwz r3, 0x14(r29)
/* 8009E998 0009B798  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 8009E99C 0009B79C  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 8009E9A0 0009B7A0  EC 00 08 28 */	fsubs f0, f0, f1
/* 8009E9A4 0009B7A4  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8009E9A8 0009B7A8  4B FF FE C9 */	bl func_8009E870
/* 8009E9AC 0009B7AC  C0 42 91 F8 */	lfs f2, lbl_803CDB78-_SDA2_BASE_(r2)
/* 8009E9B0 0009B7B0  C0 02 91 F4 */	lfs f0, lbl_803CDB74-_SDA2_BASE_(r2)
/* 8009E9B4 0009B7B4  80 7D 00 14 */	lwz r3, 0x14(r29)
/* 8009E9B8 0009B7B8  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 8009E9BC 0009B7BC  C0 03 00 18 */	lfs f0, 0x18(r3)
/* 8009E9C0 0009B7C0  EC 00 08 28 */	fsubs f0, f0, f1
/* 8009E9C4 0009B7C4  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 8009E9C8 0009B7C8  C0 3F 00 1C */	lfs f1, 0x1c(r31)
/* 8009E9CC 0009B7CC  C0 02 91 FC */	lfs f0, lbl_803CDB7C-_SDA2_BASE_(r2)
/* 8009E9D0 0009B7D0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009E9D4 0009B7D4  40 81 00 0C */	ble lbl_8009E9E0
/* 8009E9D8 0009B7D8  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 8009E9DC 0009B7DC  48 00 00 14 */	b lbl_8009E9F0
lbl_8009E9E0:
/* 8009E9E0 0009B7E0  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009E9E4 0009B7E4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009E9E8 0009B7E8  40 80 00 08 */	bge lbl_8009E9F0
/* 8009E9EC 0009B7EC  D0 1F 00 1C */	stfs f0, 0x1c(r31)
lbl_8009E9F0:
/* 8009E9F0 0009B7F0  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 8009E9F4 0009B7F4  C0 02 91 FC */	lfs f0, lbl_803CDB7C-_SDA2_BASE_(r2)
/* 8009E9F8 0009B7F8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009E9FC 0009B7FC  40 81 00 0C */	ble lbl_8009EA08
/* 8009EA00 0009B800  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8009EA04 0009B804  48 00 00 14 */	b lbl_8009EA18
lbl_8009EA08:
/* 8009EA08 0009B808  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009EA0C 0009B80C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009EA10 0009B810  40 80 00 08 */	bge lbl_8009EA18
/* 8009EA14 0009B814  D0 1F 00 20 */	stfs f0, 0x20(r31)
lbl_8009EA18:
/* 8009EA18 0009B818  C0 3F 00 24 */	lfs f1, 0x24(r31)
/* 8009EA1C 0009B81C  C0 02 91 FC */	lfs f0, lbl_803CDB7C-_SDA2_BASE_(r2)
/* 8009EA20 0009B820  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009EA24 0009B824  40 81 00 0C */	ble lbl_8009EA30
/* 8009EA28 0009B828  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 8009EA2C 0009B82C  48 00 00 14 */	b lbl_8009EA40
lbl_8009EA30:
/* 8009EA30 0009B830  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009EA34 0009B834  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009EA38 0009B838  40 80 00 08 */	bge lbl_8009EA40
/* 8009EA3C 0009B83C  D0 1F 00 24 */	stfs f0, 0x24(r31)
lbl_8009EA40:
/* 8009EA40 0009B840  7F E3 FB 78 */	mr r3, r31
/* 8009EA44 0009B844  38 9F 00 1C */	addi r4, r31, 0x1c
/* 8009EA48 0009B848  48 02 62 E9 */	bl iLightSetColor__FP6iLightP8_xFColor
lbl_8009EA4C:
/* 8009EA4C 0009B84C  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 8009EA50 0009B850  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 8009EA54 0009B854  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 8009EA58 0009B858  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 8009EA5C 0009B85C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8009EA60 0009B860  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8009EA64 0009B864  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8009EA68 0009B868  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8009EA6C 0009B86C  7C 08 03 A6 */	mtlr r0
/* 8009EA70 0009B870  38 21 00 40 */	addi r1, r1, 0x40
/* 8009EA74 0009B874  4E 80 00 20 */	blr 
/* 8009EA78 0009B878  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009EA7C 0009B87C  7C 08 02 A6 */	mflr r0
/* 8009EA80 0009B880  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009EA84 0009B884  C0 42 92 00 */	lfs f2, lbl_803CDB80-_SDA2_BASE_(r2)
/* 8009EA88 0009B888  C0 62 91 F8 */	lfs f3, lbl_803CDB78-_SDA2_BASE_(r2)
/* 8009EA8C 0009B88C  4B FF FE 69 */	bl func_8009E8F4
/* 8009EA90 0009B890  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009EA94 0009B894  7C 08 03 A6 */	mtlr r0
/* 8009EA98 0009B898  38 21 00 10 */	addi r1, r1, 0x10
/* 8009EA9C 0009B89C  4E 80 00 20 */	blr 
/* 8009EAA0 0009B8A0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009EAA4 0009B8A4  7C 08 02 A6 */	mflr r0
/* 8009EAA8 0009B8A8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009EAAC 0009B8AC  C0 42 91 F8 */	lfs f2, lbl_803CDB78-_SDA2_BASE_(r2)
/* 8009EAB0 0009B8B0  C0 62 92 04 */	lfs f3, lbl_803CDB84-_SDA2_BASE_(r2)
/* 8009EAB4 0009B8B4  4B FF FE 41 */	bl func_8009E8F4
/* 8009EAB8 0009B8B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009EABC 0009B8BC  7C 08 03 A6 */	mtlr r0
/* 8009EAC0 0009B8C0  38 21 00 10 */	addi r1, r1, 0x10
/* 8009EAC4 0009B8C4  4E 80 00 20 */	blr 
/* 8009EAC8 0009B8C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009EACC 0009B8CC  7C 08 02 A6 */	mflr r0
/* 8009EAD0 0009B8D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009EAD4 0009B8D4  C0 42 91 F0 */	lfs f2, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009EAD8 0009B8D8  C0 62 91 F4 */	lfs f3, lbl_803CDB74-_SDA2_BASE_(r2)
/* 8009EADC 0009B8DC  4B FF FE 19 */	bl func_8009E8F4
/* 8009EAE0 0009B8E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009EAE4 0009B8E4  7C 08 03 A6 */	mtlr r0
/* 8009EAE8 0009B8E8  38 21 00 10 */	addi r1, r1, 0x10
/* 8009EAEC 0009B8EC  4E 80 00 20 */	blr 
/* 8009EAF0 0009B8F0  4E 80 00 20 */	blr 
/* 8009EAF4 0009B8F4  4E 80 00 20 */	blr 
/* 8009EAF8 0009B8F8  4E 80 00 20 */	blr 
/* 8009EAFC 0009B8FC  4E 80 00 20 */	blr 
/* 8009EB00 0009B900  4E 80 00 20 */	blr 
/* 8009EB04 0009B904  4E 80 00 20 */	blr 
/* 8009EB08 0009B908  4E 80 00 20 */	blr 
/* 8009EB0C 0009B90C  4E 80 00 20 */	blr 
/* 8009EB10 0009B910  4E 80 00 20 */	blr 
/* 8009EB14 0009B914  4E 80 00 20 */	blr 
/* 8009EB18 0009B918  4E 80 00 20 */	blr 
/* 8009EB1C 0009B91C  4E 80 00 20 */	blr 
/* 8009EB20 0009B920  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009EB24 0009B924  7C 08 02 A6 */	mflr r0
/* 8009EB28 0009B928  38 80 00 01 */	li r4, 1
/* 8009EB2C 0009B92C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8009EB30 0009B930  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009EB34 0009B934  80 A3 00 5C */	lwz r5, 0x5c(r3)
/* 8009EB38 0009B938  D0 05 00 00 */	stfs f0, 0(r5)
/* 8009EB3C 0009B93C  4B FF FD 0D */	bl zLightOn__FP7_zLighti
/* 8009EB40 0009B940  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009EB44 0009B944  7C 08 03 A6 */	mtlr r0
/* 8009EB48 0009B948  38 21 00 10 */	addi r1, r1, 0x10
/* 8009EB4C 0009B94C  4E 80 00 20 */	blr 

.global func_8009EB50
func_8009EB50:
/* 8009EB50 0009B950  FC 01 10 40 */	fcmpo cr0, f1, f2
/* 8009EB54 0009B954  40 81 00 18 */	ble lbl_8009EB6C
/* 8009EB58 0009B958  EC 21 18 28 */	fsubs f1, f1, f3
/* 8009EB5C 0009B95C  FC 01 10 40 */	fcmpo cr0, f1, f2
/* 8009EB60 0009B960  4C 80 00 20 */	bgelr 
/* 8009EB64 0009B964  FC 20 10 90 */	fmr f1, f2
/* 8009EB68 0009B968  4E 80 00 20 */	blr 
lbl_8009EB6C:
/* 8009EB6C 0009B96C  4C 80 00 20 */	bgelr 
/* 8009EB70 0009B970  EC 21 18 2A */	fadds f1, f1, f3
/* 8009EB74 0009B974  FC 01 10 40 */	fcmpo cr0, f1, f2
/* 8009EB78 0009B978  4C 81 00 20 */	blelr 
/* 8009EB7C 0009B97C  FC 20 10 90 */	fmr f1, f2
/* 8009EB80 0009B980  4E 80 00 20 */	blr 
/* 8009EB84 0009B984  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8009EB88 0009B988  7C 08 02 A6 */	mflr r0
/* 8009EB8C 0009B98C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8009EB90 0009B990  DB E1 00 10 */	stfd f31, 0x10(r1)
/* 8009EB94 0009B994  F3 E1 00 18 */	psq_st f31, 24(r1), 0, qr0
/* 8009EB98 0009B998  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8009EB9C 0009B99C  93 C1 00 08 */	stw r30, 8(r1)
/* 8009EBA0 0009B9A0  83 C3 00 5C */	lwz r30, 0x5c(r3)
/* 8009EBA4 0009B9A4  FF E0 08 90 */	fmr f31, f1
/* 8009EBA8 0009B9A8  3B E3 00 18 */	addi r31, r3, 0x18
/* 8009EBAC 0009B9AC  C0 1E 00 00 */	lfs f0, 0(r30)
/* 8009EBB0 0009B9B0  EC 00 F8 28 */	fsubs f0, f0, f31
/* 8009EBB4 0009B9B4  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8009EBB8 0009B9B8  C0 3E 00 00 */	lfs f1, 0(r30)
/* 8009EBBC 0009B9BC  C0 02 91 F0 */	lfs f0, lbl_803CDB70-_SDA2_BASE_(r2)
/* 8009EBC0 0009B9C0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8009EBC4 0009B9C4  4C 40 13 82 */	cror 2, 0, 2
/* 8009EBC8 0009B9C8  40 82 00 40 */	bne lbl_8009EC08
/* 8009EBCC 0009B9CC  C0 02 92 08 */	lfs f0, lbl_803CDB88-_SDA2_BASE_(r2)
/* 8009EBD0 0009B9D0  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8009EBD4 0009B9D4  4B FF FC 9D */	bl func_8009E870
/* 8009EBD8 0009B9D8  C0 02 92 0C */	lfs f0, lbl_803CDB8C-_SDA2_BASE_(r2)
/* 8009EBDC 0009B9DC  EC 00 00 72 */	fmuls f0, f0, f1
/* 8009EBE0 0009B9E0  D0 1E 00 04 */	stfs f0, 4(r30)
/* 8009EBE4 0009B9E4  4B FF FC 8D */	bl func_8009E870
/* 8009EBE8 0009B9E8  C0 42 92 14 */	lfs f2, lbl_803CDB94-_SDA2_BASE_(r2)
/* 8009EBEC 0009B9EC  C0 02 92 10 */	lfs f0, lbl_803CDB90-_SDA2_BASE_(r2)
/* 8009EBF0 0009B9F0  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 8009EBF4 0009B9F4  D0 1E 00 08 */	stfs f0, 8(r30)
/* 8009EBF8 0009B9F8  4B FF FC 79 */	bl func_8009E870
/* 8009EBFC 0009B9FC  C0 02 92 0C */	lfs f0, lbl_803CDB8C-_SDA2_BASE_(r2)
/* 8009EC00 0009BA00  EC 00 00 72 */	fmuls f0, f0, f1
/* 8009EC04 0009BA04  D0 1E 00 0C */	stfs f0, 0xc(r30)
lbl_8009EC08:
/* 8009EC08 0009BA08  C0 02 92 18 */	lfs f0, lbl_803CDB98-_SDA2_BASE_(r2)
/* 8009EC0C 0009BA0C  C0 3F 00 1C */	lfs f1, 0x1c(r31)
/* 8009EC10 0009BA10  EF E0 07 F2 */	fmuls f31, f0, f31
/* 8009EC14 0009BA14  C0 5E 00 04 */	lfs f2, 4(r30)
/* 8009EC18 0009BA18  FC 60 F8 90 */	fmr f3, f31
/* 8009EC1C 0009BA1C  4B FF FF 35 */	bl func_8009EB50
/* 8009EC20 0009BA20  D0 3F 00 1C */	stfs f1, 0x1c(r31)
/* 8009EC24 0009BA24  FC 60 F8 90 */	fmr f3, f31
/* 8009EC28 0009BA28  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 8009EC2C 0009BA2C  C0 5E 00 08 */	lfs f2, 8(r30)
/* 8009EC30 0009BA30  4B FF FF 21 */	bl func_8009EB50
/* 8009EC34 0009BA34  D0 3F 00 20 */	stfs f1, 0x20(r31)
/* 8009EC38 0009BA38  FC 60 F8 90 */	fmr f3, f31
/* 8009EC3C 0009BA3C  C0 3F 00 24 */	lfs f1, 0x24(r31)
/* 8009EC40 0009BA40  C0 5E 00 0C */	lfs f2, 0xc(r30)
/* 8009EC44 0009BA44  4B FF FF 0D */	bl func_8009EB50
/* 8009EC48 0009BA48  D0 3F 00 24 */	stfs f1, 0x24(r31)
/* 8009EC4C 0009BA4C  7F E3 FB 78 */	mr r3, r31
/* 8009EC50 0009BA50  38 9F 00 1C */	addi r4, r31, 0x1c
/* 8009EC54 0009BA54  48 02 60 DD */	bl iLightSetColor__FP6iLightP8_xFColor
/* 8009EC58 0009BA58  E3 E1 00 18 */	psq_l f31, 24(r1), 0, qr0
/* 8009EC5C 0009BA5C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8009EC60 0009BA60  CB E1 00 10 */	lfd f31, 0x10(r1)
/* 8009EC64 0009BA64  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8009EC68 0009BA68  83 C1 00 08 */	lwz r30, 8(r1)
/* 8009EC6C 0009BA6C  7C 08 03 A6 */	mtlr r0
/* 8009EC70 0009BA70  38 21 00 20 */	addi r1, r1, 0x20
/* 8009EC74 0009BA74  4E 80 00 20 */	blr 
