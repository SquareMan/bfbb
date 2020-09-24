.include "macros.inc"

.section .text  # 0x800A1D18 - 0x800A26A0

.global func_800A1D18
func_800A1D18:
/* 800A1D18 0009EB18  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800A1D1C 0009EB1C  7C 08 02 A6 */	mflr r0
/* 800A1D20 0009EB20  90 01 00 34 */	stw r0, 0x34(r1)
/* 800A1D24 0009EB24  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 800A1D28 0009EB28  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 800A1D2C 0009EB2C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800A1D30 0009EB30  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800A1D34 0009EB34  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800A1D38 0009EB38  93 81 00 10 */	stw r28, 0x10(r1)
/* 800A1D3C 0009EB3C  80 AD 90 14 */	lwz r5, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1D40 0009EB40  3C 80 80 2F */	lis r4, lbl_802EA990@ha
/* 800A1D44 0009EB44  38 84 A9 90 */	addi r4, r4, lbl_802EA990@l
/* 800A1D48 0009EB48  7C 7F 1B 78 */	mr r31, r3
/* 800A1D4C 0009EB4C  7C A9 03 A6 */	mtctr r5
/* 800A1D50 0009EB50  28 05 00 00 */	cmplwi r5, 0
/* 800A1D54 0009EB54  40 81 00 18 */	ble lbl_800A1D6C
lbl_800A1D58:
/* 800A1D58 0009EB58  80 04 00 08 */	lwz r0, 8(r4)
/* 800A1D5C 0009EB5C  7C 00 F8 40 */	cmplw r0, r31
/* 800A1D60 0009EB60  41 82 01 64 */	beq lbl_800A1EC4
/* 800A1D64 0009EB64  38 84 00 10 */	addi r4, r4, 0x10
/* 800A1D68 0009EB68  42 00 FF F0 */	bdnz lbl_800A1D58
lbl_800A1D6C:
/* 800A1D6C 0009EB6C  80 0D 90 08 */	lwz r0, lbl_803CB908-_SDA_BASE_(r13)
/* 800A1D70 0009EB70  38 C0 00 00 */	li r6, 0
/* 800A1D74 0009EB74  80 8D 90 0C */	lwz r4, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1D78 0009EB78  7C 09 03 A6 */	mtctr r0
/* 800A1D7C 0009EB7C  28 00 00 00 */	cmplwi r0, 0
/* 800A1D80 0009EB80  40 81 01 44 */	ble lbl_800A1EC4
lbl_800A1D84:
/* 800A1D84 0009EB84  80 64 00 00 */	lwz r3, 0(r4)
/* 800A1D88 0009EB88  28 03 00 00 */	cmplwi r3, 0
/* 800A1D8C 0009EB8C  41 82 01 2C */	beq lbl_800A1EB8
/* 800A1D90 0009EB90  80 63 00 00 */	lwz r3, 0(r3)
/* 800A1D94 0009EB94  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 800A1D98 0009EB98  80 63 00 04 */	lwz r3, 4(r3)
/* 800A1D9C 0009EB9C  7C 03 00 40 */	cmplw r3, r0
/* 800A1DA0 0009EBA0  40 82 01 18 */	bne lbl_800A1EB8
/* 800A1DA4 0009EBA4  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A1DA8 0009EBA8  3B 80 00 00 */	li r28, 0
/* 800A1DAC 0009EBAC  48 00 00 0C */	b lbl_800A1DB8
lbl_800A1DB0:
/* 800A1DB0 0009EBB0  80 63 00 00 */	lwz r3, 0(r3)
/* 800A1DB4 0009EBB4  3B 9C 00 01 */	addi r28, r28, 1
lbl_800A1DB8:
/* 800A1DB8 0009EBB8  28 03 00 00 */	cmplwi r3, 0
/* 800A1DBC 0009EBBC  40 82 FF F4 */	bne lbl_800A1DB0
/* 800A1DC0 0009EBC0  28 05 08 00 */	cmplwi r5, 0x800
/* 800A1DC4 0009EBC4  40 80 00 F4 */	bge lbl_800A1EB8
/* 800A1DC8 0009EBC8  80 7F 00 4C */	lwz r3, 0x4c(r31)
/* 800A1DCC 0009EBCC  7F FD FB 78 */	mr r29, r31
/* 800A1DD0 0009EBD0  C0 02 92 C4 */	lfs f0, lbl_803CDC44-_SDA2_BASE_(r2)
/* 800A1DD4 0009EBD4  C0 43 00 00 */	lfs f2, 0(r3)
/* 800A1DD8 0009EBD8  C0 23 00 04 */	lfs f1, 4(r3)
/* 800A1DDC 0009EBDC  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800A1DE0 0009EBE0  C0 63 00 08 */	lfs f3, 8(r3)
/* 800A1DE4 0009EBE4  EC 21 00 72 */	fmuls f1, f1, f1
/* 800A1DE8 0009EBE8  EC 63 00 F2 */	fmuls f3, f3, f3
/* 800A1DEC 0009EBEC  EC 22 08 2A */	fadds f1, f2, f1
/* 800A1DF0 0009EBF0  EF E3 08 2A */	fadds f31, f3, f1
/* 800A1DF4 0009EBF4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 800A1DF8 0009EBF8  40 80 00 08 */	bge lbl_800A1E00
/* 800A1DFC 0009EBFC  C3 E2 92 C0 */	lfs f31, lbl_803CDC40-_SDA2_BASE_(r2)
lbl_800A1E00:
/* 800A1E00 0009EC00  54 DE 28 34 */	slwi r30, r6, 5
/* 800A1E04 0009EC04  48 00 00 30 */	b lbl_800A1E34
lbl_800A1E08:
/* 800A1E08 0009EC08  80 6D 90 0C */	lwz r3, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1E0C 0009EC0C  38 03 00 04 */	addi r0, r3, 4
/* 800A1E10 0009EC10  7C 1E 04 2E */	lfsx f0, r30, r0
/* 800A1E14 0009EC14  EC 3F 00 32 */	fmuls f1, f31, f0
/* 800A1E18 0009EC18  4B F6 89 E5 */	bl func_8000A7FC
/* 800A1E1C 0009EC1C  D0 3D 00 2C */	stfs f1, 0x2c(r29)
/* 800A1E20 0009EC20  C0 3D 00 2C */	lfs f1, 0x2c(r29)
/* 800A1E24 0009EC24  C0 02 92 C8 */	lfs f0, lbl_803CDC48-_SDA2_BASE_(r2)
/* 800A1E28 0009EC28  EC 01 00 28 */	fsubs f0, f1, f0
/* 800A1E2C 0009EC2C  D0 1D 00 28 */	stfs f0, 0x28(r29)
/* 800A1E30 0009EC30  83 BD 00 00 */	lwz r29, 0(r29)
lbl_800A1E34:
/* 800A1E34 0009EC34  28 1D 00 00 */	cmplwi r29, 0
/* 800A1E38 0009EC38  40 82 FF D0 */	bne lbl_800A1E08
/* 800A1E3C 0009EC3C  80 0D 90 14 */	lwz r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1E40 0009EC40  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A1E44 0009EC44  38 63 A9 90 */	addi r3, r3, lbl_802EA990@l
/* 800A1E48 0009EC48  54 00 20 36 */	slwi r0, r0, 4
/* 800A1E4C 0009EC4C  7F 83 01 2E */	stwx r28, r3, r0
/* 800A1E50 0009EC50  7C 63 02 14 */	add r3, r3, r0
/* 800A1E54 0009EC54  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1E58 0009EC58  7C 80 F2 14 */	add r4, r0, r30
/* 800A1E5C 0009EC5C  90 83 00 04 */	stw r4, 4(r3)
/* 800A1E60 0009EC60  93 E3 00 08 */	stw r31, 8(r3)
/* 800A1E64 0009EC64  C0 24 00 04 */	lfs f1, 4(r4)
/* 800A1E68 0009EC68  4B F6 89 95 */	bl func_8000A7FC
/* 800A1E6C 0009EC6C  C0 02 92 CC */	lfs f0, lbl_803CDC4C-_SDA2_BASE_(r2)
/* 800A1E70 0009EC70  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1E74 0009EC74  EF E0 08 2A */	fadds f31, f0, f1
/* 800A1E78 0009EC78  7C 60 F2 14 */	add r3, r0, r30
/* 800A1E7C 0009EC7C  C0 23 00 04 */	lfs f1, 4(r3)
/* 800A1E80 0009EC80  4B F6 89 7D */	bl func_8000A7FC
/* 800A1E84 0009EC84  C0 02 92 CC */	lfs f0, lbl_803CDC4C-_SDA2_BASE_(r2)
/* 800A1E88 0009EC88  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A1E8C 0009EC8C  80 0D 90 14 */	lwz r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1E90 0009EC90  38 63 A9 90 */	addi r3, r3, lbl_802EA990@l
/* 800A1E94 0009EC94  EC 00 08 2A */	fadds f0, f0, f1
/* 800A1E98 0009EC98  54 00 20 36 */	slwi r0, r0, 4
/* 800A1E9C 0009EC9C  7C 63 02 14 */	add r3, r3, r0
/* 800A1EA0 0009ECA0  EC 00 07 F2 */	fmuls f0, f0, f31
/* 800A1EA4 0009ECA4  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800A1EA8 0009ECA8  80 6D 90 14 */	lwz r3, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1EAC 0009ECAC  38 03 00 01 */	addi r0, r3, 1
/* 800A1EB0 0009ECB0  90 0D 90 14 */	stw r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1EB4 0009ECB4  48 00 00 10 */	b lbl_800A1EC4
lbl_800A1EB8:
/* 800A1EB8 0009ECB8  38 84 00 20 */	addi r4, r4, 0x20
/* 800A1EBC 0009ECBC  38 C6 00 01 */	addi r6, r6, 1
/* 800A1EC0 0009ECC0  42 00 FE C4 */	bdnz lbl_800A1D84
lbl_800A1EC4:
/* 800A1EC4 0009ECC4  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 800A1EC8 0009ECC8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800A1ECC 0009ECCC  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 800A1ED0 0009ECD0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800A1ED4 0009ECD4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800A1ED8 0009ECD8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800A1EDC 0009ECDC  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800A1EE0 0009ECE0  7C 08 03 A6 */	mtlr r0
/* 800A1EE4 0009ECE4  38 21 00 30 */	addi r1, r1, 0x30
/* 800A1EE8 0009ECE8  4E 80 00 20 */	blr 
lbl_800A1EEC:
/* 800A1EEC 0009ECEC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800A1EF0 0009ECF0  7C 08 02 A6 */	mflr r0
/* 800A1EF4 0009ECF4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800A1EF8 0009ECF8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800A1EFC 0009ECFC  7C 7F 1B 78 */	mr r31, r3
/* 800A1F00 0009ED00  80 03 00 24 */	lwz r0, 0x24(r3)
/* 800A1F04 0009ED04  28 00 00 00 */	cmplwi r0, 0
/* 800A1F08 0009ED08  40 82 00 08 */	bne lbl_800A1F10
/* 800A1F0C 0009ED0C  48 00 00 3C */	b lbl_800A1F48
lbl_800A1F10:
/* 800A1F10 0009ED10  7C 03 03 78 */	mr r3, r0
/* 800A1F14 0009ED14  4B FF FE 05 */	bl func_800A1D18
/* 800A1F18 0009ED18  88 1F 00 04 */	lbz r0, 4(r31)
/* 800A1F1C 0009ED1C  28 00 00 1B */	cmplwi r0, 0x1b
/* 800A1F20 0009ED20  40 82 00 24 */	bne lbl_800A1F44
/* 800A1F24 0009ED24  80 7F 00 FC */	lwz r3, 0xfc(r31)
/* 800A1F28 0009ED28  28 03 00 00 */	cmplwi r3, 0
/* 800A1F2C 0009ED2C  41 82 00 08 */	beq lbl_800A1F34
/* 800A1F30 0009ED30  4B FF FD E9 */	bl func_800A1D18
lbl_800A1F34:
/* 800A1F34 0009ED34  80 7F 01 00 */	lwz r3, 0x100(r31)
/* 800A1F38 0009ED38  28 03 00 00 */	cmplwi r3, 0
/* 800A1F3C 0009ED3C  41 82 00 08 */	beq lbl_800A1F44
/* 800A1F40 0009ED40  4B FF FD D9 */	bl func_800A1D18
lbl_800A1F44:
/* 800A1F44 0009ED44  7F E3 FB 78 */	mr r3, r31
lbl_800A1F48:
/* 800A1F48 0009ED48  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800A1F4C 0009ED4C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800A1F50 0009ED50  7C 08 03 A6 */	mtlr r0
/* 800A1F54 0009ED54  38 21 00 10 */	addi r1, r1, 0x10
/* 800A1F58 0009ED58  4E 80 00 20 */	blr 

.global zLOD_Setup__Fv
zLOD_Setup__Fv:
/* 800A1F5C 0009ED5C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800A1F60 0009ED60  7C 08 02 A6 */	mflr r0
/* 800A1F64 0009ED64  3C 60 4C 4F */	lis r3, 0x4C4F4454@ha
/* 800A1F68 0009ED68  90 01 00 34 */	stw r0, 0x34(r1)
/* 800A1F6C 0009ED6C  38 00 00 00 */	li r0, 0
/* 800A1F70 0009ED70  38 63 44 54 */	addi r3, r3, 0x4C4F4454@l
/* 800A1F74 0009ED74  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800A1F78 0009ED78  90 0D 90 08 */	stw r0, lbl_803CB908-_SDA_BASE_(r13)
/* 800A1F7C 0009ED7C  90 0D 90 0C */	stw r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1F80 0009ED80  90 0D 90 14 */	stw r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A1F84 0009ED84  4B FA 98 95 */	bl xSTAssetCountByType__FUi
/* 800A1F88 0009ED88  7C 7D 1B 79 */	or. r29, r3, r3
/* 800A1F8C 0009ED8C  41 82 01 C4 */	beq lbl_800A2150
/* 800A1F90 0009ED90  3B 80 00 00 */	li r28, 0
/* 800A1F94 0009ED94  3F C0 4C 4F */	lis r30, 0x4c4f
/* 800A1F98 0009ED98  48 00 00 28 */	b lbl_800A1FC0
lbl_800A1F9C:
/* 800A1F9C 0009ED9C  7F 84 E3 78 */	mr r4, r28
/* 800A1FA0 0009EDA0  38 7E 44 54 */	addi r3, r30, 0x4454
/* 800A1FA4 0009EDA4  38 A1 00 08 */	addi r5, r1, 8
/* 800A1FA8 0009EDA8  4B FA 98 F9 */	bl xSTFindAssetByType__FUiiPUi
/* 800A1FAC 0009EDAC  80 8D 90 08 */	lwz r4, lbl_803CB908-_SDA_BASE_(r13)
/* 800A1FB0 0009EDB0  3B 9C 00 01 */	addi r28, r28, 1
/* 800A1FB4 0009EDB4  80 03 00 00 */	lwz r0, 0(r3)
/* 800A1FB8 0009EDB8  7C 04 02 14 */	add r0, r4, r0
/* 800A1FBC 0009EDBC  90 0D 90 08 */	stw r0, lbl_803CB908-_SDA_BASE_(r13)
lbl_800A1FC0:
/* 800A1FC0 0009EDC0  7C 1C E8 40 */	cmplw r28, r29
/* 800A1FC4 0009EDC4  41 80 FF D8 */	blt lbl_800A1F9C
/* 800A1FC8 0009EDC8  80 0D 90 08 */	lwz r0, lbl_803CB908-_SDA_BASE_(r13)
/* 800A1FCC 0009EDCC  28 00 00 00 */	cmplwi r0, 0
/* 800A1FD0 0009EDD0  41 82 01 80 */	beq lbl_800A2150
/* 800A1FD4 0009EDD4  80 6D 89 E0 */	lwz r3, lbl_803CB2E0-_SDA_BASE_(r13)
/* 800A1FD8 0009EDD8  54 04 28 34 */	slwi r4, r0, 5
/* 800A1FDC 0009EDDC  38 A0 00 00 */	li r5, 0
/* 800A1FE0 0009EDE0  4B F9 19 61 */	bl xMemAlloc__FUiUii
/* 800A1FE4 0009EDE4  90 6D 90 0C */	stw r3, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1FE8 0009EDE8  3B 80 00 00 */	li r28, 0
/* 800A1FEC 0009EDEC  3F E0 4C 4F */	lis r31, 0x4c4f
/* 800A1FF0 0009EDF0  83 6D 90 0C */	lwz r27, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A1FF4 0009EDF4  48 00 00 3C */	b lbl_800A2030
lbl_800A1FF8:
/* 800A1FF8 0009EDF8  7F 84 E3 78 */	mr r4, r28
/* 800A1FFC 0009EDFC  38 7F 44 54 */	addi r3, r31, 0x4454
/* 800A2000 0009EE00  38 A1 00 08 */	addi r5, r1, 8
/* 800A2004 0009EE04  4B FA 98 9D */	bl xSTFindAssetByType__FUiiPUi
/* 800A2008 0009EE08  7C 7E 1B 78 */	mr r30, r3
/* 800A200C 0009EE0C  7F 63 DB 78 */	mr r3, r27
/* 800A2010 0009EE10  80 1E 00 00 */	lwz r0, 0(r30)
/* 800A2014 0009EE14  38 9E 00 04 */	addi r4, r30, 4
/* 800A2018 0009EE18  54 05 28 34 */	slwi r5, r0, 5
/* 800A201C 0009EE1C  4B F6 15 25 */	bl memcpy
/* 800A2020 0009EE20  80 1E 00 00 */	lwz r0, 0(r30)
/* 800A2024 0009EE24  3B 9C 00 01 */	addi r28, r28, 1
/* 800A2028 0009EE28  54 00 28 34 */	slwi r0, r0, 5
/* 800A202C 0009EE2C  7F 7B 02 14 */	add r27, r27, r0
lbl_800A2030:
/* 800A2030 0009EE30  7C 1C E8 40 */	cmplw r28, r29
/* 800A2034 0009EE34  41 80 FF C4 */	blt lbl_800A1FF8
/* 800A2038 0009EE38  3B C0 00 00 */	li r30, 0
/* 800A203C 0009EE3C  7F DF F3 78 */	mr r31, r30
/* 800A2040 0009EE40  48 00 00 E0 */	b lbl_800A2120
lbl_800A2044:
/* 800A2044 0009EE44  80 6D 90 0C */	lwz r3, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A2048 0009EE48  38 1F 00 04 */	addi r0, r31, 4
/* 800A204C 0009EE4C  7C 03 04 2E */	lfsx f0, r3, r0
/* 800A2050 0009EE50  EC 00 00 32 */	fmuls f0, f0, f0
/* 800A2054 0009EE54  7C 03 05 2E */	stfsx f0, r3, r0
/* 800A2058 0009EE58  80 6D 90 0C */	lwz r3, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A205C 0009EE5C  7C 63 F8 2E */	lwzx r3, r3, r31
/* 800A2060 0009EE60  28 03 00 00 */	cmplwi r3, 0
/* 800A2064 0009EE64  41 82 00 30 */	beq lbl_800A2094
/* 800A2068 0009EE68  38 80 00 00 */	li r4, 0
/* 800A206C 0009EE6C  4B FA 96 A1 */	bl xSTFindAsset__FUiPUi
/* 800A2070 0009EE70  28 03 00 00 */	cmplwi r3, 0
/* 800A2074 0009EE74  41 82 00 14 */	beq lbl_800A2088
/* 800A2078 0009EE78  48 08 49 CD */	bl xModelBucket_GetBuckets__FP8RpAtomic
/* 800A207C 0009EE7C  80 8D 90 0C */	lwz r4, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A2080 0009EE80  7C 64 F9 2E */	stwx r3, r4, r31
/* 800A2084 0009EE84  48 00 00 10 */	b lbl_800A2094
lbl_800A2088:
/* 800A2088 0009EE88  80 6D 90 0C */	lwz r3, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A208C 0009EE8C  38 00 00 00 */	li r0, 0
/* 800A2090 0009EE90  7C 03 F9 2E */	stwx r0, r3, r31
lbl_800A2094:
/* 800A2094 0009EE94  3B 80 00 00 */	li r28, 0
/* 800A2098 0009EE98  3B A0 00 00 */	li r29, 0
lbl_800A209C:
/* 800A209C 0009EE9C  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A20A0 0009EEA0  7C 60 EA 14 */	add r3, r0, r29
/* 800A20A4 0009EEA4  38 03 00 08 */	addi r0, r3, 8
/* 800A20A8 0009EEA8  7C 7F 00 2E */	lwzx r3, r31, r0
/* 800A20AC 0009EEAC  28 03 00 00 */	cmplwi r3, 0
/* 800A20B0 0009EEB0  41 82 00 40 */	beq lbl_800A20F0
/* 800A20B4 0009EEB4  38 80 00 00 */	li r4, 0
/* 800A20B8 0009EEB8  4B FA 96 55 */	bl xSTFindAsset__FUiPUi
/* 800A20BC 0009EEBC  28 03 00 00 */	cmplwi r3, 0
/* 800A20C0 0009EEC0  41 82 00 1C */	beq lbl_800A20DC
/* 800A20C4 0009EEC4  48 08 49 81 */	bl xModelBucket_GetBuckets__FP8RpAtomic
/* 800A20C8 0009EEC8  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A20CC 0009EECC  7C 80 EA 14 */	add r4, r0, r29
/* 800A20D0 0009EED0  38 04 00 08 */	addi r0, r4, 8
/* 800A20D4 0009EED4  7C 7F 01 2E */	stwx r3, r31, r0
/* 800A20D8 0009EED8  48 00 00 18 */	b lbl_800A20F0
lbl_800A20DC:
/* 800A20DC 0009EEDC  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A20E0 0009EEE0  38 80 00 00 */	li r4, 0
/* 800A20E4 0009EEE4  7C 60 EA 14 */	add r3, r0, r29
/* 800A20E8 0009EEE8  38 03 00 08 */	addi r0, r3, 8
/* 800A20EC 0009EEEC  7C 9F 01 2E */	stwx r4, r31, r0
lbl_800A20F0:
/* 800A20F0 0009EEF0  80 0D 90 0C */	lwz r0, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A20F4 0009EEF4  3B 9C 00 01 */	addi r28, r28, 1
/* 800A20F8 0009EEF8  28 1C 00 03 */	cmplwi r28, 3
/* 800A20FC 0009EEFC  7C 60 EA 14 */	add r3, r0, r29
/* 800A2100 0009EF00  3B BD 00 04 */	addi r29, r29, 4
/* 800A2104 0009EF04  38 03 00 14 */	addi r0, r3, 0x14
/* 800A2108 0009EF08  7C 1F 04 2E */	lfsx f0, r31, r0
/* 800A210C 0009EF0C  EC 00 00 32 */	fmuls f0, f0, f0
/* 800A2110 0009EF10  7C 1F 05 2E */	stfsx f0, r31, r0
/* 800A2114 0009EF14  41 80 FF 88 */	blt lbl_800A209C
/* 800A2118 0009EF18  3B FF 00 20 */	addi r31, r31, 0x20
/* 800A211C 0009EF1C  3B DE 00 01 */	addi r30, r30, 1
lbl_800A2120:
/* 800A2120 0009EF20  80 0D 90 08 */	lwz r0, lbl_803CB908-_SDA_BASE_(r13)
/* 800A2124 0009EF24  7C 1E 00 40 */	cmplw r30, r0
/* 800A2128 0009EF28  41 80 FF 1C */	blt lbl_800A2044
/* 800A212C 0009EF2C  38 00 00 00 */	li r0, 0
/* 800A2130 0009EF30  3C 60 80 3C */	lis r3, lbl_803C0558@ha
/* 800A2134 0009EF34  90 0D 90 14 */	stw r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A2138 0009EF38  38 C3 05 58 */	addi r6, r3, lbl_803C0558@l
/* 800A213C 0009EF3C  3C 60 80 0A */	lis r3, lbl_800A1EEC@ha
/* 800A2140 0009EF40  38 A0 00 00 */	li r5, 0
/* 800A2144 0009EF44  38 83 1E EC */	addi r4, r3, lbl_800A1EEC@l
/* 800A2148 0009EF48  80 66 1F C0 */	lwz r3, 0x1fc0(r6)
/* 800A214C 0009EF4C  4B F9 D5 15 */	bl xSceneForAllEnts__FP6xScenePFP4xEntP6xScenePv_P4xEntPv
lbl_800A2150:
/* 800A2150 0009EF50  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800A2154 0009EF54  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800A2158 0009EF58  7C 08 03 A6 */	mtlr r0
/* 800A215C 0009EF5C  38 21 00 30 */	addi r1, r1, 0x30
/* 800A2160 0009EF60  4E 80 00 20 */	blr 

.global zLOD_Update__FUi
zLOD_Update__FUi:
/* 800A2164 0009EF64  80 0D 90 14 */	lwz r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A2168 0009EF68  3C 80 80 3C */	lis r4, lbl_803C0558@ha
/* 800A216C 0009EF6C  38 84 05 58 */	addi r4, r4, lbl_803C0558@l
/* 800A2170 0009EF70  28 00 00 00 */	cmplwi r0, 0
/* 800A2174 0009EF74  4D 82 00 20 */	beqlr 
/* 800A2178 0009EF78  7C 00 19 D6 */	mullw r0, r0, r3
/* 800A217C 0009EF7C  3C 60 51 EC */	lis r3, 0x51EB851F@ha
/* 800A2180 0009EF80  38 63 85 1F */	addi r3, r3, 0x51EB851F@l
/* 800A2184 0009EF84  7C 03 00 16 */	mulhwu r0, r3, r0
/* 800A2188 0009EF88  54 03 D9 7F */	rlwinm. r3, r0, 0x1b, 5, 0x1f
/* 800A218C 0009EF8C  7C 60 1B 78 */	mr r0, r3
/* 800A2190 0009EF90  40 82 00 08 */	bne lbl_800A2198
/* 800A2194 0009EF94  38 03 00 01 */	addi r0, r3, 1
lbl_800A2198:
/* 800A2198 0009EF98  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A219C 0009EF9C  38 C3 A9 90 */	addi r6, r3, lbl_802EA990@l
/* 800A21A0 0009EFA0  7C 09 03 A6 */	mtctr r0
/* 800A21A4 0009EFA4  28 00 00 00 */	cmplwi r0, 0
/* 800A21A8 0009EFA8  4D 82 00 20 */	beqlr 
lbl_800A21AC:
/* 800A21AC 0009EFAC  80 6D 90 10 */	lwz r3, lbl_803CB910-_SDA_BASE_(r13)
/* 800A21B0 0009EFB0  38 03 00 01 */	addi r0, r3, 1
/* 800A21B4 0009EFB4  90 0D 90 10 */	stw r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A21B8 0009EFB8  80 6D 90 10 */	lwz r3, lbl_803CB910-_SDA_BASE_(r13)
/* 800A21BC 0009EFBC  80 0D 90 14 */	lwz r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A21C0 0009EFC0  7C 03 00 40 */	cmplw r3, r0
/* 800A21C4 0009EFC4  41 80 00 0C */	blt lbl_800A21D0
/* 800A21C8 0009EFC8  38 00 00 00 */	li r0, 0
/* 800A21CC 0009EFCC  90 0D 90 10 */	stw r0, lbl_803CB910-_SDA_BASE_(r13)
lbl_800A21D0:
/* 800A21D0 0009EFD0  80 0D 90 10 */	lwz r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A21D4 0009EFD4  54 00 20 36 */	slwi r0, r0, 4
/* 800A21D8 0009EFD8  7C A6 02 14 */	add r5, r6, r0
/* 800A21DC 0009EFDC  81 05 00 04 */	lwz r8, 4(r5)
/* 800A21E0 0009EFE0  80 65 00 08 */	lwz r3, 8(r5)
/* 800A21E4 0009EFE4  28 08 00 00 */	cmplwi r8, 0
/* 800A21E8 0009EFE8  41 82 01 B8 */	beq lbl_800A23A0
/* 800A21EC 0009EFEC  80 E3 00 4C */	lwz r7, 0x4c(r3)
/* 800A21F0 0009EFF0  C0 02 92 C4 */	lfs f0, lbl_803CDC44-_SDA2_BASE_(r2)
/* 800A21F4 0009EFF4  C0 47 00 00 */	lfs f2, 0(r7)
/* 800A21F8 0009EFF8  C0 27 00 04 */	lfs f1, 4(r7)
/* 800A21FC 0009EFFC  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800A2200 0009F000  C0 67 00 08 */	lfs f3, 8(r7)
/* 800A2204 0009F004  EC 21 00 72 */	fmuls f1, f1, f1
/* 800A2208 0009F008  C0 82 92 D0 */	lfs f4, lbl_803CDC50-_SDA2_BASE_(r2)
/* 800A220C 0009F00C  EC 63 00 F2 */	fmuls f3, f3, f3
/* 800A2210 0009F010  EC 22 08 2A */	fadds f1, f2, f1
/* 800A2214 0009F014  EC A3 08 2A */	fadds f5, f3, f1
/* 800A2218 0009F018  FC 05 00 40 */	fcmpo cr0, f5, f0
/* 800A221C 0009F01C  40 80 00 08 */	bge lbl_800A2224
/* 800A2220 0009F020  C0 A2 92 C0 */	lfs f5, lbl_803CDC40-_SDA2_BASE_(r2)
lbl_800A2224:
/* 800A2224 0009F024  28 07 00 00 */	cmplwi r7, 0
/* 800A2228 0009F028  41 82 00 40 */	beq lbl_800A2268
/* 800A222C 0009F02C  C0 64 00 44 */	lfs f3, 0x44(r4)
/* 800A2230 0009F030  C0 47 00 30 */	lfs f2, 0x30(r7)
/* 800A2234 0009F034  C0 24 00 48 */	lfs f1, 0x48(r4)
/* 800A2238 0009F038  C0 07 00 34 */	lfs f0, 0x34(r7)
/* 800A223C 0009F03C  EC 83 10 28 */	fsubs f4, f3, f2
/* 800A2240 0009F040  C0 44 00 4C */	lfs f2, 0x4c(r4)
/* 800A2244 0009F044  EC 61 00 28 */	fsubs f3, f1, f0
/* 800A2248 0009F048  C0 07 00 38 */	lfs f0, 0x38(r7)
/* 800A224C 0009F04C  EC 24 01 32 */	fmuls f1, f4, f4
/* 800A2250 0009F050  EC 42 00 28 */	fsubs f2, f2, f0
/* 800A2254 0009F054  EC 03 00 F2 */	fmuls f0, f3, f3
/* 800A2258 0009F058  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800A225C 0009F05C  EC 01 00 2A */	fadds f0, f1, f0
/* 800A2260 0009F060  EC 02 00 2A */	fadds f0, f2, f0
/* 800A2264 0009F064  EC 80 28 24 */	fdivs f4, f0, f5
lbl_800A2268:
/* 800A2268 0009F068  C0 05 00 0C */	lfs f0, 0xc(r5)
/* 800A226C 0009F06C  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 800A2270 0009F070  4C 41 13 82 */	cror 2, 1, 2
/* 800A2274 0009F074  40 82 00 50 */	bne lbl_800A22C4
/* 800A2278 0009F078  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A227C 0009F07C  3C A0 80 2F */	lis r5, lbl_802EA990@ha
/* 800A2280 0009F080  38 A5 A9 90 */	addi r5, r5, lbl_802EA990@l
/* 800A2284 0009F084  60 00 04 00 */	ori r0, r0, 0x400
/* 800A2288 0009F088  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A228C 0009F08C  80 0D 90 10 */	lwz r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A2290 0009F090  54 00 20 36 */	slwi r0, r0, 4
/* 800A2294 0009F094  7C 05 00 2E */	lwzx r0, r5, r0
/* 800A2298 0009F098  2C 00 00 00 */	cmpwi r0, 0
/* 800A229C 0009F09C  41 82 01 04 */	beq lbl_800A23A0
/* 800A22A0 0009F0A0  80 63 00 00 */	lwz r3, 0(r3)
/* 800A22A4 0009F0A4  48 00 00 14 */	b lbl_800A22B8
lbl_800A22A8:
/* 800A22A8 0009F0A8  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A22AC 0009F0AC  60 00 04 00 */	ori r0, r0, 0x400
/* 800A22B0 0009F0B0  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A22B4 0009F0B4  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A22B8:
/* 800A22B8 0009F0B8  28 03 00 00 */	cmplwi r3, 0
/* 800A22BC 0009F0BC  40 82 FF EC */	bne lbl_800A22A8
/* 800A22C0 0009F0C0  48 00 00 E0 */	b lbl_800A23A0
lbl_800A22C4:
/* 800A22C4 0009F0C4  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A22C8 0009F0C8  39 20 00 00 */	li r9, 0
/* 800A22CC 0009F0CC  70 00 FB FF */	andi. r0, r0, 0xfbff
/* 800A22D0 0009F0D0  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A22D4 0009F0D4  80 08 00 00 */	lwz r0, 0(r8)
/* 800A22D8 0009F0D8  28 00 00 00 */	cmplwi r0, 0
/* 800A22DC 0009F0DC  41 82 00 18 */	beq lbl_800A22F4
/* 800A22E0 0009F0E0  90 03 00 34 */	stw r0, 0x34(r3)
/* 800A22E4 0009F0E4  80 A3 00 34 */	lwz r5, 0x34(r3)
/* 800A22E8 0009F0E8  80 A5 00 00 */	lwz r5, 0(r5)
/* 800A22EC 0009F0EC  80 05 00 04 */	lwz r0, 4(r5)
/* 800A22F0 0009F0F0  90 03 00 10 */	stw r0, 0x10(r3)
lbl_800A22F4:
/* 800A22F4 0009F0F4  7D 07 43 78 */	mr r7, r8
/* 800A22F8 0009F0F8  48 00 00 20 */	b lbl_800A2318
lbl_800A22FC:
/* 800A22FC 0009F0FC  90 03 00 34 */	stw r0, 0x34(r3)
/* 800A2300 0009F100  38 E7 00 04 */	addi r7, r7, 4
/* 800A2304 0009F104  39 29 00 01 */	addi r9, r9, 1
/* 800A2308 0009F108  80 A3 00 34 */	lwz r5, 0x34(r3)
/* 800A230C 0009F10C  80 A5 00 00 */	lwz r5, 0(r5)
/* 800A2310 0009F110  80 05 00 04 */	lwz r0, 4(r5)
/* 800A2314 0009F114  90 03 00 10 */	stw r0, 0x10(r3)
lbl_800A2318:
/* 800A2318 0009F118  2C 09 00 03 */	cmpwi r9, 3
/* 800A231C 0009F11C  40 80 00 1C */	bge lbl_800A2338
/* 800A2320 0009F120  80 07 00 08 */	lwz r0, 8(r7)
/* 800A2324 0009F124  28 00 00 00 */	cmplwi r0, 0
/* 800A2328 0009F128  41 82 00 10 */	beq lbl_800A2338
/* 800A232C 0009F12C  C0 07 00 14 */	lfs f0, 0x14(r7)
/* 800A2330 0009F130  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 800A2334 0009F134  41 81 FF C8 */	bgt lbl_800A22FC
lbl_800A2338:
/* 800A2338 0009F138  80 0D 90 10 */	lwz r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A233C 0009F13C  3C A0 80 2F */	lis r5, lbl_802EA990@ha
/* 800A2340 0009F140  38 A5 A9 90 */	addi r5, r5, lbl_802EA990@l
/* 800A2344 0009F144  54 00 20 36 */	slwi r0, r0, 4
/* 800A2348 0009F148  7C 05 00 2E */	lwzx r0, r5, r0
/* 800A234C 0009F14C  2C 00 00 00 */	cmpwi r0, 0
/* 800A2350 0009F150  41 82 00 50 */	beq lbl_800A23A0
/* 800A2354 0009F154  2C 09 00 00 */	cmpwi r9, 0
/* 800A2358 0009F158  40 82 00 28 */	bne lbl_800A2380
/* 800A235C 0009F15C  80 63 00 00 */	lwz r3, 0(r3)
/* 800A2360 0009F160  48 00 00 14 */	b lbl_800A2374
lbl_800A2364:
/* 800A2364 0009F164  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A2368 0009F168  70 00 FB FF */	andi. r0, r0, 0xfbff
/* 800A236C 0009F16C  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A2370 0009F170  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A2374:
/* 800A2374 0009F174  28 03 00 00 */	cmplwi r3, 0
/* 800A2378 0009F178  40 82 FF EC */	bne lbl_800A2364
/* 800A237C 0009F17C  48 00 00 24 */	b lbl_800A23A0
lbl_800A2380:
/* 800A2380 0009F180  80 63 00 00 */	lwz r3, 0(r3)
/* 800A2384 0009F184  48 00 00 14 */	b lbl_800A2398
lbl_800A2388:
/* 800A2388 0009F188  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A238C 0009F18C  60 00 04 00 */	ori r0, r0, 0x400
/* 800A2390 0009F190  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A2394 0009F194  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A2398:
/* 800A2398 0009F198  28 03 00 00 */	cmplwi r3, 0
/* 800A239C 0009F19C  40 82 FF EC */	bne lbl_800A2388
lbl_800A23A0:
/* 800A23A0 0009F1A0  42 00 FE 0C */	bdnz lbl_800A21AC
/* 800A23A4 0009F1A4  4E 80 00 20 */	blr 

.global zLOD_Get__FP4xEnt
zLOD_Get__FP4xEnt:
/* 800A23A8 0009F1A8  80 A3 00 24 */	lwz r5, 0x24(r3)
/* 800A23AC 0009F1AC  28 05 00 00 */	cmplwi r5, 0
/* 800A23B0 0009F1B0  40 82 00 0C */	bne lbl_800A23BC
/* 800A23B4 0009F1B4  38 60 00 00 */	li r3, 0
/* 800A23B8 0009F1B8  4E 80 00 20 */	blr 
lbl_800A23BC:
/* 800A23BC 0009F1BC  80 CD 90 0C */	lwz r6, lbl_803CB90C-_SDA_BASE_(r13)
/* 800A23C0 0009F1C0  38 E0 00 00 */	li r7, 0
/* 800A23C4 0009F1C4  80 0D 90 08 */	lwz r0, lbl_803CB908-_SDA_BASE_(r13)
/* 800A23C8 0009F1C8  7C C4 33 78 */	mr r4, r6
/* 800A23CC 0009F1CC  7C 09 03 A6 */	mtctr r0
/* 800A23D0 0009F1D0  28 00 00 00 */	cmplwi r0, 0
/* 800A23D4 0009F1D4  40 81 00 3C */	ble lbl_800A2410
lbl_800A23D8:
/* 800A23D8 0009F1D8  80 64 00 00 */	lwz r3, 0(r4)
/* 800A23DC 0009F1DC  28 03 00 00 */	cmplwi r3, 0
/* 800A23E0 0009F1E0  41 82 00 24 */	beq lbl_800A2404
/* 800A23E4 0009F1E4  80 63 00 00 */	lwz r3, 0(r3)
/* 800A23E8 0009F1E8  80 05 00 10 */	lwz r0, 0x10(r5)
/* 800A23EC 0009F1EC  80 63 00 04 */	lwz r3, 4(r3)
/* 800A23F0 0009F1F0  7C 03 00 40 */	cmplw r3, r0
/* 800A23F4 0009F1F4  40 82 00 10 */	bne lbl_800A2404
/* 800A23F8 0009F1F8  54 E0 28 34 */	slwi r0, r7, 5
/* 800A23FC 0009F1FC  7C 66 02 14 */	add r3, r6, r0
/* 800A2400 0009F200  4E 80 00 20 */	blr 
lbl_800A2404:
/* 800A2404 0009F204  38 84 00 20 */	addi r4, r4, 0x20
/* 800A2408 0009F208  38 E7 00 01 */	addi r7, r7, 1
/* 800A240C 0009F20C  42 00 FF CC */	bdnz lbl_800A23D8
lbl_800A2410:
/* 800A2410 0009F210  38 60 00 00 */	li r3, 0
/* 800A2414 0009F214  4E 80 00 20 */	blr 

.global zLOD_UseCustomTable__FP4xEntP9zLODTable
zLOD_UseCustomTable__FP4xEntP9zLODTable:
/* 800A2418 0009F218  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800A241C 0009F21C  7C 08 02 A6 */	mflr r0
/* 800A2420 0009F220  90 01 00 34 */	stw r0, 0x34(r1)
/* 800A2424 0009F224  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 800A2428 0009F228  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 800A242C 0009F22C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800A2430 0009F230  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800A2434 0009F234  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800A2438 0009F238  80 0D 90 14 */	lwz r0, lbl_803CB914-_SDA_BASE_(r13)
/* 800A243C 0009F23C  3C A0 80 2F */	lis r5, lbl_802EA990@ha
/* 800A2440 0009F240  7C 9E 23 78 */	mr r30, r4
/* 800A2444 0009F244  83 E3 00 24 */	lwz r31, 0x24(r3)
/* 800A2448 0009F248  38 A5 A9 90 */	addi r5, r5, lbl_802EA990@l
/* 800A244C 0009F24C  38 80 00 00 */	li r4, 0
/* 800A2450 0009F250  7C 09 03 A6 */	mtctr r0
/* 800A2454 0009F254  28 00 00 00 */	cmplwi r0, 0
/* 800A2458 0009F258  40 81 02 24 */	ble lbl_800A267C
lbl_800A245C:
/* 800A245C 0009F25C  80 05 00 08 */	lwz r0, 8(r5)
/* 800A2460 0009F260  7C 00 F8 40 */	cmplw r0, r31
/* 800A2464 0009F264  40 82 02 0C */	bne lbl_800A2670
/* 800A2468 0009F268  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A246C 0009F26C  54 9D 20 36 */	slwi r29, r4, 4
/* 800A2470 0009F270  38 03 A9 90 */	addi r0, r3, lbl_802EA990@l
/* 800A2474 0009F274  7C 60 EA 14 */	add r3, r0, r29
/* 800A2478 0009F278  93 C3 00 04 */	stw r30, 4(r3)
/* 800A247C 0009F27C  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800A2480 0009F280  4B F6 83 7D */	bl func_8000A7FC
/* 800A2484 0009F284  C0 02 92 CC */	lfs f0, lbl_803CDC4C-_SDA2_BASE_(r2)
/* 800A2488 0009F288  EF E0 08 2A */	fadds f31, f0, f1
/* 800A248C 0009F28C  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800A2490 0009F290  4B F6 83 6D */	bl func_8000A7FC
/* 800A2494 0009F294  C0 02 92 CC */	lfs f0, lbl_803CDC4C-_SDA2_BASE_(r2)
/* 800A2498 0009F298  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A249C 0009F29C  38 03 A9 90 */	addi r0, r3, lbl_802EA990@l
/* 800A24A0 0009F2A0  EC 00 08 2A */	fadds f0, f0, f1
/* 800A24A4 0009F2A4  3C 60 80 3C */	lis r3, lbl_803C0558@ha
/* 800A24A8 0009F2A8  7C A0 EA 14 */	add r5, r0, r29
/* 800A24AC 0009F2AC  38 63 05 58 */	addi r3, r3, lbl_803C0558@l
/* 800A24B0 0009F2B0  EC 00 07 F2 */	fmuls f0, f0, f31
/* 800A24B4 0009F2B4  D4 05 00 0C */	stfsu f0, 0xc(r5)
/* 800A24B8 0009F2B8  80 9F 00 4C */	lwz r4, 0x4c(r31)
/* 800A24BC 0009F2BC  C0 02 92 C4 */	lfs f0, lbl_803CDC44-_SDA2_BASE_(r2)
/* 800A24C0 0009F2C0  C0 44 00 00 */	lfs f2, 0(r4)
/* 800A24C4 0009F2C4  C0 24 00 04 */	lfs f1, 4(r4)
/* 800A24C8 0009F2C8  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800A24CC 0009F2CC  C0 64 00 08 */	lfs f3, 8(r4)
/* 800A24D0 0009F2D0  EC 21 00 72 */	fmuls f1, f1, f1
/* 800A24D4 0009F2D4  C0 82 92 D0 */	lfs f4, lbl_803CDC50-_SDA2_BASE_(r2)
/* 800A24D8 0009F2D8  EC 63 00 F2 */	fmuls f3, f3, f3
/* 800A24DC 0009F2DC  EC 22 08 2A */	fadds f1, f2, f1
/* 800A24E0 0009F2E0  EC A3 08 2A */	fadds f5, f3, f1
/* 800A24E4 0009F2E4  FC 05 00 40 */	fcmpo cr0, f5, f0
/* 800A24E8 0009F2E8  40 80 00 08 */	bge lbl_800A24F0
/* 800A24EC 0009F2EC  C0 A2 92 C0 */	lfs f5, lbl_803CDC40-_SDA2_BASE_(r2)
lbl_800A24F0:
/* 800A24F0 0009F2F0  28 04 00 00 */	cmplwi r4, 0
/* 800A24F4 0009F2F4  41 82 00 40 */	beq lbl_800A2534
/* 800A24F8 0009F2F8  C0 63 00 44 */	lfs f3, 0x44(r3)
/* 800A24FC 0009F2FC  C0 44 00 30 */	lfs f2, 0x30(r4)
/* 800A2500 0009F300  C0 23 00 48 */	lfs f1, 0x48(r3)
/* 800A2504 0009F304  C0 04 00 34 */	lfs f0, 0x34(r4)
/* 800A2508 0009F308  EC 83 10 28 */	fsubs f4, f3, f2
/* 800A250C 0009F30C  C0 43 00 4C */	lfs f2, 0x4c(r3)
/* 800A2510 0009F310  EC 61 00 28 */	fsubs f3, f1, f0
/* 800A2514 0009F314  C0 04 00 38 */	lfs f0, 0x38(r4)
/* 800A2518 0009F318  EC 24 01 32 */	fmuls f1, f4, f4
/* 800A251C 0009F31C  EC 42 00 28 */	fsubs f2, f2, f0
/* 800A2520 0009F320  EC 03 00 F2 */	fmuls f0, f3, f3
/* 800A2524 0009F324  EC 42 00 B2 */	fmuls f2, f2, f2
/* 800A2528 0009F328  EC 01 00 2A */	fadds f0, f1, f0
/* 800A252C 0009F32C  EC 02 00 2A */	fadds f0, f2, f0
/* 800A2530 0009F330  EC 80 28 24 */	fdivs f4, f0, f5
lbl_800A2534:
/* 800A2534 0009F334  C0 05 00 00 */	lfs f0, 0(r5)
/* 800A2538 0009F338  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 800A253C 0009F33C  4C 41 13 82 */	cror 2, 1, 2
/* 800A2540 0009F340  40 82 00 50 */	bne lbl_800A2590
/* 800A2544 0009F344  A0 1F 00 44 */	lhz r0, 0x44(r31)
/* 800A2548 0009F348  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A254C 0009F34C  38 63 A9 90 */	addi r3, r3, lbl_802EA990@l
/* 800A2550 0009F350  60 00 04 00 */	ori r0, r0, 0x400
/* 800A2554 0009F354  B0 1F 00 44 */	sth r0, 0x44(r31)
/* 800A2558 0009F358  80 0D 90 10 */	lwz r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A255C 0009F35C  54 00 20 36 */	slwi r0, r0, 4
/* 800A2560 0009F360  7C 03 00 2E */	lwzx r0, r3, r0
/* 800A2564 0009F364  2C 00 00 00 */	cmpwi r0, 0
/* 800A2568 0009F368  41 82 01 14 */	beq lbl_800A267C
/* 800A256C 0009F36C  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A2570 0009F370  48 00 00 14 */	b lbl_800A2584
lbl_800A2574:
/* 800A2574 0009F374  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A2578 0009F378  60 00 04 00 */	ori r0, r0, 0x400
/* 800A257C 0009F37C  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A2580 0009F380  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A2584:
/* 800A2584 0009F384  28 03 00 00 */	cmplwi r3, 0
/* 800A2588 0009F388  40 82 FF EC */	bne lbl_800A2574
/* 800A258C 0009F38C  48 00 00 F0 */	b lbl_800A267C
lbl_800A2590:
/* 800A2590 0009F390  A0 1F 00 44 */	lhz r0, 0x44(r31)
/* 800A2594 0009F394  38 A0 00 00 */	li r5, 0
/* 800A2598 0009F398  70 00 FB FF */	andi. r0, r0, 0xfbff
/* 800A259C 0009F39C  B0 1F 00 44 */	sth r0, 0x44(r31)
/* 800A25A0 0009F3A0  80 1E 00 00 */	lwz r0, 0(r30)
/* 800A25A4 0009F3A4  28 00 00 00 */	cmplwi r0, 0
/* 800A25A8 0009F3A8  41 82 00 18 */	beq lbl_800A25C0
/* 800A25AC 0009F3AC  90 1F 00 34 */	stw r0, 0x34(r31)
/* 800A25B0 0009F3B0  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 800A25B4 0009F3B4  80 63 00 00 */	lwz r3, 0(r3)
/* 800A25B8 0009F3B8  80 03 00 04 */	lwz r0, 4(r3)
/* 800A25BC 0009F3BC  90 1F 00 10 */	stw r0, 0x10(r31)
lbl_800A25C0:
/* 800A25C0 0009F3C0  7F C4 F3 78 */	mr r4, r30
/* 800A25C4 0009F3C4  48 00 00 20 */	b lbl_800A25E4
lbl_800A25C8:
/* 800A25C8 0009F3C8  90 1F 00 34 */	stw r0, 0x34(r31)
/* 800A25CC 0009F3CC  38 84 00 04 */	addi r4, r4, 4
/* 800A25D0 0009F3D0  38 A5 00 01 */	addi r5, r5, 1
/* 800A25D4 0009F3D4  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 800A25D8 0009F3D8  80 63 00 00 */	lwz r3, 0(r3)
/* 800A25DC 0009F3DC  80 03 00 04 */	lwz r0, 4(r3)
/* 800A25E0 0009F3E0  90 1F 00 10 */	stw r0, 0x10(r31)
lbl_800A25E4:
/* 800A25E4 0009F3E4  2C 05 00 03 */	cmpwi r5, 3
/* 800A25E8 0009F3E8  40 80 00 1C */	bge lbl_800A2604
/* 800A25EC 0009F3EC  80 04 00 08 */	lwz r0, 8(r4)
/* 800A25F0 0009F3F0  28 00 00 00 */	cmplwi r0, 0
/* 800A25F4 0009F3F4  41 82 00 10 */	beq lbl_800A2604
/* 800A25F8 0009F3F8  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 800A25FC 0009F3FC  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 800A2600 0009F400  41 81 FF C8 */	bgt lbl_800A25C8
lbl_800A2604:
/* 800A2604 0009F404  80 0D 90 10 */	lwz r0, lbl_803CB910-_SDA_BASE_(r13)
/* 800A2608 0009F408  3C 60 80 2F */	lis r3, lbl_802EA990@ha
/* 800A260C 0009F40C  38 63 A9 90 */	addi r3, r3, lbl_802EA990@l
/* 800A2610 0009F410  54 00 20 36 */	slwi r0, r0, 4
/* 800A2614 0009F414  7C 03 00 2E */	lwzx r0, r3, r0
/* 800A2618 0009F418  2C 00 00 00 */	cmpwi r0, 0
/* 800A261C 0009F41C  41 82 00 60 */	beq lbl_800A267C
/* 800A2620 0009F420  2C 05 00 00 */	cmpwi r5, 0
/* 800A2624 0009F424  40 82 00 28 */	bne lbl_800A264C
/* 800A2628 0009F428  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A262C 0009F42C  48 00 00 14 */	b lbl_800A2640
lbl_800A2630:
/* 800A2630 0009F430  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A2634 0009F434  70 00 FB FF */	andi. r0, r0, 0xfbff
/* 800A2638 0009F438  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A263C 0009F43C  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A2640:
/* 800A2640 0009F440  28 03 00 00 */	cmplwi r3, 0
/* 800A2644 0009F444  40 82 FF EC */	bne lbl_800A2630
/* 800A2648 0009F448  48 00 00 34 */	b lbl_800A267C
lbl_800A264C:
/* 800A264C 0009F44C  80 7F 00 00 */	lwz r3, 0(r31)
/* 800A2650 0009F450  48 00 00 14 */	b lbl_800A2664
lbl_800A2654:
/* 800A2654 0009F454  A0 03 00 44 */	lhz r0, 0x44(r3)
/* 800A2658 0009F458  60 00 04 00 */	ori r0, r0, 0x400
/* 800A265C 0009F45C  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800A2660 0009F460  80 63 00 00 */	lwz r3, 0(r3)
lbl_800A2664:
/* 800A2664 0009F464  28 03 00 00 */	cmplwi r3, 0
/* 800A2668 0009F468  40 82 FF EC */	bne lbl_800A2654
/* 800A266C 0009F46C  48 00 00 10 */	b lbl_800A267C
lbl_800A2670:
/* 800A2670 0009F470  38 A5 00 10 */	addi r5, r5, 0x10
/* 800A2674 0009F474  38 84 00 01 */	addi r4, r4, 1
/* 800A2678 0009F478  42 00 FD E4 */	bdnz lbl_800A245C
lbl_800A267C:
/* 800A267C 0009F47C  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 800A2680 0009F480  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800A2684 0009F484  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 800A2688 0009F488  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800A268C 0009F48C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800A2690 0009F490  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800A2694 0009F494  7C 08 03 A6 */	mtlr r0
/* 800A2698 0009F498  38 21 00 30 */	addi r1, r1, 0x30
/* 800A269C 0009F49C  4E 80 00 20 */	blr 
