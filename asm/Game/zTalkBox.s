.include "macros.inc"

.if 0

.section .text  # 0x801305FC - 0x80133E38

/* speak_stop__22@unnamed@zTalkBox_cpp@Fv */
speak_stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 801305FC 0012D3FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80130600 0012D400  7C 08 02 A6 */	mflr r0
/* 80130604 0012D404  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80130608 0012D408  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013060C 0012D40C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80130610 0012D410  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80130614 0012D414  3F E3 00 01 */	addis r31, r3, 1
/* 80130618 0012D418  80 7F 8E 94 */	lwz r3, -0x716c(r31)
/* 8013061C 0012D41C  28 03 00 00 */	cmplwi r3, 0
/* 80130620 0012D420  41 82 00 1C */	beq lbl_8013063C
/* 80130624 0012D424  81 83 01 B8 */	lwz r12, 0x1b8(r3)
/* 80130628 0012D428  81 8C 00 AC */	lwz r12, 0xac(r12)
/* 8013062C 0012D42C  7D 89 03 A6 */	mtctr r12
/* 80130630 0012D430  4E 80 04 21 */	bctrl 
/* 80130634 0012D434  38 00 00 00 */	li r0, 0
/* 80130638 0012D438  90 1F 8E 94 */	stw r0, -0x716c(r31)
lbl_8013063C:
/* 8013063C 0012D43C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80130640 0012D440  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80130644 0012D444  3F E3 00 01 */	addis r31, r3, 1
/* 80130648 0012D448  80 1F 8E 98 */	lwz r0, -0x7168(r31)
/* 8013064C 0012D44C  28 00 00 00 */	cmplwi r0, 0
/* 80130650 0012D450  41 82 00 10 */	beq lbl_80130660
/* 80130654 0012D454  4B F3 B1 39 */	bl zEntPlayerSpeakStop__Fv
/* 80130658 0012D458  38 00 00 00 */	li r0, 0
/* 8013065C 0012D45C  90 1F 8E 98 */	stw r0, -0x7168(r31)
lbl_80130660:
/* 80130660 0012D460  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80130664 0012D464  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80130668 0012D468  7C 08 03 A6 */	mtlr r0
/* 8013066C 0012D46C  38 21 00 10 */	addi r1, r1, 0x10
/* 80130670 0012D470  4E 80 00 20 */	blr 

/* trigger__22@unnamed@zTalkBox_cpp@FUi */
trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi:
/* 80130674 0012D474  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80130678 0012D478  7C 08 02 A6 */	mflr r0
/* 8013067C 0012D47C  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130680 0012D480  90 01 00 14 */	stw r0, 0x14(r1)
/* 80130684 0012D484  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80130688 0012D488  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013068C 0012D48C  93 C1 00 08 */	stw r30, 8(r1)
/* 80130690 0012D490  7C 7E 1B 78 */	mr r30, r3
/* 80130694 0012D494  3C 64 00 01 */	addis r3, r4, 1
/* 80130698 0012D498  88 03 8D 7A */	lbz r0, -0x7286(r3)
/* 8013069C 0012D49C  28 00 00 00 */	cmplwi r0, 0
/* 801306A0 0012D4A0  41 82 00 30 */	beq lbl_801306D0
/* 801306A4 0012D4A4  3B E3 8D 80 */	addi r31, r3, -29312
/* 801306A8 0012D4A8  7F E3 FB 78 */	mr r3, r31
/* 801306AC 0012D4AC  48 00 34 BD */	bl push_back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 801306B0 0012D4B0  7F E3 FB 78 */	mr r3, r31
/* 801306B4 0012D4B4  48 00 33 7D */	bl back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 801306B8 0012D4B8  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 801306BC 0012D4BC  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 801306C0 0012D4C0  80 04 00 08 */	lwz r0, 8(r4)
/* 801306C4 0012D4C4  90 03 00 00 */	stw r0, 0(r3)
/* 801306C8 0012D4C8  93 C3 00 04 */	stw r30, 4(r3)
/* 801306CC 0012D4CC  48 00 00 14 */	b lbl_801306E0
lbl_801306D0:
/* 801306D0 0012D4D0  80 64 00 08 */	lwz r3, 8(r4)
/* 801306D4 0012D4D4  7F C5 F3 78 */	mr r5, r30
/* 801306D8 0012D4D8  7C 64 1B 78 */	mr r4, r3
/* 801306DC 0012D4DC  4B EE F0 05 */	bl zEntEvent__FP5xBaseP5xBaseUi
lbl_801306E0:
/* 801306E0 0012D4E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801306E4 0012D4E4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801306E8 0012D4E8  83 C1 00 08 */	lwz r30, 8(r1)
/* 801306EC 0012D4EC  7C 08 03 A6 */	mtlr r0
/* 801306F0 0012D4F0  38 21 00 10 */	addi r1, r1, 0x10
/* 801306F4 0012D4F4  4E 80 00 20 */	blr 

/* trigger_pads__22@unnamed@zTalkBox_cpp@FUi */
trigger_pads__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi:
/* 801306F8 0012D4F8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801306FC 0012D4FC  7C 08 02 A6 */	mflr r0
/* 80130700 0012D500  90 01 00 14 */	stw r0, 0x14(r1)
/* 80130704 0012D504  54 60 06 F7 */	rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 80130708 0012D508  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013070C 0012D50C  7C 7F 1B 78 */	mr r31, r3
/* 80130710 0012D510  41 82 00 0C */	beq lbl_8013071C
/* 80130714 0012D514  38 60 00 49 */	li r3, 0x49
/* 80130718 0012D518  4B FF FF 5D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013071C:
/* 8013071C 0012D51C  57 E0 06 73 */	rlwinm. r0, r31, 0, 0x19, 0x19
/* 80130720 0012D520  41 82 00 0C */	beq lbl_8013072C
/* 80130724 0012D524  38 60 00 4A */	li r3, 0x4a
/* 80130728 0012D528  4B FF FF 4D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013072C:
/* 8013072C 0012D52C  57 E0 06 31 */	rlwinm. r0, r31, 0, 0x18, 0x18
/* 80130730 0012D530  41 82 00 0C */	beq lbl_8013073C
/* 80130734 0012D534  38 60 00 4C */	li r3, 0x4c
/* 80130738 0012D538  4B FF FF 3D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013073C:
/* 8013073C 0012D53C  57 E0 06 B5 */	rlwinm. r0, r31, 0, 0x1a, 0x1a
/* 80130740 0012D540  41 82 00 0C */	beq lbl_8013074C
/* 80130744 0012D544  38 60 00 4B */	li r3, 0x4b
/* 80130748 0012D548  4B FF FF 2D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013074C:
/* 8013074C 0012D54C  57 E0 07 FF */	clrlwi. r0, r31, 0x1f
/* 80130750 0012D550  41 82 00 0C */	beq lbl_8013075C
/* 80130754 0012D554  38 60 00 47 */	li r3, 0x47
/* 80130758 0012D558  4B FF FF 1D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013075C:
/* 8013075C 0012D55C  57 E0 07 BD */	rlwinm. r0, r31, 0, 0x1e, 0x1e
/* 80130760 0012D560  41 82 00 0C */	beq lbl_8013076C
/* 80130764 0012D564  38 60 00 48 */	li r3, 0x48
/* 80130768 0012D568  4B FF FF 0D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013076C:
/* 8013076C 0012D56C  57 E0 04 E7 */	rlwinm. r0, r31, 0, 0x13, 0x13
/* 80130770 0012D570  41 82 00 0C */	beq lbl_8013077C
/* 80130774 0012D574  38 60 00 45 */	li r3, 0x45
/* 80130778 0012D578  4B FF FE FD */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013077C:
/* 8013077C 0012D57C  57 E0 04 A5 */	rlwinm. r0, r31, 0, 0x12, 0x12
/* 80130780 0012D580  41 82 00 0C */	beq lbl_8013078C
/* 80130784 0012D584  38 60 00 46 */	li r3, 0x46
/* 80130788 0012D588  4B FF FE ED */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013078C:
/* 8013078C 0012D58C  57 E0 05 EF */	rlwinm. r0, r31, 0, 0x17, 0x17
/* 80130790 0012D590  41 82 00 0C */	beq lbl_8013079C
/* 80130794 0012D594  38 60 00 43 */	li r3, 0x43
/* 80130798 0012D598  4B FF FE DD */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_8013079C:
/* 8013079C 0012D59C  57 E0 05 AD */	rlwinm. r0, r31, 0, 0x16, 0x16
/* 801307A0 0012D5A0  41 82 00 0C */	beq lbl_801307AC
/* 801307A4 0012D5A4  38 60 00 44 */	li r3, 0x44
/* 801307A8 0012D5A8  4B FF FE CD */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801307AC:
/* 801307AC 0012D5AC  57 E0 03 DF */	rlwinm. r0, r31, 0, 0xf, 0xf
/* 801307B0 0012D5B0  41 82 00 0C */	beq lbl_801307BC
/* 801307B4 0012D5B4  38 60 00 3F */	li r3, 0x3f
/* 801307B8 0012D5B8  4B FF FE BD */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801307BC:
/* 801307BC 0012D5BC  57 E0 03 9D */	rlwinm. r0, r31, 0, 0xe, 0xe
/* 801307C0 0012D5C0  41 82 00 0C */	beq lbl_801307CC
/* 801307C4 0012D5C4  38 60 00 41 */	li r3, 0x41
/* 801307C8 0012D5C8  4B FF FE AD */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801307CC:
/* 801307CC 0012D5CC  57 E0 03 5B */	rlwinm. r0, r31, 0, 0xd, 0xd
/* 801307D0 0012D5D0  41 82 00 0C */	beq lbl_801307DC
/* 801307D4 0012D5D4  38 60 00 42 */	li r3, 0x42
/* 801307D8 0012D5D8  4B FF FE 9D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801307DC:
/* 801307DC 0012D5DC  57 E0 03 19 */	rlwinm. r0, r31, 0, 0xc, 0xc
/* 801307E0 0012D5E0  41 82 00 0C */	beq lbl_801307EC
/* 801307E4 0012D5E4  38 60 00 40 */	li r3, 0x40
/* 801307E8 0012D5E8  4B FF FE 8D */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801307EC:
/* 801307EC 0012D5EC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801307F0 0012D5F0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801307F4 0012D5F4  7C 08 03 A6 */	mtlr r0
/* 801307F8 0012D5F8  38 21 00 10 */	addi r1, r1, 0x10
/* 801307FC 0012D5FC  4E 80 00 20 */	blr 

/* flush_triggered__22@unnamed@zTalkBox_cpp@Fv */
flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80130800 0012D600  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80130804 0012D604  7C 08 02 A6 */	mflr r0
/* 80130808 0012D608  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013080C 0012D60C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80130810 0012D610  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80130814 0012D614  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80130818 0012D618  3F E3 00 01 */	addis r31, r3, 1
/* 8013081C 0012D61C  3B FF 8D 80 */	addi r31, r31, -29312
/* 80130820 0012D620  48 00 00 34 */	b lbl_80130854
lbl_80130824:
/* 80130824 0012D624  7F E3 FB 78 */	mr r3, r31
/* 80130828 0012D628  48 00 33 A9 */	bl front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 8013082C 0012D62C  80 83 00 00 */	lwz r4, 0(r3)
/* 80130830 0012D630  80 03 00 04 */	lwz r0, 4(r3)
/* 80130834 0012D634  7F E3 FB 78 */	mr r3, r31
/* 80130838 0012D638  90 81 00 08 */	stw r4, 8(r1)
/* 8013083C 0012D63C  90 01 00 0C */	stw r0, 0xc(r1)
/* 80130840 0012D640  48 00 33 69 */	bl pop_front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 80130844 0012D644  80 61 00 08 */	lwz r3, 8(r1)
/* 80130848 0012D648  80 A1 00 0C */	lwz r5, 0xc(r1)
/* 8013084C 0012D64C  7C 64 1B 78 */	mr r4, r3
/* 80130850 0012D650  4B EE EE 91 */	bl zEntEvent__FP5xBaseP5xBaseUi
lbl_80130854:
/* 80130854 0012D654  7F E3 FB 78 */	mr r3, r31
/* 80130858 0012D658  48 00 33 39 */	bl empty__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
/* 8013085C 0012D65C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80130860 0012D660  41 82 FF C4 */	beq lbl_80130824
/* 80130864 0012D664  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80130868 0012D668  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8013086C 0012D66C  7C 08 03 A6 */	mtlr r0
/* 80130870 0012D670  38 21 00 20 */	addi r1, r1, 0x20
/* 80130874 0012D674  4E 80 00 20 */	blr 

/* read_bool__22@unnamed@zTalkBox_cpp@FRC6substrb */
read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb:
/* 80130878 0012D678  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013087C 0012D67C  7C 08 02 A6 */	mflr r0
/* 80130880 0012D680  90 01 00 24 */	stw r0, 0x24(r1)
/* 80130884 0012D684  54 80 06 3F */	clrlwi. r0, r4, 0x18
/* 80130888 0012D688  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013088C 0012D68C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80130890 0012D690  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80130894 0012D694  7C 7D 1B 78 */	mr r29, r3
/* 80130898 0012D698  41 82 00 44 */	beq lbl_801308DC
/* 8013089C 0012D69C  3C 60 80 27 */	lis r3, lbl_8026C8A0@ha
/* 801308A0 0012D6A0  3B C0 00 00 */	li r30, 0
/* 801308A4 0012D6A4  3B E3 C8 A0 */	addi r31, r3, lbl_8026C8A0@l
lbl_801308A8:
/* 801308A8 0012D6A8  7F A3 EB 78 */	mr r3, r29
/* 801308AC 0012D6AC  7F E4 FB 78 */	mr r4, r31
/* 801308B0 0012D6B0  4B F1 C0 85 */	bl icompare__FRC6substrRC6substr
/* 801308B4 0012D6B4  2C 03 00 00 */	cmpwi r3, 0
/* 801308B8 0012D6B8  40 82 00 0C */	bne lbl_801308C4
/* 801308BC 0012D6BC  38 60 00 00 */	li r3, 0
/* 801308C0 0012D6C0  48 00 00 58 */	b lbl_80130918
lbl_801308C4:
/* 801308C4 0012D6C4  3B DE 00 01 */	addi r30, r30, 1
/* 801308C8 0012D6C8  3B FF 00 08 */	addi r31, r31, 8
/* 801308CC 0012D6CC  28 1E 00 06 */	cmplwi r30, 6
/* 801308D0 0012D6D0  41 80 FF D8 */	blt lbl_801308A8
/* 801308D4 0012D6D4  38 60 00 01 */	li r3, 1
/* 801308D8 0012D6D8  48 00 00 40 */	b lbl_80130918
lbl_801308DC:
/* 801308DC 0012D6DC  3C 60 80 27 */	lis r3, lbl_8026C870@ha
/* 801308E0 0012D6E0  3B C0 00 00 */	li r30, 0
/* 801308E4 0012D6E4  3B E3 C8 70 */	addi r31, r3, lbl_8026C870@l
lbl_801308E8:
/* 801308E8 0012D6E8  7F A3 EB 78 */	mr r3, r29
/* 801308EC 0012D6EC  7F E4 FB 78 */	mr r4, r31
/* 801308F0 0012D6F0  4B F1 C0 45 */	bl icompare__FRC6substrRC6substr
/* 801308F4 0012D6F4  2C 03 00 00 */	cmpwi r3, 0
/* 801308F8 0012D6F8  40 82 00 0C */	bne lbl_80130904
/* 801308FC 0012D6FC  38 60 00 01 */	li r3, 1
/* 80130900 0012D700  48 00 00 18 */	b lbl_80130918
lbl_80130904:
/* 80130904 0012D704  3B DE 00 01 */	addi r30, r30, 1
/* 80130908 0012D708  3B FF 00 08 */	addi r31, r31, 8
/* 8013090C 0012D70C  28 1E 00 06 */	cmplwi r30, 6
/* 80130910 0012D710  41 80 FF D8 */	blt lbl_801308E8
/* 80130914 0012D714  38 60 00 00 */	li r3, 0
lbl_80130918:
/* 80130918 0012D718  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013091C 0012D71C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80130920 0012D720  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80130924 0012D724  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80130928 0012D728  7C 08 03 A6 */	mtlr r0
/* 8013092C 0012D72C  38 21 00 20 */	addi r1, r1, 0x20
/* 80130930 0012D730  4E 80 00 20 */	blr 

/* reset_auto_wait__22@unnamed@zTalkBox_cpp@Fv */
reset_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80130934 0012D734  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80130938 0012D738  38 00 00 00 */	li r0, 0
/* 8013093C 0012D73C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80130940 0012D740  80 83 00 08 */	lwz r4, 8(r3)
/* 80130944 0012D744  3C A3 00 01 */	addis r5, r3, 1
/* 80130948 0012D748  88 65 8D 38 */	lbz r3, -0x72c8(r5)
/* 8013094C 0012D74C  80 C4 00 14 */	lwz r6, 0x14(r4)
/* 80130950 0012D750  88 86 00 28 */	lbz r4, 0x28(r6)
/* 80130954 0012D754  50 83 3E 30 */	rlwimi r3, r4, 7, 0x18, 0x18
/* 80130958 0012D758  98 65 8D 38 */	stb r3, -0x72c8(r5)
/* 8013095C 0012D75C  88 86 00 29 */	lbz r4, 0x29(r6)
/* 80130960 0012D760  88 65 8D 38 */	lbz r3, -0x72c8(r5)
/* 80130964 0012D764  50 83 36 72 */	rlwimi r3, r4, 6, 0x19, 0x19
/* 80130968 0012D768  98 65 8D 38 */	stb r3, -0x72c8(r5)
/* 8013096C 0012D76C  88 86 00 2A */	lbz r4, 0x2a(r6)
/* 80130970 0012D770  88 65 8D 38 */	lbz r3, -0x72c8(r5)
/* 80130974 0012D774  50 83 2E B4 */	rlwimi r3, r4, 5, 0x1a, 0x1a
/* 80130978 0012D778  98 65 8D 38 */	stb r3, -0x72c8(r5)
/* 8013097C 0012D77C  88 86 00 2B */	lbz r4, 0x2b(r6)
/* 80130980 0012D780  88 65 8D 38 */	lbz r3, -0x72c8(r5)
/* 80130984 0012D784  50 83 26 F6 */	rlwimi r3, r4, 4, 0x1b, 0x1b
/* 80130988 0012D788  98 65 8D 38 */	stb r3, -0x72c8(r5)
/* 8013098C 0012D78C  C0 06 00 2C */	lfs f0, 0x2c(r6)
/* 80130990 0012D790  D0 05 8D 3C */	stfs f0, -0x72c4(r5)
/* 80130994 0012D794  98 05 8D 3A */	stb r0, -0x72c6(r5)
/* 80130998 0012D798  80 66 00 30 */	lwz r3, 0x30(r6)
/* 8013099C 0012D79C  2C 03 00 00 */	cmpwi r3, 0
/* 801309A0 0012D7A0  40 81 00 0C */	ble lbl_801309AC
/* 801309A4 0012D7A4  2C 03 00 20 */	cmpwi r3, 0x20
/* 801309A8 0012D7A8  41 80 00 1C */	blt lbl_801309C4
lbl_801309AC:
/* 801309AC 0012D7AC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801309B0 0012D7B0  38 00 FF FF */	li r0, -1
/* 801309B4 0012D7B4  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801309B8 0012D7B8  3C 63 00 01 */	addis r3, r3, 1
/* 801309BC 0012D7BC  90 03 8D 40 */	stw r0, -0x72c0(r3)
/* 801309C0 0012D7C0  48 00 00 10 */	b lbl_801309D0
lbl_801309C4:
/* 801309C4 0012D7C4  38 00 00 01 */	li r0, 1
/* 801309C8 0012D7C8  7C 00 18 30 */	slw r0, r0, r3
/* 801309CC 0012D7CC  90 05 8D 40 */	stw r0, -0x72c0(r5)
lbl_801309D0:
/* 801309D0 0012D7D0  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801309D4 0012D7D4  38 00 00 00 */	li r0, 0
/* 801309D8 0012D7D8  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801309DC 0012D7DC  3C 63 00 01 */	addis r3, r3, 1
/* 801309E0 0012D7E0  90 03 8D 44 */	stw r0, -0x72bc(r3)
/* 801309E4 0012D7E4  4E 80 00 20 */	blr 

/* load_wait_context__22@unnamed@zTalkBox_cpp@FRQ222@unnamed@zTalkBox_cpp@12wait_contextRCQ28xtextbox14tag_entry_list */
load_wait_context__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextRCQ28xtextbox14tag_entry_list:
/* 801309E8 0012D7E8  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 801309EC 0012D7EC  7C 08 02 A6 */	mflr r0
/* 801309F0 0012D7F0  90 01 00 54 */	stw r0, 0x54(r1)
/* 801309F4 0012D7F4  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 801309F8 0012D7F8  7C 9F 23 78 */	mr r31, r4
/* 801309FC 0012D7FC  93 C1 00 48 */	stw r30, 0x48(r1)
/* 80130A00 0012D800  7C 7E 1B 78 */	mr r30, r3
/* 80130A04 0012D804  93 A1 00 44 */	stw r29, 0x44(r1)
/* 80130A08 0012D808  48 00 02 89 */	bl reset_type__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFv
/* 80130A0C 0012D80C  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80130A10 0012D810  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130A14 0012D814  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130A18 0012D818  38 80 00 04 */	li r4, 4
/* 80130A1C 0012D81C  D0 1E 00 04 */	stfs f0, 4(r30)
/* 80130A20 0012D820  38 63 00 25 */	addi r3, r3, 0x25
/* 80130A24 0012D824  4B EF 59 01 */	bl create__6substrFPCcUl
/* 80130A28 0012D828  90 81 00 34 */	stw r4, 0x34(r1)
/* 80130A2C 0012D82C  38 81 00 30 */	addi r4, r1, 0x30
/* 80130A30 0012D830  90 61 00 30 */	stw r3, 0x30(r1)
/* 80130A34 0012D834  7F E3 FB 78 */	mr r3, r31
/* 80130A38 0012D838  4B EF 20 ED */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130A3C 0012D83C  28 03 00 00 */	cmplwi r3, 0
/* 80130A40 0012D840  41 82 00 28 */	beq lbl_80130A68
/* 80130A44 0012D844  38 9E 00 04 */	addi r4, r30, 4
/* 80130A48 0012D848  38 A0 00 01 */	li r5, 1
/* 80130A4C 0012D84C  4B EF 21 49 */	bl read_list__8xtextboxFRCQ28xtextbox9tag_entryPfUl
/* 80130A50 0012D850  28 03 00 01 */	cmplwi r3, 1
/* 80130A54 0012D854  40 82 00 14 */	bne lbl_80130A68
/* 80130A58 0012D858  88 1E 00 00 */	lbz r0, 0(r30)
/* 80130A5C 0012D85C  38 60 00 01 */	li r3, 1
/* 80130A60 0012D860  50 60 3E 30 */	rlwimi r0, r3, 7, 0x18, 0x18
/* 80130A64 0012D864  98 1E 00 00 */	stb r0, 0(r30)
lbl_80130A68:
/* 80130A68 0012D868  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130A6C 0012D86C  38 80 00 06 */	li r4, 6
/* 80130A70 0012D870  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130A74 0012D874  38 63 00 2A */	addi r3, r3, 0x2a
/* 80130A78 0012D878  4B EF 58 AD */	bl create__6substrFPCcUl
/* 80130A7C 0012D87C  90 81 00 2C */	stw r4, 0x2c(r1)
/* 80130A80 0012D880  38 81 00 28 */	addi r4, r1, 0x28
/* 80130A84 0012D884  90 61 00 28 */	stw r3, 0x28(r1)
/* 80130A88 0012D888  7F E3 FB 78 */	mr r3, r31
/* 80130A8C 0012D88C  4B EF 20 99 */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130A90 0012D890  7C 7D 1B 79 */	or. r29, r3, r3
/* 80130A94 0012D894  41 82 00 70 */	beq lbl_80130B04
/* 80130A98 0012D898  88 1E 00 00 */	lbz r0, 0(r30)
/* 80130A9C 0012D89C  38 60 00 01 */	li r3, 1
/* 80130AA0 0012D8A0  50 60 36 72 */	rlwimi r0, r3, 6, 0x19, 0x19
/* 80130AA4 0012D8A4  98 1E 00 00 */	stb r0, 0(r30)
/* 80130AA8 0012D8A8  88 1D 00 08 */	lbz r0, 8(r29)
/* 80130AAC 0012D8AC  28 00 00 3D */	cmplwi r0, 0x3d
/* 80130AB0 0012D8B0  40 82 00 4C */	bne lbl_80130AFC
/* 80130AB4 0012D8B4  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 80130AB8 0012D8B8  28 00 00 01 */	cmplwi r0, 1
/* 80130ABC 0012D8BC  40 82 00 40 */	bne lbl_80130AFC
/* 80130AC0 0012D8C0  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130AC4 0012D8C4  38 80 00 05 */	li r4, 5
/* 80130AC8 0012D8C8  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130ACC 0012D8CC  38 63 00 31 */	addi r3, r3, 0x31
/* 80130AD0 0012D8D0  4B EF 58 55 */	bl create__6substrFPCcUl
/* 80130AD4 0012D8D4  90 81 00 24 */	stw r4, 0x24(r1)
/* 80130AD8 0012D8D8  38 81 00 20 */	addi r4, r1, 0x20
/* 80130ADC 0012D8DC  90 61 00 20 */	stw r3, 0x20(r1)
/* 80130AE0 0012D8E0  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 80130AE4 0012D8E4  4B F1 BE 51 */	bl icompare__FRC6substrRC6substr
/* 80130AE8 0012D8E8  2C 03 00 00 */	cmpwi r3, 0
/* 80130AEC 0012D8EC  40 82 00 10 */	bne lbl_80130AFC
/* 80130AF0 0012D8F0  38 00 00 01 */	li r0, 1
/* 80130AF4 0012D8F4  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80130AF8 0012D8F8  48 00 00 0C */	b lbl_80130B04
lbl_80130AFC:
/* 80130AFC 0012D8FC  38 00 00 00 */	li r0, 0
/* 80130B00 0012D900  90 1E 00 0C */	stw r0, 0xc(r30)
lbl_80130B04:
/* 80130B04 0012D904  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130B08 0012D908  38 80 00 05 */	li r4, 5
/* 80130B0C 0012D90C  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130B10 0012D910  38 63 00 37 */	addi r3, r3, 0x37
/* 80130B14 0012D914  4B EF 58 11 */	bl create__6substrFPCcUl
/* 80130B18 0012D918  90 81 00 1C */	stw r4, 0x1c(r1)
/* 80130B1C 0012D91C  38 81 00 18 */	addi r4, r1, 0x18
/* 80130B20 0012D920  90 61 00 18 */	stw r3, 0x18(r1)
/* 80130B24 0012D924  7F E3 FB 78 */	mr r3, r31
/* 80130B28 0012D928  4B EF 1F FD */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130B2C 0012D92C  7C 03 00 D0 */	neg r0, r3
/* 80130B30 0012D930  3C 80 80 27 */	lis r4, lbl_8026C920@ha
/* 80130B34 0012D934  7C 03 1B 78 */	or r3, r0, r3
/* 80130B38 0012D938  88 1E 00 00 */	lbz r0, 0(r30)
/* 80130B3C 0012D93C  54 65 0F FE */	srwi r5, r3, 0x1f
/* 80130B40 0012D940  38 64 C9 20 */	addi r3, r4, lbl_8026C920@l
/* 80130B44 0012D944  50 A0 2E B4 */	rlwimi r0, r5, 5, 0x1a, 0x1a
/* 80130B48 0012D948  38 80 00 05 */	li r4, 5
/* 80130B4C 0012D94C  98 1E 00 00 */	stb r0, 0(r30)
/* 80130B50 0012D950  38 63 00 3D */	addi r3, r3, 0x3d
/* 80130B54 0012D954  4B EF 57 D1 */	bl create__6substrFPCcUl
/* 80130B58 0012D958  90 81 00 14 */	stw r4, 0x14(r1)
/* 80130B5C 0012D95C  38 81 00 10 */	addi r4, r1, 0x10
/* 80130B60 0012D960  90 61 00 10 */	stw r3, 0x10(r1)
/* 80130B64 0012D964  7F E3 FB 78 */	mr r3, r31
/* 80130B68 0012D968  4B EF 1F BD */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130B6C 0012D96C  7C 7D 1B 79 */	or. r29, r3, r3
/* 80130B70 0012D970  41 82 00 94 */	beq lbl_80130C04
/* 80130B74 0012D974  88 1E 00 00 */	lbz r0, 0(r30)
/* 80130B78 0012D978  38 80 00 01 */	li r4, 1
/* 80130B7C 0012D97C  50 80 26 F6 */	rlwimi r0, r4, 4, 0x1b, 0x1b
/* 80130B80 0012D980  38 A0 00 20 */	li r5, 0x20
/* 80130B84 0012D984  3C 80 80 32 */	lis r4, lbl_803241BC@ha
/* 80130B88 0012D988  98 1E 00 00 */	stb r0, 0(r30)
/* 80130B8C 0012D98C  38 84 41 BC */	addi r4, r4, lbl_803241BC@l
/* 80130B90 0012D990  4B EF 20 85 */	bl read_list__8xtextboxFRCQ28xtextbox9tag_entryPiUl
/* 80130B94 0012D994  28 03 00 00 */	cmplwi r3, 0
/* 80130B98 0012D998  40 82 00 10 */	bne lbl_80130BA8
/* 80130B9C 0012D99C  38 00 FF FF */	li r0, -1
/* 80130BA0 0012D9A0  90 1E 00 08 */	stw r0, 8(r30)
/* 80130BA4 0012D9A4  48 00 00 60 */	b lbl_80130C04
lbl_80130BA8:
/* 80130BA8 0012D9A8  88 1D 00 08 */	lbz r0, 8(r29)
/* 80130BAC 0012D9AC  28 00 00 3D */	cmplwi r0, 0x3d
/* 80130BB0 0012D9B0  40 82 00 54 */	bne lbl_80130C04
/* 80130BB4 0012D9B4  3C 80 80 32 */	lis r4, lbl_803241BC@ha
/* 80130BB8 0012D9B8  38 A4 41 BC */	addi r5, r4, lbl_803241BC@l
/* 80130BBC 0012D9BC  38 80 00 01 */	li r4, 1
/* 80130BC0 0012D9C0  7C 69 03 A6 */	mtctr r3
/* 80130BC4 0012D9C4  28 03 00 00 */	cmplwi r3, 0
/* 80130BC8 0012D9C8  40 81 00 28 */	ble lbl_80130BF0
lbl_80130BCC:
/* 80130BCC 0012D9CC  80 05 00 00 */	lwz r0, 0(r5)
/* 80130BD0 0012D9D0  28 00 00 20 */	cmplwi r0, 0x20
/* 80130BD4 0012D9D4  40 80 00 14 */	bge lbl_80130BE8
/* 80130BD8 0012D9D8  80 7E 00 08 */	lwz r3, 8(r30)
/* 80130BDC 0012D9DC  7C 80 00 30 */	slw r0, r4, r0
/* 80130BE0 0012D9E0  7C 60 03 78 */	or r0, r3, r0
/* 80130BE4 0012D9E4  90 1E 00 08 */	stw r0, 8(r30)
lbl_80130BE8:
/* 80130BE8 0012D9E8  38 A5 00 04 */	addi r5, r5, 4
/* 80130BEC 0012D9EC  42 00 FF E0 */	bdnz lbl_80130BCC
lbl_80130BF0:
/* 80130BF0 0012D9F0  80 1E 00 08 */	lwz r0, 8(r30)
/* 80130BF4 0012D9F4  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80130BF8 0012D9F8  41 82 00 0C */	beq lbl_80130C04
/* 80130BFC 0012D9FC  38 00 FF FF */	li r0, -1
/* 80130C00 0012DA00  90 1E 00 08 */	stw r0, 8(r30)
lbl_80130C04:
/* 80130C04 0012DA04  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130C08 0012DA08  38 80 00 04 */	li r4, 4
/* 80130C0C 0012DA0C  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130C10 0012DA10  38 63 00 43 */	addi r3, r3, 0x43
/* 80130C14 0012DA14  4B EF 57 11 */	bl create__6substrFPCcUl
/* 80130C18 0012DA18  90 81 00 0C */	stw r4, 0xc(r1)
/* 80130C1C 0012DA1C  38 81 00 08 */	addi r4, r1, 8
/* 80130C20 0012DA20  90 61 00 08 */	stw r3, 8(r1)
/* 80130C24 0012DA24  7F E3 FB 78 */	mr r3, r31
/* 80130C28 0012DA28  4B EF 1E FD */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130C2C 0012DA2C  28 03 00 00 */	cmplwi r3, 0
/* 80130C30 0012DA30  41 82 00 3C */	beq lbl_80130C6C
/* 80130C34 0012DA34  88 03 00 08 */	lbz r0, 8(r3)
/* 80130C38 0012DA38  28 00 00 3D */	cmplwi r0, 0x3d
/* 80130C3C 0012DA3C  40 82 00 24 */	bne lbl_80130C60
/* 80130C40 0012DA40  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80130C44 0012DA44  28 00 00 00 */	cmplwi r0, 0
/* 80130C48 0012DA48  41 82 00 18 */	beq lbl_80130C60
/* 80130C4C 0012DA4C  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80130C50 0012DA50  38 80 00 01 */	li r4, 1
/* 80130C54 0012DA54  4B FF FC 25 */	bl read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb
/* 80130C58 0012DA58  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80130C5C 0012DA5C  40 82 00 10 */	bne lbl_80130C6C
lbl_80130C60:
/* 80130C60 0012DA60  38 00 00 01 */	li r0, 1
/* 80130C64 0012DA64  98 1E 00 02 */	stb r0, 2(r30)
/* 80130C68 0012DA68  48 00 00 0C */	b lbl_80130C74
lbl_80130C6C:
/* 80130C6C 0012DA6C  38 00 00 00 */	li r0, 0
/* 80130C70 0012DA70  98 1E 00 02 */	stb r0, 2(r30)
lbl_80130C74:
/* 80130C74 0012DA74  80 01 00 54 */	lwz r0, 0x54(r1)
/* 80130C78 0012DA78  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 80130C7C 0012DA7C  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 80130C80 0012DA80  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 80130C84 0012DA84  7C 08 03 A6 */	mtlr r0
/* 80130C88 0012DA88  38 21 00 50 */	addi r1, r1, 0x50
/* 80130C8C 0012DA8C  4E 80 00 20 */	blr 

/* reset_type__Q222@unnamed@zTalkBox_cpp@12wait_contextFv */
reset_type__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFv:
/* 80130C90 0012DA90  38 00 00 00 */	li r0, 0
/* 80130C94 0012DA94  B0 03 00 00 */	sth r0, 0(r3)
/* 80130C98 0012DA98  4E 80 00 20 */	blr 

parse_tag_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80130C9C 0012DA9C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80130CA0 0012DAA0  7C 08 02 A6 */	mflr r0
/* 80130CA4 0012DAA4  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130CA8 0012DAA8  90 01 00 24 */	stw r0, 0x24(r1)
/* 80130CAC 0012DAAC  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80130CB0 0012DAB0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80130CB4 0012DAB4  80 84 00 08 */	lwz r4, 8(r4)
/* 80130CB8 0012DAB8  28 04 00 00 */	cmplwi r4, 0
/* 80130CBC 0012DABC  41 82 00 AC */	beq lbl_80130D68
/* 80130CC0 0012DAC0  80 84 00 18 */	lwz r4, 0x18(r4)
/* 80130CC4 0012DAC4  38 04 00 18 */	addi r0, r4, 0x18
/* 80130CC8 0012DAC8  7C 00 28 40 */	cmplw r0, r5
/* 80130CCC 0012DACC  40 82 00 9C */	bne lbl_80130D68
/* 80130CD0 0012DAD0  83 E3 00 10 */	lwz r31, 0x10(r3)
/* 80130CD4 0012DAD4  38 00 00 10 */	li r0, 0x10
/* 80130CD8 0012DAD8  B0 03 00 0C */	sth r0, 0xc(r3)
/* 80130CDC 0012DADC  7C C3 33 78 */	mr r3, r6
/* 80130CE0 0012DAE0  4B EF 1C 29 */	bl read_tag__8xtextboxFRC6substr
/* 80130CE4 0012DAE4  90 81 00 0C */	stw r4, 0xc(r1)
/* 80130CE8 0012DAE8  90 61 00 08 */	stw r3, 8(r1)
/* 80130CEC 0012DAEC  88 03 00 08 */	lbz r0, 8(r3)
/* 80130CF0 0012DAF0  28 00 00 3D */	cmplwi r0, 0x3d
/* 80130CF4 0012DAF4  40 82 00 38 */	bne lbl_80130D2C
/* 80130CF8 0012DAF8  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80130CFC 0012DAFC  28 00 00 00 */	cmplwi r0, 0
/* 80130D00 0012DB00  41 82 00 2C */	beq lbl_80130D2C
/* 80130D04 0012DB04  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80130D08 0012DB08  38 80 00 01 */	li r4, 1
/* 80130D0C 0012DB0C  4B FF FB 6D */	bl read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb
/* 80130D10 0012DB10  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80130D14 0012DB14  40 82 00 18 */	bne lbl_80130D2C
/* 80130D18 0012DB18  7F E3 FB 78 */	mr r3, r31
/* 80130D1C 0012DB1C  4B FF FF 75 */	bl reset_type__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFv
/* 80130D20 0012DB20  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80130D24 0012DB24  D0 1F 00 04 */	stfs f0, 4(r31)
/* 80130D28 0012DB28  48 00 00 28 */	b lbl_80130D50
lbl_80130D2C:
/* 80130D2C 0012DB2C  80 C1 00 0C */	lwz r6, 0xc(r1)
/* 80130D30 0012DB30  7F E3 FB 78 */	mr r3, r31
/* 80130D34 0012DB34  80 A1 00 08 */	lwz r5, 8(r1)
/* 80130D38 0012DB38  38 81 00 08 */	addi r4, r1, 8
/* 80130D3C 0012DB3C  38 C6 FF FF */	addi r6, r6, -1
/* 80130D40 0012DB40  38 05 00 14 */	addi r0, r5, 0x14
/* 80130D44 0012DB44  90 C1 00 0C */	stw r6, 0xc(r1)
/* 80130D48 0012DB48  90 01 00 08 */	stw r0, 8(r1)
/* 80130D4C 0012DB4C  4B FF FC 9D */	bl load_wait_context__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextRCQ28xtextbox14tag_entry_list
lbl_80130D50:
/* 80130D50 0012DB50  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80130D54 0012DB54  7F E4 FB 78 */	mr r4, r31
/* 80130D58 0012DB58  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80130D5C 0012DB5C  3C 63 00 01 */	addis r3, r3, 1
/* 80130D60 0012DB60  38 63 8D 38 */	addi r3, r3, -29384
/* 80130D64 0012DB64  48 00 00 19 */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
lbl_80130D68:
/* 80130D68 0012DB68  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80130D6C 0012DB6C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80130D70 0012DB70  7C 08 03 A6 */	mtlr r0
/* 80130D74 0012DB74  38 21 00 20 */	addi r1, r1, 0x20
/* 80130D78 0012DB78  4E 80 00 20 */	blr 

/* __as__Q222@unnamed@zTalkBox_cpp@12wait_contextFRCQ222@unnamed@zTalkBox_cpp@12wait_context */
__as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context:
/* 80130D7C 0012DB7C  A0 A4 00 00 */	lhz r5, 0(r4)
/* 80130D80 0012DB80  88 04 00 02 */	lbz r0, 2(r4)
/* 80130D84 0012DB84  B0 A3 00 00 */	sth r5, 0(r3)
/* 80130D88 0012DB88  C0 04 00 04 */	lfs f0, 4(r4)
/* 80130D8C 0012DB8C  98 03 00 02 */	stb r0, 2(r3)
/* 80130D90 0012DB90  80 A4 00 08 */	lwz r5, 8(r4)
/* 80130D94 0012DB94  D0 03 00 04 */	stfs f0, 4(r3)
/* 80130D98 0012DB98  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80130D9C 0012DB9C  90 A3 00 08 */	stw r5, 8(r3)
/* 80130DA0 0012DBA0  90 03 00 0C */	stw r0, 0xc(r3)
/* 80130DA4 0012DBA4  4E 80 00 20 */	blr 

reset_tag_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80130DA8 0012DBA8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80130DAC 0012DBAC  7C 08 02 A6 */	mflr r0
/* 80130DB0 0012DBB0  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130DB4 0012DBB4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80130DB8 0012DBB8  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80130DBC 0012DBBC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80130DC0 0012DBC0  80 84 00 08 */	lwz r4, 8(r4)
/* 80130DC4 0012DBC4  28 04 00 00 */	cmplwi r4, 0
/* 80130DC8 0012DBC8  41 82 00 3C */	beq lbl_80130E04
/* 80130DCC 0012DBCC  80 84 00 18 */	lwz r4, 0x18(r4)
/* 80130DD0 0012DBD0  38 04 00 18 */	addi r0, r4, 0x18
/* 80130DD4 0012DBD4  7C 00 28 40 */	cmplw r0, r5
/* 80130DD8 0012DBD8  40 82 00 2C */	bne lbl_80130E04
/* 80130DDC 0012DBDC  83 E3 00 10 */	lwz r31, 0x10(r3)
/* 80130DE0 0012DBE0  38 00 00 10 */	li r0, 0x10
/* 80130DE4 0012DBE4  B0 03 00 0C */	sth r0, 0xc(r3)
/* 80130DE8 0012DBE8  4B FF FB 4D */	bl reset_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80130DEC 0012DBEC  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130DF0 0012DBF0  7F E3 FB 78 */	mr r3, r31
/* 80130DF4 0012DBF4  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80130DF8 0012DBF8  3C 84 00 01 */	addis r4, r4, 1
/* 80130DFC 0012DBFC  38 84 8D 38 */	addi r4, r4, -29384
/* 80130E00 0012DC00  4B FF FF 7D */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
lbl_80130E04:
/* 80130E04 0012DC04  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80130E08 0012DC08  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80130E0C 0012DC0C  7C 08 03 A6 */	mtlr r0
/* 80130E10 0012DC10  38 21 00 10 */	addi r1, r1, 0x10
/* 80130E14 0012DC14  4E 80 00 20 */	blr 

trigger_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80130E18 0012DC18  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80130E1C 0012DC1C  7C 08 02 A6 */	mflr r0
/* 80130E20 0012DC20  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130E24 0012DC24  38 A4 B3 20 */	addi r5, r4, lbl_8031B320@l
/* 80130E28 0012DC28  80 83 00 10 */	lwz r4, 0x10(r3)
/* 80130E2C 0012DC2C  3C 65 00 01 */	addis r3, r5, 1
/* 80130E30 0012DC30  90 01 00 14 */	stw r0, 0x14(r1)
/* 80130E34 0012DC34  38 63 8D 38 */	addi r3, r3, -29384
/* 80130E38 0012DC38  4B FF FF 45 */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
/* 80130E3C 0012DC3C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80130E40 0012DC40  38 60 00 01 */	li r3, 1
/* 80130E44 0012DC44  7C 08 03 A6 */	mtlr r0
/* 80130E48 0012DC48  38 21 00 10 */	addi r1, r1, 0x10
/* 80130E4C 0012DC4C  4E 80 00 20 */	blr 

parse_tag_signal__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80130E50 0012DC50  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 80130E54 0012DC54  7C 08 02 A6 */	mflr r0
/* 80130E58 0012DC58  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130E5C 0012DC5C  90 01 00 74 */	stw r0, 0x74(r1)
/* 80130E60 0012DC60  93 E1 00 6C */	stw r31, 0x6c(r1)
/* 80130E64 0012DC64  7C 7F 1B 78 */	mr r31, r3
/* 80130E68 0012DC68  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80130E6C 0012DC6C  80 63 00 08 */	lwz r3, 8(r3)
/* 80130E70 0012DC70  28 03 00 00 */	cmplwi r3, 0
/* 80130E74 0012DC74  41 82 01 10 */	beq lbl_80130F84
/* 80130E78 0012DC78  80 63 00 18 */	lwz r3, 0x18(r3)
/* 80130E7C 0012DC7C  38 03 00 18 */	addi r0, r3, 0x18
/* 80130E80 0012DC80  7C 00 28 40 */	cmplw r0, r5
/* 80130E84 0012DC84  40 82 01 00 */	bne lbl_80130F84
/* 80130E88 0012DC88  38 00 00 00 */	li r0, 0
/* 80130E8C 0012DC8C  7C C3 33 78 */	mr r3, r6
/* 80130E90 0012DC90  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80130E94 0012DC94  4B EF 1A 75 */	bl read_tag__8xtextboxFRC6substr
/* 80130E98 0012DC98  90 81 00 14 */	stw r4, 0x14(r1)
/* 80130E9C 0012DC9C  90 61 00 10 */	stw r3, 0x10(r1)
/* 80130EA0 0012DCA0  88 03 00 08 */	lbz r0, 8(r3)
/* 80130EA4 0012DCA4  28 00 00 3A */	cmplwi r0, 0x3a
/* 80130EA8 0012DCA8  40 82 00 DC */	bne lbl_80130F84
/* 80130EAC 0012DCAC  38 81 00 18 */	addi r4, r1, 0x18
/* 80130EB0 0012DCB0  38 A0 00 14 */	li r5, 0x14
/* 80130EB4 0012DCB4  4B EF 1D 61 */	bl read_list__8xtextboxFRCQ28xtextbox9tag_entryPiUl
/* 80130EB8 0012DCB8  28 03 00 00 */	cmplwi r3, 0
/* 80130EBC 0012DCBC  40 82 00 14 */	bne lbl_80130ED0
/* 80130EC0 0012DCC0  3C 60 80 00 */	lis r3, 0x7FFFFFFF@ha
/* 80130EC4 0012DCC4  38 03 FF FF */	addi r0, r3, 0x7FFFFFFF@l
/* 80130EC8 0012DCC8  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80130ECC 0012DCCC  48 00 00 38 */	b lbl_80130F04
lbl_80130ED0:
/* 80130ED0 0012DCD0  38 A1 00 18 */	addi r5, r1, 0x18
/* 80130ED4 0012DCD4  38 80 00 01 */	li r4, 1
/* 80130ED8 0012DCD8  7C 69 03 A6 */	mtctr r3
/* 80130EDC 0012DCDC  40 81 00 28 */	ble lbl_80130F04
lbl_80130EE0:
/* 80130EE0 0012DCE0  80 05 00 00 */	lwz r0, 0(r5)
/* 80130EE4 0012DCE4  28 00 00 14 */	cmplwi r0, 0x14
/* 80130EE8 0012DCE8  40 80 00 14 */	bge lbl_80130EFC
/* 80130EEC 0012DCEC  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 80130EF0 0012DCF0  7C 80 00 30 */	slw r0, r4, r0
/* 80130EF4 0012DCF4  7C 60 03 78 */	or r0, r3, r0
/* 80130EF8 0012DCF8  90 1F 00 10 */	stw r0, 0x10(r31)
lbl_80130EFC:
/* 80130EFC 0012DCFC  38 A5 00 04 */	addi r5, r5, 4
/* 80130F00 0012DD00  42 00 FF E0 */	bdnz lbl_80130EE0
lbl_80130F04:
/* 80130F04 0012DD04  80 81 00 10 */	lwz r4, 0x10(r1)
/* 80130F08 0012DD08  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80130F0C 0012DD0C  80 A1 00 14 */	lwz r5, 0x14(r1)
/* 80130F10 0012DD10  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80130F14 0012DD14  38 C4 00 14 */	addi r6, r4, 0x14
/* 80130F18 0012DD18  38 80 00 04 */	li r4, 4
/* 80130F1C 0012DD1C  38 05 FF FF */	addi r0, r5, -1
/* 80130F20 0012DD20  90 C1 00 10 */	stw r6, 0x10(r1)
/* 80130F24 0012DD24  38 63 00 43 */	addi r3, r3, 0x43
/* 80130F28 0012DD28  90 01 00 14 */	stw r0, 0x14(r1)
/* 80130F2C 0012DD2C  4B EF 53 F9 */	bl create__6substrFPCcUl
/* 80130F30 0012DD30  90 81 00 0C */	stw r4, 0xc(r1)
/* 80130F34 0012DD34  38 81 00 08 */	addi r4, r1, 8
/* 80130F38 0012DD38  90 61 00 08 */	stw r3, 8(r1)
/* 80130F3C 0012DD3C  38 61 00 10 */	addi r3, r1, 0x10
/* 80130F40 0012DD40  4B EF 1B E5 */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80130F44 0012DD44  28 03 00 00 */	cmplwi r3, 0
/* 80130F48 0012DD48  41 82 00 3C */	beq lbl_80130F84
/* 80130F4C 0012DD4C  88 03 00 08 */	lbz r0, 8(r3)
/* 80130F50 0012DD50  28 00 00 3D */	cmplwi r0, 0x3d
/* 80130F54 0012DD54  40 82 00 24 */	bne lbl_80130F78
/* 80130F58 0012DD58  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80130F5C 0012DD5C  28 00 00 00 */	cmplwi r0, 0
/* 80130F60 0012DD60  41 82 00 18 */	beq lbl_80130F78
/* 80130F64 0012DD64  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80130F68 0012DD68  38 80 00 01 */	li r4, 1
/* 80130F6C 0012DD6C  4B FF F9 0D */	bl read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb
/* 80130F70 0012DD70  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80130F74 0012DD74  40 82 00 10 */	bne lbl_80130F84
lbl_80130F78:
/* 80130F78 0012DD78  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80130F7C 0012DD7C  64 00 80 00 */	oris r0, r0, 0x8000
/* 80130F80 0012DD80  90 1F 00 10 */	stw r0, 0x10(r31)
lbl_80130F84:
/* 80130F84 0012DD84  80 01 00 74 */	lwz r0, 0x74(r1)
/* 80130F88 0012DD88  83 E1 00 6C */	lwz r31, 0x6c(r1)
/* 80130F8C 0012DD8C  7C 08 03 A6 */	mtlr r0
/* 80130F90 0012DD90  38 21 00 70 */	addi r1, r1, 0x70
/* 80130F94 0012DD94  4E 80 00 20 */	blr 

trigger_signal__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80130F98 0012DD98  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80130F9C 0012DD9C  7C 08 02 A6 */	mflr r0
/* 80130FA0 0012DDA0  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80130FA4 0012DDA4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80130FA8 0012DDA8  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 80130FAC 0012DDAC  7C 7F 1B 78 */	mr r31, r3
/* 80130FB0 0012DDB0  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80130FB4 0012DDB4  3C 63 00 01 */	addis r3, r3, 1
/* 80130FB8 0012DDB8  88 03 8D 79 */	lbz r0, -0x7287(r3)
/* 80130FBC 0012DDBC  28 00 00 00 */	cmplwi r0, 0
/* 80130FC0 0012DDC0  41 82 00 18 */	beq lbl_80130FD8
/* 80130FC4 0012DDC4  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80130FC8 0012DDC8  54 00 00 01 */	rlwinm. r0, r0, 0, 0, 0
/* 80130FCC 0012DDCC  40 82 00 0C */	bne lbl_80130FD8
/* 80130FD0 0012DDD0  38 60 00 01 */	li r3, 1
/* 80130FD4 0012DDD4  48 00 00 70 */	b lbl_80131044
lbl_80130FD8:
/* 80130FD8 0012DDD8  3C 60 80 27 */	lis r3, lbl_8026C8D0@ha
/* 80130FDC 0012DDDC  83 BF 00 10 */	lwz r29, 0x10(r31)
/* 80130FE0 0012DDE0  3B 83 C8 D0 */	addi r28, r3, lbl_8026C8D0@l
/* 80130FE4 0012DDE4  3B 60 00 00 */	li r27, 0
/* 80130FE8 0012DDE8  3B C0 00 01 */	li r30, 1
lbl_80130FEC:
/* 80130FEC 0012DDEC  7F C0 D8 30 */	slw r0, r30, r27
/* 80130FF0 0012DDF0  7F A0 00 39 */	and. r0, r29, r0
/* 80130FF4 0012DDF4  41 82 00 0C */	beq lbl_80131000
/* 80130FF8 0012DDF8  80 7C 00 00 */	lwz r3, 0(r28)
/* 80130FFC 0012DDFC  4B FF F6 79 */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_80131000:
/* 80131000 0012DE00  3B 7B 00 01 */	addi r27, r27, 1
/* 80131004 0012DE04  3B 9C 00 04 */	addi r28, r28, 4
/* 80131008 0012DE08  28 1B 00 14 */	cmplwi r27, 0x14
/* 8013100C 0012DE0C  41 80 FF E0 */	blt lbl_80130FEC
/* 80131010 0012DE10  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131014 0012DE14  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131018 0012DE18  3C 63 00 01 */	addis r3, r3, 1
/* 8013101C 0012DE1C  80 63 8D 7C */	lwz r3, -0x7284(r3)
/* 80131020 0012DE20  28 03 00 00 */	cmplwi r3, 0
/* 80131024 0012DE24  41 82 00 1C */	beq lbl_80131040
/* 80131028 0012DE28  81 83 00 00 */	lwz r12, 0(r3)
/* 8013102C 0012DE2C  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80131030 0012DE30  81 8C 00 08 */	lwz r12, 8(r12)
/* 80131034 0012DE34  54 04 00 7E */	clrlwi r4, r0, 1
/* 80131038 0012DE38  7D 89 03 A6 */	mtctr r12
/* 8013103C 0012DE3C  4E 80 04 21 */	bctrl 
lbl_80131040:
/* 80131040 0012DE40  38 60 00 01 */	li r3, 1
lbl_80131044:
/* 80131044 0012DE44  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 80131048 0012DE48  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013104C 0012DE4C  7C 08 03 A6 */	mtlr r0
/* 80131050 0012DE50  38 21 00 20 */	addi r1, r1, 0x20
/* 80131054 0012DE54  4E 80 00 20 */	blr 

/* load_sound_type__22@unnamed@zTalkBox_cpp@FRQ222@unnamed@zTalkBox_cpp@13sound_contextRCQ28xtextbox14tag_entry_list */
load_sound_type__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_13sound_contextRCQ28xtextbox14tag_entry_list:
/* 80131058 0012DE58  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013105C 0012DE5C  7C 08 02 A6 */	mflr r0
/* 80131060 0012DE60  3C A0 80 27 */	lis r5, lbl_8026C920@ha
/* 80131064 0012DE64  90 01 00 24 */	stw r0, 0x24(r1)
/* 80131068 0012DE68  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013106C 0012DE6C  7C 9F 23 78 */	mr r31, r4
/* 80131070 0012DE70  38 85 C9 20 */	addi r4, r5, lbl_8026C920@l
/* 80131074 0012DE74  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80131078 0012DE78  7C 7E 1B 78 */	mr r30, r3
/* 8013107C 0012DE7C  38 64 00 48 */	addi r3, r4, 0x48
/* 80131080 0012DE80  38 80 00 06 */	li r4, 6
/* 80131084 0012DE84  4B EF 52 A1 */	bl create__6substrFPCcUl
/* 80131088 0012DE88  90 81 00 0C */	stw r4, 0xc(r1)
/* 8013108C 0012DE8C  38 81 00 08 */	addi r4, r1, 8
/* 80131090 0012DE90  90 61 00 08 */	stw r3, 8(r1)
/* 80131094 0012DE94  7F E3 FB 78 */	mr r3, r31
/* 80131098 0012DE98  4B EF 1A 8D */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 8013109C 0012DE9C  28 03 00 00 */	cmplwi r3, 0
/* 801310A0 0012DEA0  41 82 00 38 */	beq lbl_801310D8
/* 801310A4 0012DEA4  38 9E 00 08 */	addi r4, r30, 8
/* 801310A8 0012DEA8  38 A0 00 02 */	li r5, 2
/* 801310AC 0012DEAC  4B EF 1A E9 */	bl read_list__8xtextboxFRCQ28xtextbox9tag_entryPfUl
/* 801310B0 0012DEB0  28 03 00 01 */	cmplwi r3, 1
/* 801310B4 0012DEB4  40 82 00 0C */	bne lbl_801310C0
/* 801310B8 0012DEB8  C0 1E 00 08 */	lfs f0, 8(r30)
/* 801310BC 0012DEBC  D0 1E 00 0C */	stfs f0, 0xc(r30)
lbl_801310C0:
/* 801310C0 0012DEC0  28 03 00 00 */	cmplwi r3, 0
/* 801310C4 0012DEC4  41 82 00 14 */	beq lbl_801310D8
/* 801310C8 0012DEC8  38 00 00 01 */	li r0, 1
/* 801310CC 0012DECC  38 60 00 01 */	li r3, 1
/* 801310D0 0012DED0  98 1E 00 05 */	stb r0, 5(r30)
/* 801310D4 0012DED4  48 00 00 1C */	b lbl_801310F0
lbl_801310D8:
/* 801310D8 0012DED8  C0 02 A3 2C */	lfs f0, lbl_803CECAC-_SDA2_BASE_(r2)
/* 801310DC 0012DEDC  38 00 00 01 */	li r0, 1
/* 801310E0 0012DEE0  38 60 00 01 */	li r3, 1
/* 801310E4 0012DEE4  D0 1E 00 08 */	stfs f0, 8(r30)
/* 801310E8 0012DEE8  D0 1E 00 0C */	stfs f0, 0xc(r30)
/* 801310EC 0012DEEC  98 1E 00 05 */	stb r0, 5(r30)
lbl_801310F0:
/* 801310F0 0012DEF0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801310F4 0012DEF4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801310F8 0012DEF8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801310FC 0012DEFC  7C 08 03 A6 */	mtlr r0
/* 80131100 0012DF00  38 21 00 20 */	addi r1, r1, 0x20
/* 80131104 0012DF04  4E 80 00 20 */	blr 

parse_tag_sound__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131108 0012DF08  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 8013110C 0012DF0C  7C 08 02 A6 */	mflr r0
/* 80131110 0012DF10  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131114 0012DF14  90 01 00 84 */	stw r0, 0x84(r1)
/* 80131118 0012DF18  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 8013111C 0012DF1C  93 C1 00 78 */	stw r30, 0x78(r1)
/* 80131120 0012DF20  7C 7E 1B 78 */	mr r30, r3
/* 80131124 0012DF24  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80131128 0012DF28  93 A1 00 74 */	stw r29, 0x74(r1)
/* 8013112C 0012DF2C  80 63 00 08 */	lwz r3, 8(r3)
/* 80131130 0012DF30  28 03 00 00 */	cmplwi r3, 0
/* 80131134 0012DF34  41 82 02 F0 */	beq lbl_80131424
/* 80131138 0012DF38  80 63 00 18 */	lwz r3, 0x18(r3)
/* 8013113C 0012DF3C  38 03 00 18 */	addi r0, r3, 0x18
/* 80131140 0012DF40  7C 00 28 40 */	cmplw r0, r5
/* 80131144 0012DF44  40 82 02 E0 */	bne lbl_80131424
/* 80131148 0012DF48  83 FE 00 10 */	lwz r31, 0x10(r30)
/* 8013114C 0012DF4C  7C C3 33 78 */	mr r3, r6
/* 80131150 0012DF50  4B EF 17 B9 */	bl read_tag__8xtextboxFRC6substr
/* 80131154 0012DF54  90 81 00 48 */	stw r4, 0x48(r1)
/* 80131158 0012DF58  3C A0 80 27 */	lis r5, lbl_8026C920@ha
/* 8013115C 0012DF5C  38 00 00 00 */	li r0, 0
/* 80131160 0012DF60  38 80 00 06 */	li r4, 6
/* 80131164 0012DF64  90 61 00 44 */	stw r3, 0x44(r1)
/* 80131168 0012DF68  38 65 C9 20 */	addi r3, r5, lbl_8026C920@l
/* 8013116C 0012DF6C  38 63 00 4F */	addi r3, r3, 0x4f
/* 80131170 0012DF70  98 1F 00 04 */	stb r0, 4(r31)
/* 80131174 0012DF74  4B EF 51 B1 */	bl create__6substrFPCcUl
/* 80131178 0012DF78  90 81 00 40 */	stw r4, 0x40(r1)
/* 8013117C 0012DF7C  38 81 00 3C */	addi r4, r1, 0x3c
/* 80131180 0012DF80  90 61 00 3C */	stw r3, 0x3c(r1)
/* 80131184 0012DF84  38 61 00 44 */	addi r3, r1, 0x44
/* 80131188 0012DF88  4B EF 19 9D */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 8013118C 0012DF8C  28 03 00 00 */	cmplwi r3, 0
/* 80131190 0012DF90  41 82 00 88 */	beq lbl_80131218
/* 80131194 0012DF94  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80131198 0012DF98  28 00 00 00 */	cmplwi r0, 0
/* 8013119C 0012DF9C  41 82 00 7C */	beq lbl_80131218
/* 801311A0 0012DFA0  3C 80 80 27 */	lis r4, lbl_8026C920@ha
/* 801311A4 0012DFA4  83 A3 00 0C */	lwz r29, 0xc(r3)
/* 801311A8 0012DFA8  38 64 C9 20 */	addi r3, r4, lbl_8026C920@l
/* 801311AC 0012DFAC  38 80 00 03 */	li r4, 3
/* 801311B0 0012DFB0  38 63 00 56 */	addi r3, r3, 0x56
/* 801311B4 0012DFB4  4B EF 51 71 */	bl create__6substrFPCcUl
/* 801311B8 0012DFB8  90 81 00 38 */	stw r4, 0x38(r1)
/* 801311BC 0012DFBC  38 81 00 34 */	addi r4, r1, 0x34
/* 801311C0 0012DFC0  90 61 00 34 */	stw r3, 0x34(r1)
/* 801311C4 0012DFC4  7F A3 EB 78 */	mr r3, r29
/* 801311C8 0012DFC8  4B F1 B7 6D */	bl icompare__FRC6substrRC6substr
/* 801311CC 0012DFCC  2C 03 00 00 */	cmpwi r3, 0
/* 801311D0 0012DFD0  40 82 00 10 */	bne lbl_801311E0
/* 801311D4 0012DFD4  38 00 00 01 */	li r0, 1
/* 801311D8 0012DFD8  98 1F 00 04 */	stb r0, 4(r31)
/* 801311DC 0012DFDC  48 00 00 3C */	b lbl_80131218
lbl_801311E0:
/* 801311E0 0012DFE0  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 801311E4 0012DFE4  38 80 00 06 */	li r4, 6
/* 801311E8 0012DFE8  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 801311EC 0012DFEC  38 63 00 5A */	addi r3, r3, 0x5a
/* 801311F0 0012DFF0  4B EF 51 35 */	bl create__6substrFPCcUl
/* 801311F4 0012DFF4  90 81 00 30 */	stw r4, 0x30(r1)
/* 801311F8 0012DFF8  38 81 00 2C */	addi r4, r1, 0x2c
/* 801311FC 0012DFFC  90 61 00 2C */	stw r3, 0x2c(r1)
/* 80131200 0012E000  7F A3 EB 78 */	mr r3, r29
/* 80131204 0012E004  4B F1 B7 31 */	bl icompare__FRC6substrRC6substr
/* 80131208 0012E008  2C 03 00 00 */	cmpwi r3, 0
/* 8013120C 0012E00C  40 82 00 0C */	bne lbl_80131218
/* 80131210 0012E010  38 00 00 02 */	li r0, 2
/* 80131214 0012E014  98 1F 00 04 */	stb r0, 4(r31)
lbl_80131218:
/* 80131218 0012E018  88 1F 00 04 */	lbz r0, 4(r31)
/* 8013121C 0012E01C  80 61 00 44 */	lwz r3, 0x44(r1)
/* 80131220 0012E020  2C 00 00 02 */	cmpwi r0, 2
/* 80131224 0012E024  40 82 00 10 */	bne lbl_80131234
/* 80131228 0012E028  38 00 00 00 */	li r0, 0
/* 8013122C 0012E02C  90 1F 00 00 */	stw r0, 0(r31)
/* 80131230 0012E030  48 00 00 38 */	b lbl_80131268
lbl_80131234:
/* 80131234 0012E034  88 03 00 08 */	lbz r0, 8(r3)
/* 80131238 0012E038  28 00 00 3A */	cmplwi r0, 0x3a
/* 8013123C 0012E03C  40 82 01 E8 */	bne lbl_80131424
/* 80131240 0012E040  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80131244 0012E044  28 00 00 00 */	cmplwi r0, 0
/* 80131248 0012E048  41 82 01 DC */	beq lbl_80131424
/* 8013124C 0012E04C  80 83 00 0C */	lwz r4, 0xc(r3)
/* 80131250 0012E050  80 64 00 00 */	lwz r3, 0(r4)
/* 80131254 0012E054  80 84 00 04 */	lwz r4, 4(r4)
/* 80131258 0012E058  4B F1 AF F9 */	bl xStrHash__FPCcUl
/* 8013125C 0012E05C  90 7F 00 00 */	stw r3, 0(r31)
/* 80131260 0012E060  48 00 00 08 */	b lbl_80131268
/* 80131264 0012E064  48 00 01 C0 */	b lbl_80131424
lbl_80131268:
/* 80131268 0012E068  80 1F 00 00 */	lwz r0, 0(r31)
/* 8013126C 0012E06C  28 00 00 00 */	cmplwi r0, 0
/* 80131270 0012E070  41 82 00 1C */	beq lbl_8013128C
/* 80131274 0012E074  88 1F 00 04 */	lbz r0, 4(r31)
/* 80131278 0012E078  2C 00 00 02 */	cmpwi r0, 2
/* 8013127C 0012E07C  41 82 00 10 */	beq lbl_8013128C
/* 80131280 0012E080  7F E3 FB 78 */	mr r3, r31
/* 80131284 0012E084  38 81 00 44 */	addi r4, r1, 0x44
/* 80131288 0012E088  4B FF FD D1 */	bl load_sound_type__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_13sound_contextRCQ28xtextbox14tag_entry_list
lbl_8013128C:
/* 8013128C 0012E08C  38 00 00 02 */	li r0, 2
/* 80131290 0012E090  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80131294 0012E094  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80131298 0012E098  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8013129C 0012E09C  38 63 00 61 */	addi r3, r3, 0x61
/* 801312A0 0012E0A0  38 80 00 07 */	li r4, 7
/* 801312A4 0012E0A4  4B EF 50 81 */	bl create__6substrFPCcUl
/* 801312A8 0012E0A8  90 81 00 28 */	stw r4, 0x28(r1)
/* 801312AC 0012E0AC  38 81 00 24 */	addi r4, r1, 0x24
/* 801312B0 0012E0B0  90 61 00 24 */	stw r3, 0x24(r1)
/* 801312B4 0012E0B4  38 61 00 44 */	addi r3, r1, 0x44
/* 801312B8 0012E0B8  4B EF 18 6D */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 801312BC 0012E0BC  28 03 00 00 */	cmplwi r3, 0
/* 801312C0 0012E0C0  41 82 00 A4 */	beq lbl_80131364
/* 801312C4 0012E0C4  80 03 00 10 */	lwz r0, 0x10(r3)
/* 801312C8 0012E0C8  28 00 00 00 */	cmplwi r0, 0
/* 801312CC 0012E0CC  41 82 00 98 */	beq lbl_80131364
/* 801312D0 0012E0D0  3C 80 80 27 */	lis r4, lbl_8026C920@ha
/* 801312D4 0012E0D4  83 A3 00 0C */	lwz r29, 0xc(r3)
/* 801312D8 0012E0D8  38 64 C9 20 */	addi r3, r4, lbl_8026C920@l
/* 801312DC 0012E0DC  38 80 00 02 */	li r4, 2
/* 801312E0 0012E0E0  38 63 00 69 */	addi r3, r3, 0x69
/* 801312E4 0012E0E4  4B EF 50 41 */	bl create__6substrFPCcUl
/* 801312E8 0012E0E8  90 81 00 20 */	stw r4, 0x20(r1)
/* 801312EC 0012E0EC  38 81 00 1C */	addi r4, r1, 0x1c
/* 801312F0 0012E0F0  90 61 00 1C */	stw r3, 0x1c(r1)
/* 801312F4 0012E0F4  7F A3 EB 78 */	mr r3, r29
/* 801312F8 0012E0F8  4B F1 B6 3D */	bl icompare__FRC6substrRC6substr
/* 801312FC 0012E0FC  2C 03 00 00 */	cmpwi r3, 0
/* 80131300 0012E100  40 82 00 10 */	bne lbl_80131310
/* 80131304 0012E104  38 00 00 01 */	li r0, 1
/* 80131308 0012E108  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8013130C 0012E10C  48 00 00 58 */	b lbl_80131364
lbl_80131310:
/* 80131310 0012E110  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80131314 0012E114  38 80 00 04 */	li r4, 4
/* 80131318 0012E118  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 8013131C 0012E11C  38 63 00 6C */	addi r3, r3, 0x6c
/* 80131320 0012E120  4B EF 50 05 */	bl create__6substrFPCcUl
/* 80131324 0012E124  90 81 00 18 */	stw r4, 0x18(r1)
/* 80131328 0012E128  38 81 00 14 */	addi r4, r1, 0x14
/* 8013132C 0012E12C  90 61 00 14 */	stw r3, 0x14(r1)
/* 80131330 0012E130  7F A3 EB 78 */	mr r3, r29
/* 80131334 0012E134  4B F1 B6 01 */	bl icompare__FRC6substrRC6substr
/* 80131338 0012E138  2C 03 00 00 */	cmpwi r3, 0
/* 8013133C 0012E13C  40 82 00 10 */	bne lbl_8013134C
/* 80131340 0012E140  38 00 00 00 */	li r0, 0
/* 80131344 0012E144  90 1F 00 14 */	stw r0, 0x14(r31)
/* 80131348 0012E148  48 00 00 1C */	b lbl_80131364
lbl_8013134C:
/* 8013134C 0012E14C  80 9D 00 04 */	lwz r4, 4(r29)
/* 80131350 0012E150  28 04 00 00 */	cmplwi r4, 0
/* 80131354 0012E154  41 82 00 10 */	beq lbl_80131364
/* 80131358 0012E158  80 7D 00 00 */	lwz r3, 0(r29)
/* 8013135C 0012E15C  4B F1 AE F5 */	bl xStrHash__FPCcUl
/* 80131360 0012E160  90 7F 00 14 */	stw r3, 0x14(r31)
lbl_80131364:
/* 80131364 0012E164  38 00 00 00 */	li r0, 0
/* 80131368 0012E168  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 8013136C 0012E16C  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80131370 0012E170  98 1F 00 07 */	stb r0, 7(r31)
/* 80131374 0012E174  38 63 00 71 */	addi r3, r3, 0x71
/* 80131378 0012E178  38 80 00 04 */	li r4, 4
/* 8013137C 0012E17C  4B EF 4F A9 */	bl create__6substrFPCcUl
/* 80131380 0012E180  90 81 00 10 */	stw r4, 0x10(r1)
/* 80131384 0012E184  38 81 00 0C */	addi r4, r1, 0xc
/* 80131388 0012E188  90 61 00 0C */	stw r3, 0xc(r1)
/* 8013138C 0012E18C  38 61 00 44 */	addi r3, r1, 0x44
/* 80131390 0012E190  4B EF 17 95 */	bl find_entry__8xtextboxFRCQ28xtextbox14tag_entry_listRC6substr
/* 80131394 0012E194  28 03 00 00 */	cmplwi r3, 0
/* 80131398 0012E198  41 82 00 2C */	beq lbl_801313C4
/* 8013139C 0012E19C  80 03 00 10 */	lwz r0, 0x10(r3)
/* 801313A0 0012E1A0  28 00 00 00 */	cmplwi r0, 0
/* 801313A4 0012E1A4  41 82 00 20 */	beq lbl_801313C4
/* 801313A8 0012E1A8  38 00 00 00 */	li r0, 0
/* 801313AC 0012E1AC  38 81 00 08 */	addi r4, r1, 8
/* 801313B0 0012E1B0  90 01 00 08 */	stw r0, 8(r1)
/* 801313B4 0012E1B4  38 A0 00 01 */	li r5, 1
/* 801313B8 0012E1B8  4B EF 18 5D */	bl read_list__8xtextboxFRCQ28xtextbox9tag_entryPiUl
/* 801313BC 0012E1BC  80 01 00 08 */	lwz r0, 8(r1)
/* 801313C0 0012E1C0  98 1F 00 07 */	stb r0, 7(r31)
lbl_801313C4:
/* 801313C4 0012E1C4  80 7F 00 00 */	lwz r3, 0(r31)
/* 801313C8 0012E1C8  28 03 00 00 */	cmplwi r3, 0
/* 801313CC 0012E1CC  41 82 00 58 */	beq lbl_80131424
/* 801313D0 0012E1D0  38 81 00 4C */	addi r4, r1, 0x4c
/* 801313D4 0012E1D4  4B F1 A5 89 */	bl xSTGetAssetInfo__FUiP20st_PKR_ASSET_TOCINFO
/* 801313D8 0012E1D8  2C 03 00 00 */	cmpwi r3, 0
/* 801313DC 0012E1DC  40 82 00 08 */	bne lbl_801313E4
/* 801313E0 0012E1E0  48 00 00 44 */	b lbl_80131424
lbl_801313E4:
/* 801313E4 0012E1E4  80 61 00 50 */	lwz r3, 0x50(r1)
/* 801313E8 0012E1E8  80 63 00 00 */	lwz r3, 0(r3)
/* 801313EC 0012E1EC  3C 03 AC B2 */	addis r0, r3, 0xacb2
/* 801313F0 0012E1F0  28 00 44 20 */	cmplwi r0, 0x4420
/* 801313F4 0012E1F4  40 82 00 10 */	bne lbl_80131404
/* 801313F8 0012E1F8  38 00 00 00 */	li r0, 0
/* 801313FC 0012E1FC  98 1F 00 06 */	stb r0, 6(r31)
/* 80131400 0012E200  48 00 00 1C */	b lbl_8013141C
lbl_80131404:
/* 80131404 0012E204  28 00 44 53 */	cmplwi r0, 0x4453
/* 80131408 0012E208  40 82 00 1C */	bne lbl_80131424
/* 8013140C 0012E20C  38 00 00 01 */	li r0, 1
/* 80131410 0012E210  98 1F 00 06 */	stb r0, 6(r31)
/* 80131414 0012E214  48 00 00 08 */	b lbl_8013141C
/* 80131418 0012E218  48 00 00 0C */	b lbl_80131424
lbl_8013141C:
/* 8013141C 0012E21C  38 00 00 18 */	li r0, 0x18
/* 80131420 0012E220  B0 1E 00 0C */	sth r0, 0xc(r30)
lbl_80131424:
/* 80131424 0012E224  80 01 00 84 */	lwz r0, 0x84(r1)
/* 80131428 0012E228  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 8013142C 0012E22C  83 C1 00 78 */	lwz r30, 0x78(r1)
/* 80131430 0012E230  83 A1 00 74 */	lwz r29, 0x74(r1)
/* 80131434 0012E234  7C 08 03 A6 */	mtlr r0
/* 80131438 0012E238  38 21 00 80 */	addi r1, r1, 0x80
/* 8013143C 0012E23C  4E 80 00 20 */	blr 

reset_tag_sound__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131440 0012E240  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131444 0012E244  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131448 0012E248  80 84 00 08 */	lwz r4, 8(r4)
/* 8013144C 0012E24C  28 04 00 00 */	cmplwi r4, 0
/* 80131450 0012E250  4D 82 00 20 */	beqlr 
/* 80131454 0012E254  80 84 00 18 */	lwz r4, 0x18(r4)
/* 80131458 0012E258  38 04 00 18 */	addi r0, r4, 0x18
/* 8013145C 0012E25C  7C 00 28 40 */	cmplw r0, r5
/* 80131460 0012E260  4C 82 00 20 */	bnelr 
/* 80131464 0012E264  80 A3 00 10 */	lwz r5, 0x10(r3)
/* 80131468 0012E268  38 80 00 18 */	li r4, 0x18
/* 8013146C 0012E26C  38 00 00 00 */	li r0, 0
/* 80131470 0012E270  B0 83 00 0C */	sth r4, 0xc(r3)
/* 80131474 0012E274  90 05 00 00 */	stw r0, 0(r5)
/* 80131478 0012E278  98 05 00 04 */	stb r0, 4(r5)
/* 8013147C 0012E27C  4E 80 00 20 */	blr 

trigger_sound__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80131480 0012E280  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80131484 0012E284  7C 08 02 A6 */	mflr r0
/* 80131488 0012E288  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 8013148C 0012E28C  90 01 00 34 */	stw r0, 0x34(r1)
/* 80131490 0012E290  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131494 0012E294  3C 84 00 01 */	addis r4, r4, 1
/* 80131498 0012E298  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 8013149C 0012E29C  88 04 8D 79 */	lbz r0, -0x7287(r4)
/* 801314A0 0012E2A0  28 00 00 00 */	cmplwi r0, 0
/* 801314A4 0012E2A4  41 82 00 1C */	beq lbl_801314C0
/* 801314A8 0012E2A8  7C 83 23 78 */	mr r3, r4
/* 801314AC 0012E2AC  38 63 8D 5C */	addi r3, r3, -29348
/* 801314B0 0012E2B0  48 00 28 29 */	bl clear__14sound_queue_esc__0_4_esc__1_Fv
/* 801314B4 0012E2B4  4B FF F1 49 */	bl speak_stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801314B8 0012E2B8  38 60 00 01 */	li r3, 1
/* 801314BC 0012E2BC  48 00 02 34 */	b lbl_801316F0
lbl_801314C0:
/* 801314C0 0012E2C0  83 E3 00 10 */	lwz r31, 0x10(r3)
/* 801314C4 0012E2C4  88 1F 00 04 */	lbz r0, 4(r31)
/* 801314C8 0012E2C8  7C 00 07 74 */	extsb r0, r0
/* 801314CC 0012E2CC  2C 00 00 01 */	cmpwi r0, 1
/* 801314D0 0012E2D0  41 82 00 4C */	beq lbl_8013151C
/* 801314D4 0012E2D4  40 80 00 10 */	bge lbl_801314E4
/* 801314D8 0012E2D8  2C 00 00 00 */	cmpwi r0, 0
/* 801314DC 0012E2DC  40 80 00 30 */	bge lbl_8013150C
/* 801314E0 0012E2E0  48 00 00 3C */	b lbl_8013151C
lbl_801314E4:
/* 801314E4 0012E2E4  2C 00 00 03 */	cmpwi r0, 3
/* 801314E8 0012E2E8  40 80 00 34 */	bge lbl_8013151C
/* 801314EC 0012E2EC  3B A4 8D 5C */	addi r29, r4, -29348
/* 801314F0 0012E2F0  7F A3 EB 78 */	mr r3, r29
/* 801314F4 0012E2F4  48 00 27 C5 */	bl size__14sound_queue_esc__0_4_esc__1_CFv
/* 801314F8 0012E2F8  2C 03 00 00 */	cmpwi r3, 0
/* 801314FC 0012E2FC  40 81 01 F0 */	ble lbl_801316EC
/* 80131500 0012E300  7F A3 EB 78 */	mr r3, r29
/* 80131504 0012E304  48 00 27 51 */	bl pop__14sound_queue_esc__0_4_esc__1_Fv
/* 80131508 0012E308  48 00 01 E4 */	b lbl_801316EC
lbl_8013150C:
/* 8013150C 0012E30C  7C 83 23 78 */	mr r3, r4
/* 80131510 0012E310  38 63 8D 5C */	addi r3, r3, -29348
/* 80131514 0012E314  48 00 27 C5 */	bl clear__14sound_queue_esc__0_4_esc__1_Fv
/* 80131518 0012E318  4B FF F0 E5 */	bl speak_stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_8013151C:
/* 8013151C 0012E31C  80 9F 00 00 */	lwz r4, 0(r31)
/* 80131520 0012E320  28 04 00 00 */	cmplwi r4, 0
/* 80131524 0012E324  40 82 00 0C */	bne lbl_80131530
/* 80131528 0012E328  38 60 00 01 */	li r3, 1
/* 8013152C 0012E32C  48 00 01 C4 */	b lbl_801316F0
lbl_80131530:
/* 80131530 0012E330  C0 3F 00 08 */	lfs f1, 8(r31)
/* 80131534 0012E334  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 80131538 0012E338  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8013153C 0012E33C  40 81 00 08 */	ble lbl_80131544
/* 80131540 0012E340  48 00 00 08 */	b lbl_80131548
lbl_80131544:
/* 80131544 0012E344  FC 20 00 90 */	fmr f1, f0
lbl_80131548:
/* 80131548 0012E348  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013154C 0012E34C  C0 42 A3 28 */	lfs f2, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80131550 0012E350  38 E3 B3 20 */	addi r7, r3, lbl_8031B320@l
/* 80131554 0012E354  38 A0 00 80 */	li r5, 0x80
/* 80131558 0012E358  3C 67 00 01 */	addis r3, r7, 1
/* 8013155C 0012E35C  38 C0 00 00 */	li r6, 0
/* 80131560 0012E360  C0 03 8E 90 */	lfs f0, -0x7170(r3)
/* 80131564 0012E364  7C 7D 1B 78 */	mr r29, r3
/* 80131568 0012E368  80 03 8D 58 */	lwz r0, -0x72a8(r3)
/* 8013156C 0012E36C  39 00 00 01 */	li r8, 1
/* 80131570 0012E370  EC 20 00 72 */	fmuls f1, f0, f1
/* 80131574 0012E374  38 63 8D 5C */	addi r3, r3, -29348
/* 80131578 0012E378  7C E7 02 14 */	add r7, r7, r0
/* 8013157C 0012E37C  3C E7 00 01 */	addis r7, r7, 1
/* 80131580 0012E380  38 E7 8D 56 */	addi r7, r7, -29354
/* 80131584 0012E384  4B EF E5 7D */	bl play__14sound_queue_esc__0_4_esc__1_FUiffUiUiUi14sound_category
/* 80131588 0012E388  80 1D 8D 58 */	lwz r0, -0x72a8(r29)
/* 8013158C 0012E38C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131590 0012E390  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 80131594 0012E394  3B C0 00 00 */	li r30, 0
/* 80131598 0012E398  68 00 00 01 */	xori r0, r0, 1
/* 8013159C 0012E39C  3B 80 00 00 */	li r28, 0
/* 801315A0 0012E3A0  90 1D 8D 58 */	stw r0, -0x72a8(r29)
/* 801315A4 0012E3A4  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 801315A8 0012E3A8  80 84 00 08 */	lwz r4, 8(r4)
/* 801315AC 0012E3AC  2C 03 00 01 */	cmpwi r3, 1
/* 801315B0 0012E3B0  41 82 00 20 */	beq lbl_801315D0
/* 801315B4 0012E3B4  40 80 00 10 */	bge lbl_801315C4
/* 801315B8 0012E3B8  2C 03 00 00 */	cmpwi r3, 0
/* 801315BC 0012E3BC  40 80 00 C0 */	bge lbl_8013167C
/* 801315C0 0012E3C0  48 00 00 28 */	b lbl_801315E8
lbl_801315C4:
/* 801315C4 0012E3C4  2C 03 00 03 */	cmpwi r3, 3
/* 801315C8 0012E3C8  40 80 00 20 */	bge lbl_801315E8
/* 801315CC 0012E3CC  48 00 00 14 */	b lbl_801315E0
lbl_801315D0:
/* 801315D0 0012E3D0  3C 60 80 3C */	lis r3, globals@ha
/* 801315D4 0012E3D4  38 63 05 58 */	addi r3, r3, globals@l
/* 801315D8 0012E3D8  3B 83 06 E0 */	addi r28, r3, 0x6e0
/* 801315DC 0012E3DC  48 00 00 A0 */	b lbl_8013167C
lbl_801315E0:
/* 801315E0 0012E3E0  83 C4 00 38 */	lwz r30, 0x38(r4)
/* 801315E4 0012E3E4  48 00 00 98 */	b lbl_8013167C
lbl_801315E8:
/* 801315E8 0012E3E8  4B F8 34 55 */	bl zSceneFindObject__FUi
/* 801315EC 0012E3EC  28 03 00 00 */	cmplwi r3, 0
/* 801315F0 0012E3F0  90 61 00 08 */	stw r3, 8(r1)
/* 801315F4 0012E3F4  41 82 00 88 */	beq lbl_8013167C
/* 801315F8 0012E3F8  88 03 00 04 */	lbz r0, 4(r3)
/* 801315FC 0012E3FC  28 00 00 2B */	cmplwi r0, 0x2b
/* 80131600 0012E400  40 82 00 0C */	bne lbl_8013160C
/* 80131604 0012E404  7C 7E 1B 78 */	mr r30, r3
/* 80131608 0012E408  48 00 00 74 */	b lbl_8013167C
lbl_8013160C:
/* 8013160C 0012E40C  28 00 00 03 */	cmplwi r0, 3
/* 80131610 0012E410  40 82 00 14 */	bne lbl_80131624
/* 80131614 0012E414  3C 60 80 3C */	lis r3, globals@ha
/* 80131618 0012E418  38 63 05 58 */	addi r3, r3, globals@l
/* 8013161C 0012E41C  3B 83 06 E0 */	addi r28, r3, 0x6e0
/* 80131620 0012E420  48 00 00 5C */	b lbl_8013167C
lbl_80131624:
/* 80131624 0012E424  28 00 00 11 */	cmplwi r0, 0x11
/* 80131628 0012E428  40 82 00 54 */	bne lbl_8013167C
/* 8013162C 0012E42C  38 61 00 08 */	addi r3, r1, 8
/* 80131630 0012E430  3B 60 00 00 */	li r27, 0
/* 80131634 0012E434  4B EF B8 49 */	bl xGroupGetCount__FP6xGroup
/* 80131638 0012E438  7C 7D 1B 78 */	mr r29, r3
/* 8013163C 0012E43C  48 00 00 38 */	b lbl_80131674
lbl_80131640:
/* 80131640 0012E440  7F 64 DB 78 */	mr r4, r27
/* 80131644 0012E444  38 61 00 08 */	addi r3, r1, 8
/* 80131648 0012E448  4B EF B8 41 */	bl xGroupGetItemPtr__FP6xGroupUi
/* 8013164C 0012E44C  7C 64 1B 79 */	or. r4, r3, r3
/* 80131650 0012E450  41 82 00 20 */	beq lbl_80131670
/* 80131654 0012E454  88 04 00 04 */	lbz r0, 4(r4)
/* 80131658 0012E458  28 00 00 2B */	cmplwi r0, 0x2b
/* 8013165C 0012E45C  40 82 00 14 */	bne lbl_80131670
/* 80131660 0012E460  7C 9E 23 78 */	mr r30, r4
/* 80131664 0012E464  4B ED CF D5 */	bl xEntIsVisible__FPC4xEnt
/* 80131668 0012E468  28 03 00 00 */	cmplwi r3, 0
/* 8013166C 0012E46C  40 82 00 10 */	bne lbl_8013167C
lbl_80131670:
/* 80131670 0012E470  3B 7B 00 01 */	addi r27, r27, 1
lbl_80131674:
/* 80131674 0012E474  7C 1B E8 40 */	cmplw r27, r29
/* 80131678 0012E478  41 80 FF C8 */	blt lbl_80131640
lbl_8013167C:
/* 8013167C 0012E47C  28 1E 00 00 */	cmplwi r30, 0
/* 80131680 0012E480  41 82 00 3C */	beq lbl_801316BC
/* 80131684 0012E484  7F C3 F3 78 */	mr r3, r30
/* 80131688 0012E488  88 9F 00 07 */	lbz r4, 7(r31)
/* 8013168C 0012E48C  81 9E 01 B8 */	lwz r12, 0x1b8(r30)
/* 80131690 0012E490  38 A0 00 00 */	li r5, 0
/* 80131694 0012E494  38 C4 FF FF */	addi r6, r4, -1
/* 80131698 0012E498  80 9F 00 00 */	lwz r4, 0(r31)
/* 8013169C 0012E49C  81 8C 00 A8 */	lwz r12, 0xa8(r12)
/* 801316A0 0012E4A0  7D 89 03 A6 */	mtctr r12
/* 801316A4 0012E4A4  4E 80 04 21 */	bctrl 
/* 801316A8 0012E4A8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801316AC 0012E4AC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801316B0 0012E4B0  3C 63 00 01 */	addis r3, r3, 1
/* 801316B4 0012E4B4  93 C3 8E 94 */	stw r30, -0x716c(r3)
/* 801316B8 0012E4B8  48 00 00 34 */	b lbl_801316EC
lbl_801316BC:
/* 801316BC 0012E4BC  28 1C 00 00 */	cmplwi r28, 0
/* 801316C0 0012E4C0  41 82 00 2C */	beq lbl_801316EC
/* 801316C4 0012E4C4  88 BF 00 07 */	lbz r5, 7(r31)
/* 801316C8 0012E4C8  38 80 00 00 */	li r4, 0
/* 801316CC 0012E4CC  80 7F 00 00 */	lwz r3, 0(r31)
/* 801316D0 0012E4D0  38 A5 FF FF */	addi r5, r5, -1
/* 801316D4 0012E4D4  4B F3 9F F9 */	bl zEntPlayerSpeakStart__FUiUii
/* 801316D8 0012E4D8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801316DC 0012E4DC  38 00 00 01 */	li r0, 1
/* 801316E0 0012E4E0  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801316E4 0012E4E4  3C 63 00 01 */	addis r3, r3, 1
/* 801316E8 0012E4E8  90 03 8E 98 */	stw r0, -0x7168(r3)
lbl_801316EC:
/* 801316EC 0012E4EC  38 60 00 01 */	li r3, 1
lbl_801316F0:
/* 801316F0 0012E4F0  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 801316F4 0012E4F4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801316F8 0012E4F8  7C 08 03 A6 */	mtlr r0
/* 801316FC 0012E4FC  38 21 00 30 */	addi r1, r1, 0x30
/* 80131700 0012E500  4E 80 00 20 */	blr 

parse_tag_pause__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131704 0012E504  4E 80 00 20 */	blr 

reset_tag_pause__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131708 0012E508  4E 80 00 20 */	blr 

trigger_pause__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 8013170C 0012E50C  38 60 00 01 */	li r3, 1
/* 80131710 0012E510  4E 80 00 20 */	blr 

parse_tag_allow_quit__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131714 0012E514  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131718 0012E518  7C 08 02 A6 */	mflr r0
/* 8013171C 0012E51C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131720 0012E520  80 06 00 14 */	lwz r0, 0x14(r6)
/* 80131724 0012E524  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131728 0012E528  3B E0 00 00 */	li r31, 0
/* 8013172C 0012E52C  28 00 00 01 */	cmplwi r0, 1
/* 80131730 0012E530  93 C1 00 08 */	stw r30, 8(r1)
/* 80131734 0012E534  7C 7E 1B 78 */	mr r30, r3
/* 80131738 0012E538  40 82 00 28 */	bne lbl_80131760
/* 8013173C 0012E53C  80 66 00 10 */	lwz r3, 0x10(r6)
/* 80131740 0012E540  88 03 00 00 */	lbz r0, 0(r3)
/* 80131744 0012E544  28 00 00 3D */	cmplwi r0, 0x3d
/* 80131748 0012E548  40 82 00 18 */	bne lbl_80131760
/* 8013174C 0012E54C  38 66 00 18 */	addi r3, r6, 0x18
/* 80131750 0012E550  38 80 00 01 */	li r4, 1
/* 80131754 0012E554  4B FF F1 25 */	bl read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb
/* 80131758 0012E558  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8013175C 0012E55C  41 82 00 08 */	beq lbl_80131764
lbl_80131760:
/* 80131760 0012E560  3B E0 00 01 */	li r31, 1
lbl_80131764:
/* 80131764 0012E564  9B FE 00 10 */	stb r31, 0x10(r30)
/* 80131768 0012E568  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013176C 0012E56C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131770 0012E570  83 C1 00 08 */	lwz r30, 8(r1)
/* 80131774 0012E574  7C 08 03 A6 */	mtlr r0
/* 80131778 0012E578  38 21 00 10 */	addi r1, r1, 0x10
/* 8013177C 0012E57C  4E 80 00 20 */	blr 

reset_tag_allow_quit__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131780 0012E580  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131784 0012E584  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131788 0012E588  80 C4 00 08 */	lwz r6, 8(r4)
/* 8013178C 0012E58C  28 06 00 00 */	cmplwi r6, 0
/* 80131790 0012E590  4D 82 00 20 */	beqlr 
/* 80131794 0012E594  80 86 00 18 */	lwz r4, 0x18(r6)
/* 80131798 0012E598  38 04 00 18 */	addi r0, r4, 0x18
/* 8013179C 0012E59C  7C 00 28 40 */	cmplw r0, r5
/* 801317A0 0012E5A0  4C 82 00 20 */	bnelr 
/* 801317A4 0012E5A4  80 86 00 14 */	lwz r4, 0x14(r6)
/* 801317A8 0012E5A8  88 84 00 1E */	lbz r4, 0x1e(r4)
/* 801317AC 0012E5AC  7C 04 00 D0 */	neg r0, r4
/* 801317B0 0012E5B0  7C 00 23 78 */	or r0, r0, r4
/* 801317B4 0012E5B4  54 00 0F FE */	srwi r0, r0, 0x1f
/* 801317B8 0012E5B8  98 03 00 10 */	stb r0, 0x10(r3)
/* 801317BC 0012E5BC  4E 80 00 20 */	blr 

trigger_allow_quit__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 801317C0 0012E5C0  80 A3 00 10 */	lwz r5, 0x10(r3)
/* 801317C4 0012E5C4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801317C8 0012E5C8  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 801317CC 0012E5CC  38 60 00 01 */	li r3, 1
/* 801317D0 0012E5D0  7C 05 00 D0 */	neg r0, r5
/* 801317D4 0012E5D4  7C 00 2B 78 */	or r0, r0, r5
/* 801317D8 0012E5D8  3C 84 00 01 */	addis r4, r4, 1
/* 801317DC 0012E5DC  54 00 0F FE */	srwi r0, r0, 0x1f
/* 801317E0 0012E5E0  98 04 8D 78 */	stb r0, -0x7288(r4)
/* 801317E4 0012E5E4  4E 80 00 20 */	blr 

parse_tag_teleport__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 801317E8 0012E5E8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801317EC 0012E5EC  7C 08 02 A6 */	mflr r0
/* 801317F0 0012E5F0  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 801317F4 0012E5F4  90 01 00 24 */	stw r0, 0x24(r1)
/* 801317F8 0012E5F8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801317FC 0012E5FC  7C 7F 1B 78 */	mr r31, r3
/* 80131800 0012E600  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80131804 0012E604  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80131808 0012E608  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8013180C 0012E60C  80 63 00 08 */	lwz r3, 8(r3)
/* 80131810 0012E610  28 03 00 00 */	cmplwi r3, 0
/* 80131814 0012E614  41 82 00 E8 */	beq lbl_801318FC
/* 80131818 0012E618  80 06 00 14 */	lwz r0, 0x14(r6)
/* 8013181C 0012E61C  38 A0 00 00 */	li r5, 0
/* 80131820 0012E620  80 63 00 14 */	lwz r3, 0x14(r3)
/* 80131824 0012E624  28 00 00 01 */	cmplwi r0, 1
/* 80131828 0012E628  83 BF 00 10 */	lwz r29, 0x10(r31)
/* 8013182C 0012E62C  80 63 00 24 */	lwz r3, 0x24(r3)
/* 80131830 0012E630  40 82 00 24 */	bne lbl_80131854
/* 80131834 0012E634  80 86 00 10 */	lwz r4, 0x10(r6)
/* 80131838 0012E638  88 04 00 00 */	lbz r0, 0(r4)
/* 8013183C 0012E63C  28 00 00 3A */	cmplwi r0, 0x3a
/* 80131840 0012E640  40 82 00 14 */	bne lbl_80131854
/* 80131844 0012E644  80 06 00 1C */	lwz r0, 0x1c(r6)
/* 80131848 0012E648  28 00 00 00 */	cmplwi r0, 0
/* 8013184C 0012E64C  41 82 00 08 */	beq lbl_80131854
/* 80131850 0012E650  38 A0 00 01 */	li r5, 1
lbl_80131854:
/* 80131854 0012E654  54 A0 06 3F */	clrlwi. r0, r5, 0x18
/* 80131858 0012E658  41 82 00 10 */	beq lbl_80131868
/* 8013185C 0012E65C  80 66 00 18 */	lwz r3, 0x18(r6)
/* 80131860 0012E660  80 86 00 1C */	lwz r4, 0x1c(r6)
/* 80131864 0012E664  4B F1 A9 ED */	bl xStrHash__FPCcUl
lbl_80131868:
/* 80131868 0012E668  28 03 00 00 */	cmplwi r3, 0
/* 8013186C 0012E66C  41 82 00 90 */	beq lbl_801318FC
/* 80131870 0012E670  38 00 00 00 */	li r0, 0
/* 80131874 0012E674  38 80 00 00 */	li r4, 0
/* 80131878 0012E678  98 1D 00 01 */	stb r0, 1(r29)
/* 8013187C 0012E67C  98 1D 00 00 */	stb r0, 0(r29)
/* 80131880 0012E680  4B F1 9E 8D */	bl xSTFindAsset__FUiPUi
/* 80131884 0012E684  7C 7E 1B 79 */	or. r30, r3, r3
/* 80131888 0012E688  41 82 00 74 */	beq lbl_801318FC
/* 8013188C 0012E68C  48 00 25 95 */	bl type_name__14location_assetFv
/* 80131890 0012E690  4B F1 A9 85 */	bl xStrHash__FPCc
/* 80131894 0012E694  80 1E 00 08 */	lwz r0, 8(r30)
/* 80131898 0012E698  7C 00 18 40 */	cmplw r0, r3
/* 8013189C 0012E69C  40 82 00 1C */	bne lbl_801318B8
/* 801318A0 0012E6A0  38 00 00 01 */	li r0, 1
/* 801318A4 0012E6A4  38 7D 00 04 */	addi r3, r29, 4
/* 801318A8 0012E6A8  98 1D 00 00 */	stb r0, 0(r29)
/* 801318AC 0012E6AC  38 9E 00 10 */	addi r4, r30, 0x10
/* 801318B0 0012E6B0  4B ED 99 B5 */	bl __as__5xVec3FRC5xVec3
/* 801318B4 0012E6B4  48 00 00 40 */	b lbl_801318F4
lbl_801318B8:
/* 801318B8 0012E6B8  48 00 25 59 */	bl type_name__13pointer_assetFv
/* 801318BC 0012E6BC  4B F1 A9 59 */	bl xStrHash__FPCc
/* 801318C0 0012E6C0  80 1E 00 08 */	lwz r0, 8(r30)
/* 801318C4 0012E6C4  7C 00 18 40 */	cmplw r0, r3
/* 801318C8 0012E6C8  40 82 00 2C */	bne lbl_801318F4
/* 801318CC 0012E6CC  38 00 00 01 */	li r0, 1
/* 801318D0 0012E6D0  38 7D 00 04 */	addi r3, r29, 4
/* 801318D4 0012E6D4  98 1D 00 01 */	stb r0, 1(r29)
/* 801318D8 0012E6D8  38 9E 00 10 */	addi r4, r30, 0x10
/* 801318DC 0012E6DC  98 1D 00 00 */	stb r0, 0(r29)
/* 801318E0 0012E6E0  4B ED 99 85 */	bl __as__5xVec3FRC5xVec3
/* 801318E4 0012E6E4  C0 22 A3 30 */	lfs f1, lbl_803CECB0-_SDA2_BASE_(r2)
/* 801318E8 0012E6E8  C0 1E 00 1C */	lfs f0, 0x1c(r30)
/* 801318EC 0012E6EC  EC 01 00 32 */	fmuls f0, f1, f0
/* 801318F0 0012E6F0  D0 1D 00 10 */	stfs f0, 0x10(r29)
lbl_801318F4:
/* 801318F4 0012E6F4  38 00 00 14 */	li r0, 0x14
/* 801318F8 0012E6F8  B0 1F 00 0C */	sth r0, 0xc(r31)
lbl_801318FC:
/* 801318FC 0012E6FC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80131900 0012E700  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80131904 0012E704  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80131908 0012E708  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8013190C 0012E70C  7C 08 03 A6 */	mtlr r0
/* 80131910 0012E710  38 21 00 20 */	addi r1, r1, 0x20
/* 80131914 0012E714  4E 80 00 20 */	blr 

/* move_player__22@unnamed@zTalkBox_cpp@FRC5xVec3 */
move_player__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC5xVec3:
/* 80131918 0012E718  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013191C 0012E71C  7C 08 02 A6 */	mflr r0
/* 80131920 0012E720  3C 80 80 3C */	lis r4, globals@ha
/* 80131924 0012E724  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131928 0012E728  38 C4 05 58 */	addi r6, r4, globals@l
/* 8013192C 0012E72C  7C 64 1B 78 */	mr r4, r3
/* 80131930 0012E730  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131934 0012E734  80 A6 07 04 */	lwz r5, 0x704(r6)
/* 80131938 0012E738  80 66 07 28 */	lwz r3, 0x728(r6)
/* 8013193C 0012E73C  80 A5 00 4C */	lwz r5, 0x4c(r5)
/* 80131940 0012E740  38 63 00 30 */	addi r3, r3, 0x30
/* 80131944 0012E744  3B E5 00 30 */	addi r31, r5, 0x30
/* 80131948 0012E748  4B ED 99 1D */	bl __as__5xVec3FRC5xVec3
/* 8013194C 0012E74C  7C 64 1B 78 */	mr r4, r3
/* 80131950 0012E750  7F E3 FB 78 */	mr r3, r31
/* 80131954 0012E754  4B ED 99 11 */	bl __as__5xVec3FRC5xVec3
/* 80131958 0012E758  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013195C 0012E75C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131960 0012E760  7C 08 03 A6 */	mtlr r0
/* 80131964 0012E764  38 21 00 10 */	addi r1, r1, 0x10
/* 80131968 0012E768  4E 80 00 20 */	blr 

/* turn_player__22@unnamed@zTalkBox_cpp@Ff */
turn_player__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff:
/* 8013196C 0012E76C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80131970 0012E770  7C 08 02 A6 */	mflr r0
/* 80131974 0012E774  3C 60 80 3C */	lis r3, globals@ha
/* 80131978 0012E778  90 01 00 34 */	stw r0, 0x34(r1)
/* 8013197C 0012E77C  38 63 05 58 */	addi r3, r3, globals@l
/* 80131980 0012E780  38 81 00 08 */	addi r4, r1, 8
/* 80131984 0012E784  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 80131988 0012E788  FF E0 08 90 */	fmr f31, f1
/* 8013198C 0012E78C  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80131990 0012E790  80 63 07 04 */	lwz r3, 0x704(r3)
/* 80131994 0012E794  83 E3 00 4C */	lwz r31, 0x4c(r3)
/* 80131998 0012E798  7F E3 FB 78 */	mr r3, r31
/* 8013199C 0012E79C  4B F0 04 99 */	bl xMat3x3GetEuler__FPC7xMat3x3P5xVec3
/* 801319A0 0012E7A0  D3 E1 00 08 */	stfs f31, 8(r1)
/* 801319A4 0012E7A4  7F E3 FB 78 */	mr r3, r31
/* 801319A8 0012E7A8  38 81 00 08 */	addi r4, r1, 8
/* 801319AC 0012E7AC  4B F0 07 F9 */	bl xMat3x3Euler__FP7xMat3x3PC5xVec3
/* 801319B0 0012E7B0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801319B4 0012E7B4  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 801319B8 0012E7B8  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 801319BC 0012E7BC  7C 08 03 A6 */	mtlr r0
/* 801319C0 0012E7C0  38 21 00 30 */	addi r1, r1, 0x30
/* 801319C4 0012E7C4  4E 80 00 20 */	blr 

trigger_teleport__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 801319C8 0012E7C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801319CC 0012E7CC  7C 08 02 A6 */	mflr r0
/* 801319D0 0012E7D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801319D4 0012E7D4  A0 03 00 0C */	lhz r0, 0xc(r3)
/* 801319D8 0012E7D8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801319DC 0012E7DC  28 00 00 14 */	cmplwi r0, 0x14
/* 801319E0 0012E7E0  41 82 00 0C */	beq lbl_801319EC
/* 801319E4 0012E7E4  38 60 00 01 */	li r3, 1
/* 801319E8 0012E7E8  48 00 00 34 */	b lbl_80131A1C
lbl_801319EC:
/* 801319EC 0012E7EC  83 E3 00 10 */	lwz r31, 0x10(r3)
/* 801319F0 0012E7F0  88 1F 00 00 */	lbz r0, 0(r31)
/* 801319F4 0012E7F4  28 00 00 00 */	cmplwi r0, 0
/* 801319F8 0012E7F8  41 82 00 0C */	beq lbl_80131A04
/* 801319FC 0012E7FC  38 7F 00 04 */	addi r3, r31, 4
/* 80131A00 0012E800  4B FF FF 19 */	bl move_player__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC5xVec3
lbl_80131A04:
/* 80131A04 0012E804  88 1F 00 01 */	lbz r0, 1(r31)
/* 80131A08 0012E808  28 00 00 00 */	cmplwi r0, 0
/* 80131A0C 0012E80C  41 82 00 0C */	beq lbl_80131A18
/* 80131A10 0012E810  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80131A14 0012E814  4B FF FF 59 */	bl turn_player__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff
lbl_80131A18:
/* 80131A18 0012E818  38 60 00 01 */	li r3, 1
lbl_80131A1C:
/* 80131A1C 0012E81C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131A20 0012E820  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131A24 0012E824  7C 08 03 A6 */	mtlr r0
/* 80131A28 0012E828  38 21 00 10 */	addi r1, r1, 0x10
/* 80131A2C 0012E82C  4E 80 00 20 */	blr 

parse_tag_trap__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131A30 0012E830  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131A34 0012E834  7C 08 02 A6 */	mflr r0
/* 80131A38 0012E838  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131A3C 0012E83C  80 06 00 14 */	lwz r0, 0x14(r6)
/* 80131A40 0012E840  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131A44 0012E844  3B E0 00 00 */	li r31, 0
/* 80131A48 0012E848  28 00 00 01 */	cmplwi r0, 1
/* 80131A4C 0012E84C  93 C1 00 08 */	stw r30, 8(r1)
/* 80131A50 0012E850  7C 7E 1B 78 */	mr r30, r3
/* 80131A54 0012E854  40 82 00 28 */	bne lbl_80131A7C
/* 80131A58 0012E858  80 66 00 10 */	lwz r3, 0x10(r6)
/* 80131A5C 0012E85C  88 03 00 00 */	lbz r0, 0(r3)
/* 80131A60 0012E860  28 00 00 3D */	cmplwi r0, 0x3d
/* 80131A64 0012E864  40 82 00 18 */	bne lbl_80131A7C
/* 80131A68 0012E868  38 66 00 18 */	addi r3, r6, 0x18
/* 80131A6C 0012E86C  38 80 00 01 */	li r4, 1
/* 80131A70 0012E870  4B FF EE 09 */	bl read_bool__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRC6substrb
/* 80131A74 0012E874  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80131A78 0012E878  41 82 00 08 */	beq lbl_80131A80
lbl_80131A7C:
/* 80131A7C 0012E87C  3B E0 00 01 */	li r31, 1
lbl_80131A80:
/* 80131A80 0012E880  9B FE 00 10 */	stb r31, 0x10(r30)
/* 80131A84 0012E884  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131A88 0012E888  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131A8C 0012E88C  83 C1 00 08 */	lwz r30, 8(r1)
/* 80131A90 0012E890  7C 08 03 A6 */	mtlr r0
/* 80131A94 0012E894  38 21 00 10 */	addi r1, r1, 0x10
/* 80131A98 0012E898  4E 80 00 20 */	blr 

reset_tag_trap__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131A9C 0012E89C  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131AA0 0012E8A0  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131AA4 0012E8A4  80 C4 00 08 */	lwz r6, 8(r4)
/* 80131AA8 0012E8A8  28 06 00 00 */	cmplwi r6, 0
/* 80131AAC 0012E8AC  4D 82 00 20 */	beqlr 
/* 80131AB0 0012E8B0  80 86 00 18 */	lwz r4, 0x18(r6)
/* 80131AB4 0012E8B4  38 04 00 18 */	addi r0, r4, 0x18
/* 80131AB8 0012E8B8  7C 00 28 40 */	cmplw r0, r5
/* 80131ABC 0012E8BC  4C 82 00 20 */	bnelr 
/* 80131AC0 0012E8C0  80 86 00 14 */	lwz r4, 0x14(r6)
/* 80131AC4 0012E8C4  88 84 00 1C */	lbz r4, 0x1c(r4)
/* 80131AC8 0012E8C8  7C 04 00 D0 */	neg r0, r4
/* 80131ACC 0012E8CC  7C 00 23 78 */	or r0, r0, r4
/* 80131AD0 0012E8D0  54 00 0F FE */	srwi r0, r0, 0x1f
/* 80131AD4 0012E8D4  98 03 00 10 */	stb r0, 0x10(r3)
/* 80131AD8 0012E8D8  4E 80 00 20 */	blr 

trigger_trap__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80131ADC 0012E8DC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131AE0 0012E8E0  7C 08 02 A6 */	mflr r0
/* 80131AE4 0012E8E4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131AE8 0012E8E8  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80131AEC 0012E8EC  28 00 00 00 */	cmplwi r0, 0
/* 80131AF0 0012E8F0  41 82 00 10 */	beq lbl_80131B00
/* 80131AF4 0012E8F4  38 60 00 10 */	li r3, 0x10
/* 80131AF8 0012E8F8  4B F3 4A 61 */	bl zEntPlayerControlOff__F13zControlOwner
/* 80131AFC 0012E8FC  48 00 00 0C */	b lbl_80131B08
lbl_80131B00:
/* 80131B00 0012E900  38 60 00 10 */	li r3, 0x10
/* 80131B04 0012E904  4B F3 49 FD */	bl zEntPlayerControlOn__F13zControlOwner
lbl_80131B08:
/* 80131B08 0012E908  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131B0C 0012E90C  38 60 00 01 */	li r3, 1
/* 80131B10 0012E910  7C 08 03 A6 */	mtlr r0
/* 80131B14 0012E914  38 21 00 10 */	addi r1, r1, 0x10
/* 80131B18 0012E918  4E 80 00 20 */	blr 

parse_tag_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag:
/* 80131B1C 0012E91C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80131B20 0012E920  7C 08 02 A6 */	mflr r0
/* 80131B24 0012E924  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131B28 0012E928  90 01 00 24 */	stw r0, 0x24(r1)
/* 80131B2C 0012E92C  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131B30 0012E930  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80131B34 0012E934  80 84 00 08 */	lwz r4, 8(r4)
/* 80131B38 0012E938  28 04 00 00 */	cmplwi r4, 0
/* 80131B3C 0012E93C  41 82 00 6C */	beq lbl_80131BA8
/* 80131B40 0012E940  80 84 00 18 */	lwz r4, 0x18(r4)
/* 80131B44 0012E944  38 04 00 18 */	addi r0, r4, 0x18
/* 80131B48 0012E948  7C 00 28 40 */	cmplw r0, r5
/* 80131B4C 0012E94C  40 82 00 5C */	bne lbl_80131BA8
/* 80131B50 0012E950  83 E3 00 10 */	lwz r31, 0x10(r3)
/* 80131B54 0012E954  38 00 00 10 */	li r0, 0x10
/* 80131B58 0012E958  B0 03 00 0C */	sth r0, 0xc(r3)
/* 80131B5C 0012E95C  7C C3 33 78 */	mr r3, r6
/* 80131B60 0012E960  4B EF 0D A9 */	bl read_tag__8xtextboxFRC6substr
/* 80131B64 0012E964  28 04 00 01 */	cmplwi r4, 1
/* 80131B68 0012E968  90 81 00 0C */	stw r4, 0xc(r1)
/* 80131B6C 0012E96C  90 61 00 08 */	stw r3, 8(r1)
/* 80131B70 0012E970  40 82 00 2C */	bne lbl_80131B9C
/* 80131B74 0012E974  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80131B78 0012E978  28 00 00 00 */	cmplwi r0, 0
/* 80131B7C 0012E97C  40 82 00 20 */	bne lbl_80131B9C
/* 80131B80 0012E980  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131B84 0012E984  7F E3 FB 78 */	mr r3, r31
/* 80131B88 0012E988  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80131B8C 0012E98C  3C 84 00 01 */	addis r4, r4, 1
/* 80131B90 0012E990  38 84 8D 38 */	addi r4, r4, -29384
/* 80131B94 0012E994  4B FF F1 E9 */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
/* 80131B98 0012E998  48 00 00 10 */	b lbl_80131BA8
lbl_80131B9C:
/* 80131B9C 0012E99C  7F E3 FB 78 */	mr r3, r31
/* 80131BA0 0012E9A0  38 81 00 08 */	addi r4, r1, 8
/* 80131BA4 0012E9A4  4B FF EE 45 */	bl load_wait_context__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextRCQ28xtextbox14tag_entry_list
lbl_80131BA8:
/* 80131BA8 0012E9A8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80131BAC 0012E9AC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80131BB0 0012E9B0  7C 08 03 A6 */	mtlr r0
/* 80131BB4 0012E9B4  38 21 00 20 */	addi r1, r1, 0x20
/* 80131BB8 0012E9B8  4E 80 00 20 */	blr 

trigger_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80131BBC 0012E9BC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131BC0 0012E9C0  7C 08 02 A6 */	mflr r0
/* 80131BC4 0012E9C4  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 80131BC8 0012E9C8  80 83 00 10 */	lwz r4, 0x10(r3)
/* 80131BCC 0012E9CC  38 65 B3 20 */	addi r3, r5, lbl_8031B320@l
/* 80131BD0 0012E9D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131BD4 0012E9D4  3C 63 00 01 */	addis r3, r3, 1
/* 80131BD8 0012E9D8  88 03 8D 79 */	lbz r0, -0x7287(r3)
/* 80131BDC 0012E9DC  28 00 00 00 */	cmplwi r0, 0
/* 80131BE0 0012E9E0  41 82 00 24 */	beq lbl_80131C04
/* 80131BE4 0012E9E4  88 03 8D 78 */	lbz r0, -0x7288(r3)
/* 80131BE8 0012E9E8  28 00 00 00 */	cmplwi r0, 0
/* 80131BEC 0012E9EC  41 82 00 18 */	beq lbl_80131C04
/* 80131BF0 0012E9F0  88 04 00 02 */	lbz r0, 2(r4)
/* 80131BF4 0012E9F4  28 00 00 00 */	cmplwi r0, 0
/* 80131BF8 0012E9F8  40 82 00 0C */	bne lbl_80131C04
/* 80131BFC 0012E9FC  38 60 00 01 */	li r3, 1
/* 80131C00 0012EA00  48 00 00 1C */	b lbl_80131C1C
lbl_80131C04:
/* 80131C04 0012EA04  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131C08 0012EA08  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131C0C 0012EA0C  3C 63 00 01 */	addis r3, r3, 1
/* 80131C10 0012EA10  38 63 8D 28 */	addi r3, r3, -29400
/* 80131C14 0012EA14  4B FF F1 69 */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
/* 80131C18 0012EA18  38 60 00 00 */	li r3, 0
lbl_80131C1C:
/* 80131C1C 0012EA1C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131C20 0012EA20  7C 08 03 A6 */	mtlr r0
/* 80131C24 0012EA24  38 21 00 10 */	addi r1, r1, 0x10
/* 80131C28 0012EA28  4E 80 00 20 */	blr 

/* start_audio_effect__22@unnamed@zTalkBox_cpp@FR8ztalkbox */
start_audio_effect__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkbox:
/* 80131C2C 0012EA2C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131C30 0012EA30  7C 08 02 A6 */	mflr r0
/* 80131C34 0012EA34  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131C38 0012EA38  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131C3C 0012EA3C  7C 7F 1B 78 */	mr r31, r3
/* 80131C40 0012EA40  88 0D 95 FD */	lbz r0, lbl_803CBEFD-_SDA_BASE_(r13)
/* 80131C44 0012EA44  7C 00 07 75 */	extsb. r0, r0
/* 80131C48 0012EA48  40 82 00 14 */	bne lbl_80131C5C
/* 80131C4C 0012EA4C  38 60 00 00 */	li r3, 0
/* 80131C50 0012EA50  38 00 00 01 */	li r0, 1
/* 80131C54 0012EA54  98 6D 95 FC */	stb r3, lbl_803CBEFC-_SDA_BASE_(r13)
/* 80131C58 0012EA58  98 0D 95 FD */	stb r0, lbl_803CBEFD-_SDA_BASE_(r13)
lbl_80131C5C:
/* 80131C5C 0012EA5C  88 0D 95 FC */	lbz r0, lbl_803CBEFC-_SDA_BASE_(r13)
/* 80131C60 0012EA60  28 00 00 00 */	cmplwi r0, 0
/* 80131C64 0012EA64  40 82 00 5C */	bne lbl_80131CC0
/* 80131C68 0012EA68  38 00 00 01 */	li r0, 1
/* 80131C6C 0012EA6C  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80131C70 0012EA70  98 0D 95 FC */	stb r0, lbl_803CBEFC-_SDA_BASE_(r13)
/* 80131C74 0012EA74  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80131C78 0012EA78  38 63 00 BA */	addi r3, r3, 0xba
/* 80131C7C 0012EA7C  38 8D 84 6C */	addi r4, r13, lbl_803CAD6C-_SDA_BASE_
/* 80131C80 0012EA80  C0 22 A3 28 */	lfs f1, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80131C84 0012EA84  38 A0 00 00 */	li r5, 0
/* 80131C88 0012EA88  C0 42 A3 2C */	lfs f2, lbl_803CECAC-_SDA2_BASE_(r2)
/* 80131C8C 0012EA8C  38 C0 00 00 */	li r6, 0
/* 80131C90 0012EA90  38 E0 00 00 */	li r7, 0
/* 80131C94 0012EA94  4B EF E9 99 */	bl xDebugAddTweak__FPCcPfffPC14tweak_callbackPvUi
/* 80131C98 0012EA98  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80131C9C 0012EA9C  C0 22 A3 28 */	lfs f1, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80131CA0 0012EAA0  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80131CA4 0012EAA4  C0 42 A3 34 */	lfs f2, lbl_803CECB4-_SDA2_BASE_(r2)
/* 80131CA8 0012EAA8  38 63 00 CF */	addi r3, r3, 0xcf
/* 80131CAC 0012EAAC  38 8D 84 70 */	addi r4, r13, lbl_803CAD70-_SDA_BASE_
/* 80131CB0 0012EAB0  38 A0 00 00 */	li r5, 0
/* 80131CB4 0012EAB4  38 C0 00 00 */	li r6, 0
/* 80131CB8 0012EAB8  38 E0 00 00 */	li r7, 0
/* 80131CBC 0012EABC  4B EF E9 71 */	bl xDebugAddTweak__FPCcPfffPC14tweak_callbackPvUi
lbl_80131CC0:
/* 80131CC0 0012EAC0  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80131CC4 0012EAC4  88 03 00 23 */	lbz r0, 0x23(r3)
/* 80131CC8 0012EAC8  2C 00 00 01 */	cmpwi r0, 1
/* 80131CCC 0012EACC  41 82 00 0C */	beq lbl_80131CD8
/* 80131CD0 0012EAD0  40 80 00 14 */	bge lbl_80131CE4
/* 80131CD4 0012EAD4  48 00 00 10 */	b lbl_80131CE4
lbl_80131CD8:
/* 80131CD8 0012EAD8  C0 2D 84 6C */	lfs f1, lbl_803CAD6C-_SDA_BASE_(r13)
/* 80131CDC 0012EADC  C0 4D 84 70 */	lfs f2, lbl_803CAD70-_SDA_BASE_(r13)
/* 80131CE0 0012EAE0  4B F7 5F 81 */	bl zMusicSetVolume__Fff
lbl_80131CE4:
/* 80131CE4 0012EAE4  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80131CE8 0012EAE8  88 03 00 1C */	lbz r0, 0x1c(r3)
/* 80131CEC 0012EAEC  28 00 00 00 */	cmplwi r0, 0
/* 80131CF0 0012EAF0  41 82 00 08 */	beq lbl_80131CF8
/* 80131CF4 0012EAF4  4B F4 F5 F1 */	bl zEntPlayer_SNDStopStream__Fv
lbl_80131CF8:
/* 80131CF8 0012EAF8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131CFC 0012EAFC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131D00 0012EB00  7C 08 03 A6 */	mtlr r0
/* 80131D04 0012EB04  38 21 00 10 */	addi r1, r1, 0x10
/* 80131D08 0012EB08  4E 80 00 20 */	blr 

/* stop_audio_effect__22@unnamed@zTalkBox_cpp@Fv */
stop_audio_effect__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80131D0C 0012EB0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131D10 0012EB10  7C 08 02 A6 */	mflr r0
/* 80131D14 0012EB14  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131D18 0012EB18  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131D1C 0012EB1C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131D20 0012EB20  80 63 00 08 */	lwz r3, 8(r3)
/* 80131D24 0012EB24  28 03 00 00 */	cmplwi r3, 0
/* 80131D28 0012EB28  41 82 00 28 */	beq lbl_80131D50
/* 80131D2C 0012EB2C  80 63 00 14 */	lwz r3, 0x14(r3)
/* 80131D30 0012EB30  88 03 00 23 */	lbz r0, 0x23(r3)
/* 80131D34 0012EB34  2C 00 00 01 */	cmpwi r0, 1
/* 80131D38 0012EB38  41 82 00 0C */	beq lbl_80131D44
/* 80131D3C 0012EB3C  40 80 00 14 */	bge lbl_80131D50
/* 80131D40 0012EB40  48 00 00 10 */	b lbl_80131D50
lbl_80131D44:
/* 80131D44 0012EB44  C0 22 A3 2C */	lfs f1, lbl_803CECAC-_SDA2_BASE_(r2)
/* 80131D48 0012EB48  C0 4D 84 70 */	lfs f2, lbl_803CAD70-_SDA_BASE_(r13)
/* 80131D4C 0012EB4C  4B F7 5F 15 */	bl zMusicSetVolume__Fff
lbl_80131D50:
/* 80131D50 0012EB50  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131D54 0012EB54  7C 08 03 A6 */	mtlr r0
/* 80131D58 0012EB58  38 21 00 10 */	addi r1, r1, 0x10
/* 80131D5C 0012EB5C  4E 80 00 20 */	blr 

/* deactivate__22@unnamed@zTalkBox_cpp@Fv */
deactivate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80131D60 0012EB60  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131D64 0012EB64  7C 08 02 A6 */	mflr r0
/* 80131D68 0012EB68  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131D6C 0012EB6C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131D70 0012EB70  93 C1 00 08 */	stw r30, 8(r1)
/* 80131D74 0012EB74  4B FF FF 99 */	bl stop_audio_effect__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80131D78 0012EB78  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131D7C 0012EB7C  3B E3 B3 20 */	addi r31, r3, lbl_8031B320@l
/* 80131D80 0012EB80  83 DF 00 08 */	lwz r30, 8(r31)
/* 80131D84 0012EB84  28 1E 00 00 */	cmplwi r30, 0
/* 80131D88 0012EB88  41 82 00 2C */	beq lbl_80131DB4
/* 80131D8C 0012EB8C  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 80131D90 0012EB90  28 03 00 00 */	cmplwi r3, 0
/* 80131D94 0012EB94  41 82 00 08 */	beq lbl_80131D9C
/* 80131D98 0012EB98  48 00 28 55 */	bl deactivate__8ztextboxFv
lbl_80131D9C:
/* 80131D9C 0012EB9C  38 80 00 00 */	li r4, 0
/* 80131DA0 0012EBA0  90 9F 00 08 */	stw r4, 8(r31)
/* 80131DA4 0012EBA4  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 80131DA8 0012EBA8  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80131DAC 0012EBAC  50 80 26 F6 */	rlwimi r0, r4, 4, 0x1b, 0x1b
/* 80131DB0 0012EBB0  98 03 00 10 */	stb r0, 0x10(r3)
lbl_80131DB4:
/* 80131DB4 0012EBB4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131DB8 0012EBB8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131DBC 0012EBBC  83 C1 00 08 */	lwz r30, 8(r1)
/* 80131DC0 0012EBC0  7C 08 03 A6 */	mtlr r0
/* 80131DC4 0012EBC4  38 21 00 10 */	addi r1, r1, 0x10
/* 80131DC8 0012EBC8  4E 80 00 20 */	blr 

/* activate__22@unnamed@zTalkBox_cpp@FR8ztalkbox */
activate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkbox:
/* 80131DCC 0012EBCC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131DD0 0012EBD0  7C 08 02 A6 */	mflr r0
/* 80131DD4 0012EBD4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131DD8 0012EBD8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131DDC 0012EBDC  7C 7F 1B 78 */	mr r31, r3
/* 80131DE0 0012EBE0  4B FF FF 81 */	bl deactivate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80131DE4 0012EBE4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131DE8 0012EBE8  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131DEC 0012EBEC  93 E3 00 08 */	stw r31, 8(r3)
/* 80131DF0 0012EBF0  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80131DF4 0012EBF4  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80131DF8 0012EBF8  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80131DFC 0012EBFC  41 82 00 08 */	beq lbl_80131E04
/* 80131E00 0012EC00  48 00 27 ED */	bl deactivate__8ztextboxFv
lbl_80131E04:
/* 80131E04 0012EC04  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80131E08 0012EC08  28 03 00 00 */	cmplwi r3, 0
/* 80131E0C 0012EC0C  41 82 00 14 */	beq lbl_80131E20
/* 80131E10 0012EC10  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80131E14 0012EC14  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80131E18 0012EC18  41 82 00 08 */	beq lbl_80131E20
/* 80131E1C 0012EC1C  48 00 27 85 */	bl activate__8ztextboxFv
lbl_80131E20:
/* 80131E20 0012EC20  7F E3 FB 78 */	mr r3, r31
/* 80131E24 0012EC24  4B FF FE 09 */	bl start_audio_effect__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkbox
/* 80131E28 0012EC28  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80131E2C 0012EC2C  38 80 00 01 */	li r4, 1
/* 80131E30 0012EC30  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80131E34 0012EC34  50 80 26 F6 */	rlwimi r0, r4, 4, 0x1b, 0x1b
/* 80131E38 0012EC38  98 03 00 10 */	stb r0, 0x10(r3)
/* 80131E3C 0012EC3C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131E40 0012EC40  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131E44 0012EC44  7C 08 03 A6 */	mtlr r0
/* 80131E48 0012EC48  38 21 00 10 */	addi r1, r1, 0x10
/* 80131E4C 0012EC4C  4E 80 00 20 */	blr 

/* is_wait_jot__22@unnamed@zTalkBox_cpp@FRCQ28xtextbox3jot */
is_wait_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 80131E50 0012EC50  80 A3 00 38 */	lwz r5, 0x38(r3)
/* 80131E54 0012EC54  38 60 00 00 */	li r3, 0
/* 80131E58 0012EC58  28 05 00 00 */	cmplwi r5, 0
/* 80131E5C 0012EC5C  4D 82 00 20 */	beqlr 
/* 80131E60 0012EC60  3C 80 80 13 */	lis r4, parse_tag_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag@ha
/* 80131E64 0012EC64  80 A5 00 08 */	lwz r5, 8(r5)
/* 80131E68 0012EC68  38 04 1B 1C */	addi r0, r4, parse_tag_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRQ28xtextbox3jotRC8xtextboxRC8xtextboxRCQ28xtextbox9split_tag@l
/* 80131E6C 0012EC6C  7C 05 00 40 */	cmplw r5, r0
/* 80131E70 0012EC70  4C 82 00 20 */	bnelr 
/* 80131E74 0012EC74  38 60 00 01 */	li r3, 1
/* 80131E78 0012EC78  4E 80 00 20 */	blr 

/* layout_contains_streams__22@unnamed@zTalkBox_cpp@Fv */
layout_contains_streams__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80131E7C 0012EC7C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80131E80 0012EC80  7C 08 02 A6 */	mflr r0
/* 80131E84 0012EC84  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80131E88 0012EC88  38 80 00 05 */	li r4, 5
/* 80131E8C 0012EC8C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80131E90 0012EC90  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80131E94 0012EC94  38 63 00 37 */	addi r3, r3, 0x37
/* 80131E98 0012EC98  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80131E9C 0012EC9C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80131EA0 0012ECA0  4B EF 44 85 */	bl create__6substrFPCcUl
/* 80131EA4 0012ECA4  90 61 00 08 */	stw r3, 8(r1)
/* 80131EA8 0012ECA8  38 61 00 08 */	addi r3, r1, 8
/* 80131EAC 0012ECAC  90 81 00 0C */	stw r4, 0xc(r1)
/* 80131EB0 0012ECB0  4B EF 46 E1 */	bl find_format_tag__8xtextboxFRC6substr
/* 80131EB4 0012ECB4  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131EB8 0012ECB8  7C 7F 1B 78 */	mr r31, r3
/* 80131EBC 0012ECBC  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80131EC0 0012ECC0  3B C3 00 24 */	addi r30, r3, 0x24
/* 80131EC4 0012ECC4  7F C3 F3 78 */	mr r3, r30
/* 80131EC8 0012ECC8  48 00 1F 69 */	bl jots__Q28xtextbox6layoutCFv
/* 80131ECC 0012ECCC  7C 60 1B 78 */	mr r0, r3
/* 80131ED0 0012ECD0  7F C3 F3 78 */	mr r3, r30
/* 80131ED4 0012ECD4  7C 1E 03 78 */	mr r30, r0
/* 80131ED8 0012ECD8  4B EF 46 DD */	bl jots_size__Q28xtextbox6layoutCFv
/* 80131EDC 0012ECDC  1C 03 00 3C */	mulli r0, r3, 0x3c
/* 80131EE0 0012ECE0  7C 9E 02 14 */	add r4, r30, r0
/* 80131EE4 0012ECE4  48 00 00 38 */	b lbl_80131F1C
lbl_80131EE8:
/* 80131EE8 0012ECE8  80 1E 00 38 */	lwz r0, 0x38(r30)
/* 80131EEC 0012ECEC  7C 00 F8 40 */	cmplw r0, r31
/* 80131EF0 0012ECF0  40 82 00 28 */	bne lbl_80131F18
/* 80131EF4 0012ECF4  A0 1E 00 0C */	lhz r0, 0xc(r30)
/* 80131EF8 0012ECF8  28 00 00 18 */	cmplwi r0, 0x18
/* 80131EFC 0012ECFC  40 82 00 1C */	bne lbl_80131F18
/* 80131F00 0012ED00  80 7E 00 10 */	lwz r3, 0x10(r30)
/* 80131F04 0012ED04  88 03 00 06 */	lbz r0, 6(r3)
/* 80131F08 0012ED08  2C 00 00 01 */	cmpwi r0, 1
/* 80131F0C 0012ED0C  40 82 00 0C */	bne lbl_80131F18
/* 80131F10 0012ED10  38 60 00 01 */	li r3, 1
/* 80131F14 0012ED14  48 00 00 14 */	b lbl_80131F28
lbl_80131F18:
/* 80131F18 0012ED18  3B DE 00 3C */	addi r30, r30, 0x3c
lbl_80131F1C:
/* 80131F1C 0012ED1C  7C 1E 20 40 */	cmplw r30, r4
/* 80131F20 0012ED20  40 82 FF C8 */	bne lbl_80131EE8
/* 80131F24 0012ED24  38 60 00 00 */	li r3, 0
lbl_80131F28:
/* 80131F28 0012ED28  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80131F2C 0012ED2C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80131F30 0012ED30  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80131F34 0012ED34  7C 08 03 A6 */	mtlr r0
/* 80131F38 0012ED38  38 21 00 20 */	addi r1, r1, 0x20
/* 80131F3C 0012ED3C  4E 80 00 20 */	blr 

/* lock_stream__22@unnamed@zTalkBox_cpp@Fv */
lock_stream__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80131F40 0012ED40  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131F44 0012ED44  7C 08 02 A6 */	mflr r0
/* 80131F48 0012ED48  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131F4C 0012ED4C  38 80 00 01 */	li r4, 1
/* 80131F50 0012ED50  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131F54 0012ED54  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131F58 0012ED58  38 A0 00 01 */	li r5, 1
/* 80131F5C 0012ED5C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131F60 0012ED60  3F E3 00 01 */	addis r31, r3, 1
/* 80131F64 0012ED64  3B FF 8D 56 */	addi r31, r31, -29354
/* 80131F68 0012ED68  7F E3 FB 78 */	mr r3, r31
/* 80131F6C 0012ED6C  4B F1 78 39 */	bl xSndStreamLock__FUi14sound_categoryb
/* 80131F70 0012ED70  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80131F74 0012ED74  98 7F 00 00 */	stb r3, 0(r31)
/* 80131F78 0012ED78  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80131F7C 0012ED7C  38 80 00 01 */	li r4, 1
/* 80131F80 0012ED80  3F E3 00 01 */	addis r31, r3, 1
/* 80131F84 0012ED84  38 A0 00 01 */	li r5, 1
/* 80131F88 0012ED88  3B FF 8D 57 */	addi r31, r31, -29353
/* 80131F8C 0012ED8C  7F E3 FB 78 */	mr r3, r31
/* 80131F90 0012ED90  4B F1 78 15 */	bl xSndStreamLock__FUi14sound_categoryb
/* 80131F94 0012ED94  98 7F 00 00 */	stb r3, 0(r31)
/* 80131F98 0012ED98  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80131F9C 0012ED9C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80131FA0 0012EDA0  7C 08 03 A6 */	mtlr r0
/* 80131FA4 0012EDA4  38 21 00 10 */	addi r1, r1, 0x10
/* 80131FA8 0012EDA8  4E 80 00 20 */	blr 

/* unlock_stream__22@unnamed@zTalkBox_cpp@Fv */
unlock_stream__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80131FAC 0012EDAC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80131FB0 0012EDB0  7C 08 02 A6 */	mflr r0
/* 80131FB4 0012EDB4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131FB8 0012EDB8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80131FBC 0012EDBC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131FC0 0012EDC0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80131FC4 0012EDC4  3F E3 00 01 */	addis r31, r3, 1
/* 80131FC8 0012EDC8  3B FF 8D 56 */	addi r31, r31, -29354
/* 80131FCC 0012EDCC  93 C1 00 08 */	stw r30, 8(r1)
/* 80131FD0 0012EDD0  7F E3 FB 78 */	mr r3, r31
/* 80131FD4 0012EDD4  4B F1 79 89 */	bl xSndStreamUnlock__FUi
/* 80131FD8 0012EDD8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80131FDC 0012EDDC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80131FE0 0012EDE0  3F C3 00 01 */	addis r30, r3, 1
/* 80131FE4 0012EDE4  3B DE 8D 57 */	addi r30, r30, -29353
/* 80131FE8 0012EDE8  7F C3 F3 78 */	mr r3, r30
/* 80131FEC 0012EDEC  4B F1 79 71 */	bl xSndStreamUnlock__FUi
/* 80131FF0 0012EDF0  38 00 00 00 */	li r0, 0
/* 80131FF4 0012EDF4  98 1F 00 00 */	stb r0, 0(r31)
/* 80131FF8 0012EDF8  98 1E 00 00 */	stb r0, 0(r30)
/* 80131FFC 0012EDFC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132000 0012EE00  83 C1 00 08 */	lwz r30, 8(r1)
/* 80132004 0012EE04  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132008 0012EE08  7C 08 03 A6 */	mtlr r0
/* 8013200C 0012EE0C  38 21 00 10 */	addi r1, r1, 0x10
/* 80132010 0012EE10  4E 80 00 20 */	blr 

/* refresh_prompts__22@unnamed@zTalkBox_cpp@Fv */
refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80132014 0012EE14  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132018 0012EE18  7C 08 02 A6 */	mflr r0
/* 8013201C 0012EE1C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132020 0012EE20  90 01 00 24 */	stw r0, 0x24(r1)
/* 80132024 0012EE24  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 80132028 0012EE28  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013202C 0012EE2C  83 E4 00 08 */	lwz r31, 8(r4)
/* 80132030 0012EE30  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80132034 0012EE34  28 03 00 00 */	cmplwi r3, 0
/* 80132038 0012EE38  41 82 00 80 */	beq lbl_801320B8
/* 8013203C 0012EE3C  3C E4 00 01 */	addis r7, r4, 1
/* 80132040 0012EE40  88 07 8D 28 */	lbz r0, -0x72d8(r7)
/* 80132044 0012EE44  54 00 D7 FF */	rlwinm. r0, r0, 0x1a, 0x1f, 0x1f
/* 80132048 0012EE48  41 82 00 44 */	beq lbl_8013208C
/* 8013204C 0012EE4C  88 07 8D 54 */	lbz r0, -0x72ac(r7)
/* 80132050 0012EE50  28 00 00 00 */	cmplwi r0, 0
/* 80132054 0012EE54  41 82 00 38 */	beq lbl_8013208C
/* 80132058 0012EE58  80 02 BF 68 */	lwz r0, lbl_803D08E8-_SDA2_BASE_(r2)
/* 8013205C 0012EE5C  38 81 00 08 */	addi r4, r1, 8
/* 80132060 0012EE60  80 A2 BF 6C */	lwz r5, lbl_803D08EC-_SDA2_BASE_(r2)
/* 80132064 0012EE64  90 01 00 08 */	stw r0, 8(r1)
/* 80132068 0012EE68  80 DF 00 24 */	lwz r6, 0x24(r31)
/* 8013206C 0012EE6C  80 07 8D 34 */	lwz r0, -0x72cc(r7)
/* 80132070 0012EE70  90 A1 00 0C */	stw r5, 0xc(r1)
/* 80132074 0012EE74  80 BF 00 34 */	lwz r5, 0x34(r31)
/* 80132078 0012EE78  54 00 10 3A */	slwi r0, r0, 2
/* 8013207C 0012EE7C  90 C1 00 08 */	stw r6, 8(r1)
/* 80132080 0012EE80  90 A1 00 0C */	stw r5, 0xc(r1)
/* 80132084 0012EE84  7C 84 00 2E */	lwzx r4, r4, r0
/* 80132088 0012EE88  48 00 00 08 */	b lbl_80132090
lbl_8013208C:
/* 8013208C 0012EE8C  80 9F 00 28 */	lwz r4, 0x28(r31)
lbl_80132090:
/* 80132090 0012EE90  28 04 00 00 */	cmplwi r4, 0
/* 80132094 0012EE94  41 82 00 20 */	beq lbl_801320B4
/* 80132098 0012EE98  48 00 25 B9 */	bl set_text__8ztextboxFPCc
/* 8013209C 0012EE9C  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 801320A0 0012EEA0  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 801320A4 0012EEA4  41 82 00 14 */	beq lbl_801320B8
/* 801320A8 0012EEA8  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 801320AC 0012EEAC  48 00 24 F5 */	bl activate__8ztextboxFv
/* 801320B0 0012EEB0  48 00 00 08 */	b lbl_801320B8
lbl_801320B4:
/* 801320B4 0012EEB4  48 00 25 39 */	bl deactivate__8ztextboxFv
lbl_801320B8:
/* 801320B8 0012EEB8  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 801320BC 0012EEBC  28 03 00 00 */	cmplwi r3, 0
/* 801320C0 0012EEC0  41 82 00 A0 */	beq lbl_80132160
/* 801320C4 0012EEC4  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 801320C8 0012EEC8  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 801320CC 0012EECC  3C A4 00 01 */	addis r5, r4, 1
/* 801320D0 0012EED0  88 C5 8D 78 */	lbz r6, -0x7288(r5)
/* 801320D4 0012EED4  28 06 00 00 */	cmplwi r6, 0
/* 801320D8 0012EED8  41 82 00 38 */	beq lbl_80132110
/* 801320DC 0012EEDC  80 9F 00 2C */	lwz r4, 0x2c(r31)
/* 801320E0 0012EEE0  28 04 00 00 */	cmplwi r4, 0
/* 801320E4 0012EEE4  41 82 00 2C */	beq lbl_80132110
/* 801320E8 0012EEE8  88 05 8D 55 */	lbz r0, -0x72ab(r5)
/* 801320EC 0012EEEC  28 00 00 00 */	cmplwi r0, 0
/* 801320F0 0012EEF0  41 82 00 20 */	beq lbl_80132110
/* 801320F4 0012EEF4  48 00 25 5D */	bl set_text__8ztextboxFPCc
/* 801320F8 0012EEF8  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 801320FC 0012EEFC  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80132100 0012EF00  41 82 00 60 */	beq lbl_80132160
/* 80132104 0012EF04  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80132108 0012EF08  48 00 24 99 */	bl activate__8ztextboxFv
/* 8013210C 0012EF0C  48 00 00 54 */	b lbl_80132160
lbl_80132110:
/* 80132110 0012EF10  28 06 00 00 */	cmplwi r6, 0
/* 80132114 0012EF14  41 82 00 20 */	beq lbl_80132134
/* 80132118 0012EF18  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 8013211C 0012EF1C  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80132120 0012EF20  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80132124 0012EF24  3C 84 00 01 */	addis r4, r4, 1
/* 80132128 0012EF28  C0 24 8D 50 */	lfs f1, -0x72b0(r4)
/* 8013212C 0012EF2C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80132130 0012EF30  40 81 00 2C */	ble lbl_8013215C
lbl_80132134:
/* 80132134 0012EF34  80 9F 00 30 */	lwz r4, 0x30(r31)
/* 80132138 0012EF38  28 04 00 00 */	cmplwi r4, 0
/* 8013213C 0012EF3C  41 82 00 20 */	beq lbl_8013215C
/* 80132140 0012EF40  48 00 25 11 */	bl set_text__8ztextboxFPCc
/* 80132144 0012EF44  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80132148 0012EF48  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 8013214C 0012EF4C  41 82 00 14 */	beq lbl_80132160
/* 80132150 0012EF50  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80132154 0012EF54  48 00 24 4D */	bl activate__8ztextboxFv
/* 80132158 0012EF58  48 00 00 08 */	b lbl_80132160
lbl_8013215C:
/* 8013215C 0012EF5C  48 00 24 91 */	bl deactivate__8ztextboxFv
lbl_80132160:
/* 80132160 0012EF60  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80132164 0012EF64  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80132168 0012EF68  7C 08 03 A6 */	mtlr r0
/* 8013216C 0012EF6C  38 21 00 20 */	addi r1, r1, 0x20
/* 80132170 0012EF70  4E 80 00 20 */	blr 

/* update_prompt_status__22@unnamed@zTalkBox_cpp@Ff */
update_prompt_status__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff:
/* 80132174 0012EF74  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132178 0012EF78  7C 08 02 A6 */	mflr r0
/* 8013217C 0012EF7C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132180 0012EF80  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132184 0012EF84  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 80132188 0012EF88  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013218C 0012EF8C  3F E4 00 01 */	addis r31, r4, 1
/* 80132190 0012EF90  88 1F 8D 28 */	lbz r0, -0x72d8(r31)
/* 80132194 0012EF94  54 00 D7 FF */	rlwinm. r0, r0, 0x1a, 0x1f, 0x1f
/* 80132198 0012EF98  41 82 00 64 */	beq lbl_801321FC
/* 8013219C 0012EF9C  88 1F 8D 54 */	lbz r0, -0x72ac(r31)
/* 801321A0 0012EFA0  28 00 00 00 */	cmplwi r0, 0
/* 801321A4 0012EFA4  40 82 00 58 */	bne lbl_801321FC
/* 801321A8 0012EFA8  C0 1F 8D 4C */	lfs f0, -0x72b4(r31)
/* 801321AC 0012EFAC  EC 00 08 28 */	fsubs f0, f0, f1
/* 801321B0 0012EFB0  D0 1F 8D 4C */	stfs f0, -0x72b4(r31)
/* 801321B4 0012EFB4  C0 3F 8D 4C */	lfs f1, -0x72b4(r31)
/* 801321B8 0012EFB8  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 801321BC 0012EFBC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801321C0 0012EFC0  41 81 00 3C */	bgt lbl_801321FC
/* 801321C4 0012EFC4  80 BF 8D 58 */	lwz r5, -0x72a8(r31)
/* 801321C8 0012EFC8  7C 7F 2A 14 */	add r3, r31, r5
/* 801321CC 0012EFCC  88 03 8D 56 */	lbz r0, -0x72aa(r3)
/* 801321D0 0012EFD0  28 00 00 00 */	cmplwi r0, 0
/* 801321D4 0012EFD4  41 82 00 1C */	beq lbl_801321F0
/* 801321D8 0012EFD8  7C 64 2A 14 */	add r3, r4, r5
/* 801321DC 0012EFDC  3C 63 00 01 */	addis r3, r3, 1
/* 801321E0 0012EFE0  38 63 8D 56 */	addi r3, r3, -29354
/* 801321E4 0012EFE4  4B F1 77 2D */	bl xSndStreamReady__FUi
/* 801321E8 0012EFE8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801321EC 0012EFEC  41 82 00 10 */	beq lbl_801321FC
lbl_801321F0:
/* 801321F0 0012EFF0  38 00 00 01 */	li r0, 1
/* 801321F4 0012EFF4  98 1F 8D 54 */	stb r0, -0x72ac(r31)
/* 801321F8 0012EFF8  4B FF FE 1D */	bl refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_801321FC:
/* 801321FC 0012EFFC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132200 0012F000  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132204 0012F004  7C 08 03 A6 */	mtlr r0
/* 80132208 0012F008  38 21 00 10 */	addi r1, r1, 0x10
/* 8013220C 0012F00C  4E 80 00 20 */	blr 

/* update_quit_status__22@unnamed@zTalkBox_cpp@Ff */
update_quit_status__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff:
/* 80132210 0012F010  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132214 0012F014  7C 08 02 A6 */	mflr r0
/* 80132218 0012F018  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013221C 0012F01C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132220 0012F020  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132224 0012F024  3C 63 00 01 */	addis r3, r3, 1
/* 80132228 0012F028  88 03 8D 55 */	lbz r0, -0x72ab(r3)
/* 8013222C 0012F02C  28 00 00 00 */	cmplwi r0, 0
/* 80132230 0012F030  40 82 00 2C */	bne lbl_8013225C
/* 80132234 0012F034  C0 03 8D 50 */	lfs f0, -0x72b0(r3)
/* 80132238 0012F038  EC 00 08 28 */	fsubs f0, f0, f1
/* 8013223C 0012F03C  D0 03 8D 50 */	stfs f0, -0x72b0(r3)
/* 80132240 0012F040  C0 23 8D 50 */	lfs f1, -0x72b0(r3)
/* 80132244 0012F044  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80132248 0012F048  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8013224C 0012F04C  41 81 00 10 */	bgt lbl_8013225C
/* 80132250 0012F050  38 00 00 01 */	li r0, 1
/* 80132254 0012F054  98 03 8D 55 */	stb r0, -0x72ab(r3)
/* 80132258 0012F058  4B FF FD BD */	bl refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_8013225C:
/* 8013225C 0012F05C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132260 0012F060  7C 08 03 A6 */	mtlr r0
/* 80132264 0012F064  38 21 00 10 */	addi r1, r1, 0x10
/* 80132268 0012F068  4E 80 00 20 */	blr 

/* hide_prompts__22@unnamed@zTalkBox_cpp@Fv */
hide_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 8013226C 0012F06C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132270 0012F070  7C 08 02 A6 */	mflr r0
/* 80132274 0012F074  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132278 0012F078  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013227C 0012F07C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132280 0012F080  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132284 0012F084  83 E3 00 08 */	lwz r31, 8(r3)
/* 80132288 0012F088  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8013228C 0012F08C  28 03 00 00 */	cmplwi r3, 0
/* 80132290 0012F090  41 82 00 08 */	beq lbl_80132298
/* 80132294 0012F094  48 00 23 59 */	bl deactivate__8ztextboxFv
lbl_80132298:
/* 80132298 0012F098  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 8013229C 0012F09C  28 03 00 00 */	cmplwi r3, 0
/* 801322A0 0012F0A0  41 82 00 08 */	beq lbl_801322A8
/* 801322A4 0012F0A4  48 00 23 49 */	bl deactivate__8ztextboxFv
lbl_801322A8:
/* 801322A8 0012F0A8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801322AC 0012F0AC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801322B0 0012F0B0  7C 08 03 A6 */	mtlr r0
/* 801322B4 0012F0B4  38 21 00 10 */	addi r1, r1, 0x10
/* 801322B8 0012F0B8  4E 80 00 20 */	blr 

/* stop_wait__22@unnamed@zTalkBox_cpp@FR8ztalkboxPCfUl */
stop_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkboxPCfUl:
/* 801322BC 0012F0BC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801322C0 0012F0C0  7C 08 02 A6 */	mflr r0
/* 801322C4 0012F0C4  3C C0 80 32 */	lis r6, lbl_8031B320@ha
/* 801322C8 0012F0C8  90 01 00 24 */	stw r0, 0x24(r1)
/* 801322CC 0012F0CC  BF 41 00 08 */	stmw r26, 8(r1)
/* 801322D0 0012F0D0  7C 7A 1B 78 */	mr r26, r3
/* 801322D4 0012F0D4  38 66 B3 20 */	addi r3, r6, lbl_8031B320@l
/* 801322D8 0012F0D8  7C BB 2B 78 */	mr r27, r5
/* 801322DC 0012F0DC  80 03 00 08 */	lwz r0, 8(r3)
/* 801322E0 0012F0E0  7C 00 D0 40 */	cmplw r0, r26
/* 801322E4 0012F0E4  40 82 00 60 */	bne lbl_80132344
/* 801322E8 0012F0E8  7C 9E 23 78 */	mr r30, r4
/* 801322EC 0012F0EC  3B A0 00 00 */	li r29, 0
/* 801322F0 0012F0F0  3B 80 00 00 */	li r28, 0
/* 801322F4 0012F0F4  3B E0 00 01 */	li r31, 1
/* 801322F8 0012F0F8  48 00 00 2C */	b lbl_80132324
lbl_801322FC:
/* 801322FC 0012F0FC  C0 3E 00 00 */	lfs f1, 0(r30)
/* 80132300 0012F100  48 0B B0 DD */	bl func_801ED3DC
/* 80132304 0012F104  28 03 00 00 */	cmplwi r3, 0
/* 80132308 0012F108  41 82 00 14 */	beq lbl_8013231C
/* 8013230C 0012F10C  28 03 00 20 */	cmplwi r3, 0x20
/* 80132310 0012F110  40 80 00 0C */	bge lbl_8013231C
/* 80132314 0012F114  7F E0 18 30 */	slw r0, r31, r3
/* 80132318 0012F118  7F BD 03 78 */	or r29, r29, r0
lbl_8013231C:
/* 8013231C 0012F11C  3B DE 00 04 */	addi r30, r30, 4
/* 80132320 0012F120  3B 9C 00 01 */	addi r28, r28, 1
lbl_80132324:
/* 80132324 0012F124  7C 1C D8 40 */	cmplw r28, r27
/* 80132328 0012F128  41 80 FF D4 */	blt lbl_801322FC
/* 8013232C 0012F12C  28 1D 00 00 */	cmplwi r29, 0
/* 80132330 0012F130  40 82 00 08 */	bne lbl_80132338
/* 80132334 0012F134  3B A0 FF FF */	li r29, -1
lbl_80132338:
/* 80132338 0012F138  7F 43 D3 78 */	mr r3, r26
/* 8013233C 0012F13C  7F A4 EB 78 */	mr r4, r29
/* 80132340 0012F140  48 00 08 45 */	bl stop_wait__8ztalkboxFUi
lbl_80132344:
/* 80132344 0012F144  BB 41 00 08 */	lmw r26, 8(r1)
/* 80132348 0012F148  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013234C 0012F14C  7C 08 03 A6 */	mtlr r0
/* 80132350 0012F150  38 21 00 20 */	addi r1, r1, 0x20
/* 80132354 0012F154  4E 80 00 20 */	blr 

cb_dispatch__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FP5xBaseP5xBaseUiPCfP5xBase:
/* 80132358 0012F158  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013235C 0012F15C  7C 08 02 A6 */	mflr r0
/* 80132360 0012F160  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132364 0012F164  2C 05 01 52 */	cmpwi r5, 0x152
/* 80132368 0012F168  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013236C 0012F16C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132370 0012F170  38 00 00 01 */	li r0, 1
/* 80132374 0012F174  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132378 0012F178  3F E3 00 01 */	addis r31, r3, 1
/* 8013237C 0012F17C  7C 83 23 78 */	mr r3, r4
/* 80132380 0012F180  98 1F 8D 7A */	stb r0, -0x7286(r31)
/* 80132384 0012F184  41 82 01 44 */	beq lbl_801324C8
/* 80132388 0012F188  40 80 00 5C */	bge lbl_801323E4
/* 8013238C 0012F18C  2C 05 00 4D */	cmpwi r5, 0x4d
/* 80132390 0012F190  40 80 00 2C */	bge lbl_801323BC
/* 80132394 0012F194  2C 05 00 0A */	cmpwi r5, 0xa
/* 80132398 0012F198  41 82 00 A4 */	beq lbl_8013243C
/* 8013239C 0012F19C  40 80 01 44 */	bge lbl_801324E0
/* 801323A0 0012F1A0  2C 05 00 04 */	cmpwi r5, 4
/* 801323A4 0012F1A4  41 82 00 A0 */	beq lbl_80132444
/* 801323A8 0012F1A8  40 80 01 38 */	bge lbl_801324E0
/* 801323AC 0012F1AC  2C 05 00 03 */	cmpwi r5, 3
/* 801323B0 0012F1B0  40 80 00 9C */	bge lbl_8013244C
/* 801323B4 0012F1B4  48 00 01 2C */	b lbl_801324E0
/* 801323B8 0012F1B8  48 00 01 28 */	b lbl_801324E0
lbl_801323BC:
/* 801323BC 0012F1BC  2C 05 01 4E */	cmpwi r5, 0x14e
/* 801323C0 0012F1C0  41 82 00 F4 */	beq lbl_801324B4
/* 801323C4 0012F1C4  40 80 00 10 */	bge lbl_801323D4
/* 801323C8 0012F1C8  2C 05 00 58 */	cmpwi r5, 0x58
/* 801323CC 0012F1CC  41 82 00 70 */	beq lbl_8013243C
/* 801323D0 0012F1D0  48 00 01 10 */	b lbl_801324E0
lbl_801323D4:
/* 801323D4 0012F1D4  2C 05 01 50 */	cmpwi r5, 0x150
/* 801323D8 0012F1D8  41 82 00 A4 */	beq lbl_8013247C
/* 801323DC 0012F1DC  40 80 01 04 */	bge lbl_801324E0
/* 801323E0 0012F1E0  48 00 00 74 */	b lbl_80132454
lbl_801323E4:
/* 801323E4 0012F1E4  2C 05 01 C7 */	cmpwi r5, 0x1c7
/* 801323E8 0012F1E8  40 80 00 30 */	bge lbl_80132418
/* 801323EC 0012F1EC  2C 05 01 60 */	cmpwi r5, 0x160
/* 801323F0 0012F1F0  41 82 00 98 */	beq lbl_80132488
/* 801323F4 0012F1F4  40 80 00 18 */	bge lbl_8013240C
/* 801323F8 0012F1F8  2C 05 01 56 */	cmpwi r5, 0x156
/* 801323FC 0012F1FC  40 80 00 E4 */	bge lbl_801324E0
/* 80132400 0012F200  2C 05 01 54 */	cmpwi r5, 0x154
/* 80132404 0012F204  40 80 00 DC */	bge lbl_801324E0
/* 80132408 0012F208  48 00 00 D4 */	b lbl_801324DC
lbl_8013240C:
/* 8013240C 0012F20C  2C 05 01 C5 */	cmpwi r5, 0x1c5
/* 80132410 0012F210  40 80 00 D0 */	bge lbl_801324E0
/* 80132414 0012F214  48 00 00 CC */	b lbl_801324E0
lbl_80132418:
/* 80132418 0012F218  2C 05 01 F7 */	cmpwi r5, 0x1f7
/* 8013241C 0012F21C  41 82 00 30 */	beq lbl_8013244C
/* 80132420 0012F220  40 80 00 10 */	bge lbl_80132430
/* 80132424 0012F224  2C 05 01 D3 */	cmpwi r5, 0x1d3
/* 80132428 0012F228  40 80 00 B8 */	bge lbl_801324E0
/* 8013242C 0012F22C  48 00 00 B4 */	b lbl_801324E0
lbl_80132430:
/* 80132430 0012F230  2C 05 01 F9 */	cmpwi r5, 0x1f9
/* 80132434 0012F234  40 80 00 AC */	bge lbl_801324E0
/* 80132438 0012F238  48 00 00 0C */	b lbl_80132444
lbl_8013243C:
/* 8013243C 0012F23C  48 00 02 05 */	bl reset__8ztalkboxFv
/* 80132440 0012F240  48 00 00 A0 */	b lbl_801324E0
lbl_80132444:
/* 80132444 0012F244  48 00 07 F9 */	bl hide__8ztalkboxFv
/* 80132448 0012F248  48 00 00 98 */	b lbl_801324E0
lbl_8013244C:
/* 8013244C 0012F24C  48 00 07 61 */	bl show__8ztalkboxFv
/* 80132450 0012F250  48 00 00 90 */	b lbl_801324E0
lbl_80132454:
/* 80132454 0012F254  28 06 00 00 */	cmplwi r6, 0
/* 80132458 0012F258  40 82 00 0C */	bne lbl_80132464
/* 8013245C 0012F25C  38 80 00 00 */	li r4, 0
/* 80132460 0012F260  48 00 00 08 */	b lbl_80132468
lbl_80132464:
/* 80132464 0012F264  80 86 00 00 */	lwz r4, 0(r6)
lbl_80132468:
/* 80132468 0012F268  38 A0 00 00 */	li r5, 0
/* 8013246C 0012F26C  38 C0 00 00 */	li r6, 0
/* 80132470 0012F270  48 00 05 A5 */	bl start_talk__8ztalkboxFUiPQ28ztalkbox8callbackP10zNPCCommon
/* 80132474 0012F274  4B FF E3 8D */	bl flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132478 0012F278  48 00 00 68 */	b lbl_801324E0
lbl_8013247C:
/* 8013247C 0012F27C  48 00 06 15 */	bl stop_talk__8ztalkboxFv
/* 80132480 0012F280  4B FF E3 81 */	bl flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132484 0012F284  48 00 00 5C */	b lbl_801324E0
lbl_80132488:
/* 80132488 0012F288  28 06 00 00 */	cmplwi r6, 0
/* 8013248C 0012F28C  40 82 00 14 */	bne lbl_801324A0
/* 80132490 0012F290  38 80 00 00 */	li r4, 0
/* 80132494 0012F294  38 A0 00 00 */	li r5, 0
/* 80132498 0012F298  4B FF FE 25 */	bl stop_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkboxPCfUl
/* 8013249C 0012F29C  48 00 00 10 */	b lbl_801324AC
lbl_801324A0:
/* 801324A0 0012F2A0  7C C4 33 78 */	mr r4, r6
/* 801324A4 0012F2A4  38 A0 00 04 */	li r5, 4
/* 801324A8 0012F2A8  4B FF FE 15 */	bl stop_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkboxPCfUl
lbl_801324AC:
/* 801324AC 0012F2AC  4B FF E3 55 */	bl flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801324B0 0012F2B0  48 00 00 30 */	b lbl_801324E0
lbl_801324B4:
/* 801324B4 0012F2B4  28 06 00 00 */	cmplwi r6, 0
/* 801324B8 0012F2B8  41 82 00 28 */	beq lbl_801324E0
/* 801324BC 0012F2BC  80 86 00 00 */	lwz r4, 0(r6)
/* 801324C0 0012F2C0  48 00 02 AD */	bl set_text__8ztalkboxFUi
/* 801324C4 0012F2C4  48 00 00 1C */	b lbl_801324E0
lbl_801324C8:
/* 801324C8 0012F2C8  28 06 00 00 */	cmplwi r6, 0
/* 801324CC 0012F2CC  41 82 00 14 */	beq lbl_801324E0
/* 801324D0 0012F2D0  80 86 00 00 */	lwz r4, 0(r6)
/* 801324D4 0012F2D4  48 00 03 49 */	bl add_text__8ztalkboxFUi
/* 801324D8 0012F2D8  48 00 00 08 */	b lbl_801324E0
lbl_801324DC:
/* 801324DC 0012F2DC  48 00 03 91 */	bl clear_text__8ztalkboxFv
lbl_801324E0:
/* 801324E0 0012F2E0  38 00 00 00 */	li r0, 0
/* 801324E4 0012F2E4  38 60 00 01 */	li r3, 1
/* 801324E8 0012F2E8  98 1F 8D 7A */	stb r0, -0x7286(r31)
/* 801324EC 0012F2EC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801324F0 0012F2F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801324F4 0012F2F4  7C 08 03 A6 */	mtlr r0
/* 801324F8 0012F2F8  38 21 00 10 */	addi r1, r1, 0x10
/* 801324FC 0012F2FC  4E 80 00 20 */	blr 

/* load_text__22@unnamed@zTalkBox_cpp@FUi */
load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi:
/* 80132500 0012F300  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132504 0012F304  7C 08 02 A6 */	mflr r0
/* 80132508 0012F308  28 03 00 00 */	cmplwi r3, 0
/* 8013250C 0012F30C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132510 0012F310  40 82 00 0C */	bne lbl_8013251C
/* 80132514 0012F314  38 60 00 00 */	li r3, 0
/* 80132518 0012F318  48 00 00 20 */	b lbl_80132538
lbl_8013251C:
/* 8013251C 0012F31C  38 80 00 00 */	li r4, 0
/* 80132520 0012F320  4B F1 91 ED */	bl xSTFindAsset__FUiPUi
/* 80132524 0012F324  28 03 00 00 */	cmplwi r3, 0
/* 80132528 0012F328  40 82 00 0C */	bne lbl_80132534
/* 8013252C 0012F32C  38 60 00 00 */	li r3, 0
/* 80132530 0012F330  48 00 00 08 */	b lbl_80132538
lbl_80132534:
/* 80132534 0012F334  38 63 00 04 */	addi r3, r3, 4
lbl_80132538:
/* 80132538 0012F338  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013253C 0012F33C  7C 08 03 A6 */	mtlr r0
/* 80132540 0012F340  38 21 00 10 */	addi r1, r1, 0x10
/* 80132544 0012F344  4E 80 00 20 */	blr 

.global load__8ztalkboxFRCQ28ztalkbox10asset_type
load__8ztalkboxFRCQ28ztalkbox10asset_type:
/* 80132548 0012F348  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013254C 0012F34C  7C 08 02 A6 */	mflr r0
/* 80132550 0012F350  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132554 0012F354  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132558 0012F358  7C 9F 23 78 */	mr r31, r4
/* 8013255C 0012F35C  93 C1 00 08 */	stw r30, 8(r1)
/* 80132560 0012F360  7C 7E 1B 78 */	mr r30, r3
/* 80132564 0012F364  4B ED 6E 9D */	bl xBaseInit__FP5xBaseP10xBaseAsset
/* 80132568 0012F368  38 00 00 34 */	li r0, 0x34
/* 8013256C 0012F36C  3C 60 80 13 */	lis r3, cb_dispatch__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FP5xBaseP5xBaseUiPCfP5xBase@ha
/* 80132570 0012F370  98 1E 00 04 */	stb r0, 4(r30)
/* 80132574 0012F374  38 03 23 58 */	addi r0, r3, cb_dispatch__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FP5xBaseP5xBaseUiPCfP5xBase@l
/* 80132578 0012F378  93 FE 00 14 */	stw r31, 0x14(r30)
/* 8013257C 0012F37C  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80132580 0012F380  88 1E 00 05 */	lbz r0, 5(r30)
/* 80132584 0012F384  28 00 00 00 */	cmplwi r0, 0
/* 80132588 0012F388  41 82 00 0C */	beq lbl_80132594
/* 8013258C 0012F38C  38 1F 00 48 */	addi r0, r31, 0x48
/* 80132590 0012F390  90 1E 00 08 */	stw r0, 8(r30)
lbl_80132594:
/* 80132594 0012F394  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 80132598 0012F398  4B F8 24 A5 */	bl zSceneFindObject__FUi
/* 8013259C 0012F39C  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 801325A0 0012F3A0  90 7E 00 18 */	stw r3, 0x18(r30)
/* 801325A4 0012F3A4  28 00 00 00 */	cmplwi r0, 0
/* 801325A8 0012F3A8  40 82 00 10 */	bne lbl_801325B8
/* 801325AC 0012F3AC  38 00 00 00 */	li r0, 0
/* 801325B0 0012F3B0  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 801325B4 0012F3B4  48 00 00 10 */	b lbl_801325C4
lbl_801325B8:
/* 801325B8 0012F3B8  7C 03 03 78 */	mr r3, r0
/* 801325BC 0012F3BC  4B F8 24 81 */	bl zSceneFindObject__FUi
/* 801325C0 0012F3C0  90 7E 00 1C */	stw r3, 0x1c(r30)
lbl_801325C4:
/* 801325C4 0012F3C4  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 801325C8 0012F3C8  28 03 00 00 */	cmplwi r3, 0
/* 801325CC 0012F3CC  40 82 00 10 */	bne lbl_801325DC
/* 801325D0 0012F3D0  38 00 00 00 */	li r0, 0
/* 801325D4 0012F3D4  90 1E 00 20 */	stw r0, 0x20(r30)
/* 801325D8 0012F3D8  48 00 00 0C */	b lbl_801325E4
lbl_801325DC:
/* 801325DC 0012F3DC  4B F8 24 61 */	bl zSceneFindObject__FUi
/* 801325E0 0012F3E0  90 7E 00 20 */	stw r3, 0x20(r30)
lbl_801325E4:
/* 801325E4 0012F3E4  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 801325E8 0012F3E8  4B FF FF 19 */	bl load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 801325EC 0012F3EC  90 7E 00 24 */	stw r3, 0x24(r30)
/* 801325F0 0012F3F0  80 7F 00 38 */	lwz r3, 0x38(r31)
/* 801325F4 0012F3F4  4B FF FF 0D */	bl load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 801325F8 0012F3F8  90 7E 00 28 */	stw r3, 0x28(r30)
/* 801325FC 0012F3FC  80 7F 00 3C */	lwz r3, 0x3c(r31)
/* 80132600 0012F400  4B FF FF 01 */	bl load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 80132604 0012F404  90 7E 00 2C */	stw r3, 0x2c(r30)
/* 80132608 0012F408  80 7F 00 40 */	lwz r3, 0x40(r31)
/* 8013260C 0012F40C  4B FF FE F5 */	bl load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 80132610 0012F410  90 7E 00 30 */	stw r3, 0x30(r30)
/* 80132614 0012F414  80 7F 00 44 */	lwz r3, 0x44(r31)
/* 80132618 0012F418  4B FF FE E9 */	bl load_text__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 8013261C 0012F41C  90 7E 00 34 */	stw r3, 0x34(r30)
/* 80132620 0012F420  7F C3 F3 78 */	mr r3, r30
/* 80132624 0012F424  48 00 00 1D */	bl reset__8ztalkboxFv
/* 80132628 0012F428  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013262C 0012F42C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132630 0012F430  83 C1 00 08 */	lwz r30, 8(r1)
/* 80132634 0012F434  7C 08 03 A6 */	mtlr r0
/* 80132638 0012F438  38 21 00 10 */	addi r1, r1, 0x10
/* 8013263C 0012F43C  4E 80 00 20 */	blr 

.global reset__8ztalkboxFv
reset__8ztalkboxFv:
/* 80132640 0012F440  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132644 0012F444  7C 08 02 A6 */	mflr r0
/* 80132648 0012F448  38 80 00 01 */	li r4, 1
/* 8013264C 0012F44C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132650 0012F450  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80132654 0012F454  50 80 3E 30 */	rlwimi r0, r4, 7, 0x18, 0x18
/* 80132658 0012F458  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 8013265C 0012F45C  98 03 00 10 */	stb r0, 0x10(r3)
/* 80132660 0012F460  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80132664 0012F464  80 04 00 08 */	lwz r0, 8(r4)
/* 80132668 0012F468  7C 00 18 40 */	cmplw r0, r3
/* 8013266C 0012F46C  40 82 00 08 */	bne lbl_80132674
/* 80132670 0012F470  4B FF F6 F1 */	bl deactivate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_80132674:
/* 80132674 0012F474  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132678 0012F478  7C 08 03 A6 */	mtlr r0
/* 8013267C 0012F47C  38 21 00 10 */	addi r1, r1, 0x10
/* 80132680 0012F480  4E 80 00 20 */	blr 

.global set_text__8ztalkboxFPCc
set_text__8ztalkboxFPCc:
/* 80132684 0012F484  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132688 0012F488  7C 08 02 A6 */	mflr r0
/* 8013268C 0012F48C  28 04 00 00 */	cmplwi r4, 0
/* 80132690 0012F490  90 01 00 24 */	stw r0, 0x24(r1)
/* 80132694 0012F494  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80132698 0012F498  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013269C 0012F49C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801326A0 0012F4A0  7C 7D 1B 78 */	mr r29, r3
/* 801326A4 0012F4A4  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 801326A8 0012F4A8  41 82 00 10 */	beq lbl_801326B8
/* 801326AC 0012F4AC  7F C3 F3 78 */	mr r3, r30
/* 801326B0 0012F4B0  48 00 1F A1 */	bl set_text__8ztextboxFPCc
/* 801326B4 0012F4B4  48 00 00 0C */	b lbl_801326C0
lbl_801326B8:
/* 801326B8 0012F4B8  7F C3 F3 78 */	mr r3, r30
/* 801326BC 0012F4BC  48 00 20 BD */	bl clear_text__8ztextboxFv
lbl_801326C0:
/* 801326C0 0012F4C0  7F C3 F3 78 */	mr r3, r30
/* 801326C4 0012F4C4  48 00 20 D1 */	bl refresh__8ztextboxFv
/* 801326C8 0012F4C8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801326CC 0012F4CC  3B E3 B3 20 */	addi r31, r3, lbl_8031B320@l
/* 801326D0 0012F4D0  80 1F 00 08 */	lwz r0, 8(r31)
/* 801326D4 0012F4D4  7C 00 E8 40 */	cmplw r0, r29
/* 801326D8 0012F4D8  40 82 00 70 */	bne lbl_80132748
/* 801326DC 0012F4DC  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801326E0 0012F4E0  28 03 00 00 */	cmplwi r3, 0
/* 801326E4 0012F4E4  41 82 00 1C */	beq lbl_80132700
/* 801326E8 0012F4E8  81 83 00 04 */	lwz r12, 4(r3)
/* 801326EC 0012F4EC  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 801326F0 0012F4F0  7D 89 03 A6 */	mtctr r12
/* 801326F4 0012F4F4  4E 80 04 21 */	bctrl 
/* 801326F8 0012F4F8  38 00 00 00 */	li r0, 0
/* 801326FC 0012F4FC  90 1F 00 0C */	stw r0, 0xc(r31)
lbl_80132700:
/* 80132700 0012F500  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132704 0012F504  38 9E 00 18 */	addi r4, r30, 0x18
/* 80132708 0012F508  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 8013270C 0012F50C  38 A0 00 00 */	li r5, 0
/* 80132710 0012F510  38 63 00 24 */	addi r3, r3, 0x24
/* 80132714 0012F514  4B EF 05 B5 */	bl refresh__Q28xtextbox6layoutFRC8xtextboxb
/* 80132718 0012F518  4B FF F7 65 */	bl layout_contains_streams__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 8013271C 0012F51C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80132720 0012F520  41 82 00 08 */	beq lbl_80132728
/* 80132724 0012F524  4B FF F8 1D */	bl lock_stream__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_80132728:
/* 80132728 0012F528  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013272C 0012F52C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132730 0012F530  80 63 00 14 */	lwz r3, 0x14(r3)
/* 80132734 0012F534  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80132738 0012F538  81 83 00 04 */	lwz r12, 4(r3)
/* 8013273C 0012F53C  81 8C 00 08 */	lwz r12, 8(r12)
/* 80132740 0012F540  7D 89 03 A6 */	mtctr r12
/* 80132744 0012F544  4E 80 04 21 */	bctrl 
lbl_80132748:
/* 80132748 0012F548  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013274C 0012F54C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80132750 0012F550  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80132754 0012F554  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80132758 0012F558  7C 08 03 A6 */	mtlr r0
/* 8013275C 0012F55C  38 21 00 20 */	addi r1, r1, 0x20
/* 80132760 0012F560  4E 80 00 20 */	blr 

start__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFv:
/* 80132764 0012F564  4E 80 00 20 */	blr 

stop__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFv:
/* 80132768 0012F568  4E 80 00 20 */	blr 

.global set_text__8ztalkboxFUi
set_text__8ztalkboxFUi:
/* 8013276C 0012F56C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132770 0012F570  7C 08 02 A6 */	mflr r0
/* 80132774 0012F574  28 04 00 00 */	cmplwi r4, 0
/* 80132778 0012F578  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013277C 0012F57C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132780 0012F580  7C 7F 1B 78 */	mr r31, r3
/* 80132784 0012F584  41 82 00 30 */	beq lbl_801327B4
/* 80132788 0012F588  7C 83 23 78 */	mr r3, r4
/* 8013278C 0012F58C  38 80 00 00 */	li r4, 0
/* 80132790 0012F590  4B F1 8F 7D */	bl xSTFindAsset__FUiPUi
/* 80132794 0012F594  7C 64 1B 79 */	or. r4, r3, r3
/* 80132798 0012F598  40 82 00 10 */	bne lbl_801327A8
/* 8013279C 0012F59C  7F E3 FB 78 */	mr r3, r31
/* 801327A0 0012F5A0  48 00 00 CD */	bl clear_text__8ztalkboxFv
/* 801327A4 0012F5A4  48 00 00 10 */	b lbl_801327B4
lbl_801327A8:
/* 801327A8 0012F5A8  7F E3 FB 78 */	mr r3, r31
/* 801327AC 0012F5AC  38 84 00 04 */	addi r4, r4, 4
/* 801327B0 0012F5B0  4B FF FE D5 */	bl set_text__8ztalkboxFPCc
lbl_801327B4:
/* 801327B4 0012F5B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801327B8 0012F5B8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801327BC 0012F5BC  7C 08 03 A6 */	mtlr r0
/* 801327C0 0012F5C0  38 21 00 10 */	addi r1, r1, 0x10
/* 801327C4 0012F5C4  4E 80 00 20 */	blr 

.global add_text__8ztalkboxFPCc
add_text__8ztalkboxFPCc:
/* 801327C8 0012F5C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801327CC 0012F5CC  7C 08 02 A6 */	mflr r0
/* 801327D0 0012F5D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801327D4 0012F5D4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801327D8 0012F5D8  7C 7F 1B 78 */	mr r31, r3
/* 801327DC 0012F5DC  80 63 00 18 */	lwz r3, 0x18(r3)
/* 801327E0 0012F5E0  48 00 1F 11 */	bl add_text__8ztextboxFPCc
/* 801327E4 0012F5E4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801327E8 0012F5E8  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801327EC 0012F5EC  80 03 00 08 */	lwz r0, 8(r3)
/* 801327F0 0012F5F0  7C 00 F8 40 */	cmplw r0, r31
/* 801327F4 0012F5F4  40 82 00 14 */	bne lbl_80132808
/* 801327F8 0012F5F8  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 801327FC 0012F5FC  38 63 00 24 */	addi r3, r3, 0x24
/* 80132800 0012F600  38 84 00 18 */	addi r4, r4, 0x18
/* 80132804 0012F604  4B EF 05 29 */	bl refresh_end__Q28xtextbox6layoutFRC8xtextbox
lbl_80132808:
/* 80132808 0012F608  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013280C 0012F60C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132810 0012F610  7C 08 03 A6 */	mtlr r0
/* 80132814 0012F614  38 21 00 10 */	addi r1, r1, 0x10
/* 80132818 0012F618  4E 80 00 20 */	blr 

.global add_text__8ztalkboxFUi
add_text__8ztalkboxFUi:
/* 8013281C 0012F61C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132820 0012F620  7C 08 02 A6 */	mflr r0
/* 80132824 0012F624  28 04 00 00 */	cmplwi r4, 0
/* 80132828 0012F628  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013282C 0012F62C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132830 0012F630  7C 7F 1B 78 */	mr r31, r3
/* 80132834 0012F634  41 82 00 24 */	beq lbl_80132858
/* 80132838 0012F638  7C 83 23 78 */	mr r3, r4
/* 8013283C 0012F63C  38 80 00 00 */	li r4, 0
/* 80132840 0012F640  4B F1 8E CD */	bl xSTFindAsset__FUiPUi
/* 80132844 0012F644  7C 64 1B 79 */	or. r4, r3, r3
/* 80132848 0012F648  41 82 00 10 */	beq lbl_80132858
/* 8013284C 0012F64C  7F E3 FB 78 */	mr r3, r31
/* 80132850 0012F650  38 84 00 04 */	addi r4, r4, 4
/* 80132854 0012F654  4B FF FF 75 */	bl add_text__8ztalkboxFPCc
lbl_80132858:
/* 80132858 0012F658  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013285C 0012F65C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132860 0012F660  7C 08 03 A6 */	mtlr r0
/* 80132864 0012F664  38 21 00 10 */	addi r1, r1, 0x10
/* 80132868 0012F668  4E 80 00 20 */	blr 

.global clear_text__8ztalkboxFv
clear_text__8ztalkboxFv:
/* 8013286C 0012F66C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132870 0012F670  7C 08 02 A6 */	mflr r0
/* 80132874 0012F674  38 80 00 00 */	li r4, 0
/* 80132878 0012F678  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013287C 0012F67C  4B FF FE 09 */	bl set_text__8ztalkboxFPCc
/* 80132880 0012F680  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132884 0012F684  7C 08 03 A6 */	mtlr r0
/* 80132888 0012F688  38 21 00 10 */	addi r1, r1, 0x10
/* 8013288C 0012F68C  4E 80 00 20 */	blr 

.global start_talk__8ztalkboxFPCcPQ28ztalkbox8callbackP10zNPCCommon
start_talk__8ztalkboxFPCcPQ28ztalkbox8callbackP10zNPCCommon:
/* 80132890 0012F690  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132894 0012F694  7C 08 02 A6 */	mflr r0
/* 80132898 0012F698  90 01 00 24 */	stw r0, 0x24(r1)
/* 8013289C 0012F69C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801328A0 0012F6A0  7C BF 2B 78 */	mr r31, r5
/* 801328A4 0012F6A4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801328A8 0012F6A8  7C 9E 23 78 */	mr r30, r4
/* 801328AC 0012F6AC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801328B0 0012F6B0  7C 7D 1B 78 */	mr r29, r3
/* 801328B4 0012F6B4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801328B8 0012F6B8  90 DD 00 38 */	stw r6, 0x38(r29)
/* 801328BC 0012F6BC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801328C0 0012F6C0  80 63 00 08 */	lwz r3, 8(r3)
/* 801328C4 0012F6C4  28 03 00 00 */	cmplwi r3, 0
/* 801328C8 0012F6C8  41 82 00 08 */	beq lbl_801328D0
/* 801328CC 0012F6CC  48 00 01 C5 */	bl stop_talk__8ztalkboxFv
lbl_801328D0:
/* 801328D0 0012F6D0  7F A3 EB 78 */	mr r3, r29
/* 801328D4 0012F6D4  4B FF F4 F9 */	bl activate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FR8ztalkbox
/* 801328D8 0012F6D8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801328DC 0012F6DC  38 00 00 00 */	li r0, 0
/* 801328E0 0012F6E0  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801328E4 0012F6E4  3C 63 00 01 */	addis r3, r3, 1
/* 801328E8 0012F6E8  93 E3 8D 7C */	stw r31, -0x7284(r3)
/* 801328EC 0012F6EC  90 03 8D 48 */	stw r0, -0x72b8(r3)
/* 801328F0 0012F6F0  4B FF E0 45 */	bl reset_auto_wait__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801328F4 0012F6F4  80 9D 00 14 */	lwz r4, 0x14(r29)
/* 801328F8 0012F6F8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801328FC 0012F6FC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132900 0012F700  38 00 00 00 */	li r0, 0
/* 80132904 0012F704  88 A4 00 1E */	lbz r5, 0x1e(r4)
/* 80132908 0012F708  3C 63 00 01 */	addis r3, r3, 1
/* 8013290C 0012F70C  7C 85 00 D0 */	neg r4, r5
/* 80132910 0012F710  7C 84 2B 78 */	or r4, r4, r5
/* 80132914 0012F714  54 84 0F FE */	srwi r4, r4, 0x1f
/* 80132918 0012F718  98 83 8D 78 */	stb r4, -0x7288(r3)
/* 8013291C 0012F71C  98 03 8D 79 */	stb r0, -0x7287(r3)
/* 80132920 0012F720  80 7D 00 14 */	lwz r3, 0x14(r29)
/* 80132924 0012F724  88 03 00 1C */	lbz r0, 0x1c(r3)
/* 80132928 0012F728  28 00 00 00 */	cmplwi r0, 0
/* 8013292C 0012F72C  41 82 00 10 */	beq lbl_8013293C
/* 80132930 0012F730  38 60 00 10 */	li r3, 0x10
/* 80132934 0012F734  4B F3 3C 25 */	bl zEntPlayerControlOff__F13zControlOwner
/* 80132938 0012F738  48 00 00 0C */	b lbl_80132944
lbl_8013293C:
/* 8013293C 0012F73C  38 60 00 10 */	li r3, 0x10
/* 80132940 0012F740  4B F3 3B C1 */	bl zEntPlayerControlOn__F13zControlOwner
lbl_80132944:
/* 80132944 0012F744  7F A3 EB 78 */	mr r3, r29
/* 80132948 0012F748  38 80 00 01 */	li r4, 1
/* 8013294C 0012F74C  48 00 03 49 */	bl MasterTellSlaves__8ztalkboxFi
/* 80132950 0012F750  4B FF F6 C5 */	bl refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132954 0012F754  83 BD 00 18 */	lwz r29, 0x18(r29)
/* 80132958 0012F758  88 1D 00 10 */	lbz r0, 0x10(r29)
/* 8013295C 0012F75C  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80132960 0012F760  41 82 00 0C */	beq lbl_8013296C
/* 80132964 0012F764  7F A3 EB 78 */	mr r3, r29
/* 80132968 0012F768  48 00 1C 85 */	bl deactivate__8ztextboxFv
lbl_8013296C:
/* 8013296C 0012F76C  28 1E 00 00 */	cmplwi r30, 0
/* 80132970 0012F770  41 82 00 10 */	beq lbl_80132980
/* 80132974 0012F774  7F A3 EB 78 */	mr r3, r29
/* 80132978 0012F778  7F C4 F3 78 */	mr r4, r30
/* 8013297C 0012F77C  48 00 1C D5 */	bl set_text__8ztextboxFPCc
lbl_80132980:
/* 80132980 0012F780  7F A3 EB 78 */	mr r3, r29
/* 80132984 0012F784  48 00 1E 11 */	bl refresh__8ztextboxFv
/* 80132988 0012F788  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013298C 0012F78C  38 9D 00 18 */	addi r4, r29, 0x18
/* 80132990 0012F790  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132994 0012F794  38 A0 00 00 */	li r5, 0
/* 80132998 0012F798  38 63 00 24 */	addi r3, r3, 0x24
/* 8013299C 0012F79C  4B EF 03 2D */	bl refresh__Q28xtextbox6layoutFRC8xtextboxb
/* 801329A0 0012F7A0  4B FF F4 DD */	bl layout_contains_streams__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801329A4 0012F7A4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801329A8 0012F7A8  41 82 00 08 */	beq lbl_801329B0
/* 801329AC 0012F7AC  4B FF F5 95 */	bl lock_stream__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_801329B0:
/* 801329B0 0012F7B0  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 801329B4 0012F7B4  38 60 01 61 */	li r3, 0x161
/* 801329B8 0012F7B8  3B A4 B3 20 */	addi r29, r4, lbl_8031B320@l
/* 801329BC 0012F7BC  80 1D 00 14 */	lwz r0, 0x14(r29)
/* 801329C0 0012F7C0  90 1D 00 0C */	stw r0, 0xc(r29)
/* 801329C4 0012F7C4  4B FF DC B1 */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 801329C8 0012F7C8  28 1F 00 00 */	cmplwi r31, 0
/* 801329CC 0012F7CC  41 82 00 18 */	beq lbl_801329E4
/* 801329D0 0012F7D0  7F E3 FB 78 */	mr r3, r31
/* 801329D4 0012F7D4  81 9F 00 00 */	lwz r12, 0(r31)
/* 801329D8 0012F7D8  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 801329DC 0012F7DC  7D 89 03 A6 */	mtctr r12
/* 801329E0 0012F7E0  4E 80 04 21 */	bctrl 
lbl_801329E4:
/* 801329E4 0012F7E4  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 801329E8 0012F7E8  81 83 00 04 */	lwz r12, 4(r3)
/* 801329EC 0012F7EC  81 8C 00 08 */	lwz r12, 8(r12)
/* 801329F0 0012F7F0  7D 89 03 A6 */	mtctr r12
/* 801329F4 0012F7F4  4E 80 04 21 */	bctrl 
/* 801329F8 0012F7F8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801329FC 0012F7FC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80132A00 0012F800  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80132A04 0012F804  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80132A08 0012F808  7C 08 03 A6 */	mtlr r0
/* 80132A0C 0012F80C  38 21 00 20 */	addi r1, r1, 0x20
/* 80132A10 0012F810  4E 80 00 20 */	blr 

.global start_talk__8ztalkboxFUiPQ28ztalkbox8callbackP10zNPCCommon
start_talk__8ztalkboxFUiPQ28ztalkbox8callbackP10zNPCCommon:
/* 80132A14 0012F814  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132A18 0012F818  7C 08 02 A6 */	mflr r0
/* 80132A1C 0012F81C  28 04 00 00 */	cmplwi r4, 0
/* 80132A20 0012F820  90 01 00 24 */	stw r0, 0x24(r1)
/* 80132A24 0012F824  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80132A28 0012F828  7C DF 33 78 */	mr r31, r6
/* 80132A2C 0012F82C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80132A30 0012F830  7C BE 2B 78 */	mr r30, r5
/* 80132A34 0012F834  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80132A38 0012F838  7C 7D 1B 78 */	mr r29, r3
/* 80132A3C 0012F83C  40 82 00 10 */	bne lbl_80132A4C
/* 80132A40 0012F840  38 80 00 00 */	li r4, 0
/* 80132A44 0012F844  4B FF FE 4D */	bl start_talk__8ztalkboxFPCcPQ28ztalkbox8callbackP10zNPCCommon
/* 80132A48 0012F848  48 00 00 2C */	b lbl_80132A74
lbl_80132A4C:
/* 80132A4C 0012F84C  7C 83 23 78 */	mr r3, r4
/* 80132A50 0012F850  38 80 00 00 */	li r4, 0
/* 80132A54 0012F854  4B F1 8C B9 */	bl xSTFindAsset__FUiPUi
/* 80132A58 0012F858  7C 64 1B 79 */	or. r4, r3, r3
/* 80132A5C 0012F85C  41 82 00 18 */	beq lbl_80132A74
/* 80132A60 0012F860  7F A3 EB 78 */	mr r3, r29
/* 80132A64 0012F864  7F C5 F3 78 */	mr r5, r30
/* 80132A68 0012F868  7F E6 FB 78 */	mr r6, r31
/* 80132A6C 0012F86C  38 84 00 04 */	addi r4, r4, 4
/* 80132A70 0012F870  4B FF FE 21 */	bl start_talk__8ztalkboxFPCcPQ28ztalkbox8callbackP10zNPCCommon
lbl_80132A74:
/* 80132A74 0012F874  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80132A78 0012F878  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80132A7C 0012F87C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80132A80 0012F880  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80132A84 0012F884  7C 08 03 A6 */	mtlr r0
/* 80132A88 0012F888  38 21 00 20 */	addi r1, r1, 0x20
/* 80132A8C 0012F88C  4E 80 00 20 */	blr 

.global stop_talk__8ztalkboxFv
stop_talk__8ztalkboxFv:
/* 80132A90 0012F890  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132A94 0012F894  7C 08 02 A6 */	mflr r0
/* 80132A98 0012F898  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80132A9C 0012F89C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132AA0 0012F8A0  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80132AA4 0012F8A4  80 04 00 08 */	lwz r0, 8(r4)
/* 80132AA8 0012F8A8  7C 00 18 40 */	cmplw r0, r3
/* 80132AAC 0012F8AC  40 82 00 08 */	bne lbl_80132AB4
/* 80132AB0 0012F8B0  48 00 00 15 */	bl stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_80132AB4:
/* 80132AB4 0012F8B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132AB8 0012F8B8  7C 08 03 A6 */	mtlr r0
/* 80132ABC 0012F8BC  38 21 00 10 */	addi r1, r1, 0x10
/* 80132AC0 0012F8C0  4E 80 00 20 */	blr 

/* stop__22@unnamed@zTalkBox_cpp@Fv */
stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 80132AC4 0012F8C4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132AC8 0012F8C8  7C 08 02 A6 */	mflr r0
/* 80132ACC 0012F8CC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132AD0 0012F8D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132AD4 0012F8D4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132AD8 0012F8D8  3B E3 B3 20 */	addi r31, r3, lbl_8031B320@l
/* 80132ADC 0012F8DC  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80132AE0 0012F8E0  28 03 00 00 */	cmplwi r3, 0
/* 80132AE4 0012F8E4  41 82 00 8C */	beq lbl_80132B70
/* 80132AE8 0012F8E8  81 83 00 04 */	lwz r12, 4(r3)
/* 80132AEC 0012F8EC  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 80132AF0 0012F8F0  7D 89 03 A6 */	mtctr r12
/* 80132AF4 0012F8F4  4E 80 04 21 */	bctrl 
/* 80132AF8 0012F8F8  4B FF F7 75 */	bl hide_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132AFC 0012F8FC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132B00 0012F900  38 80 00 00 */	li r4, 0
/* 80132B04 0012F904  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132B08 0012F908  80 63 00 08 */	lwz r3, 8(r3)
/* 80132B0C 0012F90C  48 00 01 89 */	bl MasterTellSlaves__8ztalkboxFi
/* 80132B10 0012F910  38 60 00 10 */	li r3, 0x10
/* 80132B14 0012F914  4B F3 39 ED */	bl zEntPlayerControlOn__F13zControlOwner
/* 80132B18 0012F918  38 60 01 62 */	li r3, 0x162
/* 80132B1C 0012F91C  4B FF DB 59 */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
/* 80132B20 0012F920  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132B24 0012F924  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132B28 0012F928  3C 63 00 01 */	addis r3, r3, 1
/* 80132B2C 0012F92C  80 63 8D 7C */	lwz r3, -0x7284(r3)
/* 80132B30 0012F930  28 03 00 00 */	cmplwi r3, 0
/* 80132B34 0012F934  41 82 00 14 */	beq lbl_80132B48
/* 80132B38 0012F938  81 83 00 00 */	lwz r12, 0(r3)
/* 80132B3C 0012F93C  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 80132B40 0012F940  7D 89 03 A6 */	mtctr r12
/* 80132B44 0012F944  4E 80 04 21 */	bctrl 
lbl_80132B48:
/* 80132B48 0012F948  38 00 00 00 */	li r0, 0
/* 80132B4C 0012F94C  90 1F 00 0C */	stw r0, 0xc(r31)
/* 80132B50 0012F950  4B FF F2 11 */	bl deactivate__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132B54 0012F954  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132B58 0012F958  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132B5C 0012F95C  3C 63 00 01 */	addis r3, r3, 1
/* 80132B60 0012F960  38 63 8D 5C */	addi r3, r3, -29348
/* 80132B64 0012F964  48 00 11 75 */	bl clear__14sound_queue_esc__0_4_esc__1_Fv
/* 80132B68 0012F968  4B FF DA 95 */	bl speak_stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80132B6C 0012F96C  4B FF F4 41 */	bl unlock_stream__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_80132B70:
/* 80132B70 0012F970  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132B74 0012F974  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132B78 0012F978  7C 08 03 A6 */	mtlr r0
/* 80132B7C 0012F97C  38 21 00 10 */	addi r1, r1, 0x10
/* 80132B80 0012F980  4E 80 00 20 */	blr 

.global stop_wait__8ztalkboxFUi
stop_wait__8ztalkboxFUi:
/* 80132B84 0012F984  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 80132B88 0012F988  38 A5 B3 20 */	addi r5, r5, lbl_8031B320@l
/* 80132B8C 0012F98C  80 05 00 08 */	lwz r0, 8(r5)
/* 80132B90 0012F990  7C 00 18 40 */	cmplw r0, r3
/* 80132B94 0012F994  4C 82 00 20 */	bnelr 
/* 80132B98 0012F998  3C 65 00 01 */	addis r3, r5, 1
/* 80132B9C 0012F99C  80 03 8D 48 */	lwz r0, -0x72b8(r3)
/* 80132BA0 0012F9A0  7C 00 23 78 */	or r0, r0, r4
/* 80132BA4 0012F9A4  90 03 8D 48 */	stw r0, -0x72b8(r3)
/* 80132BA8 0012F9A8  4E 80 00 20 */	blr 

.global show__8ztalkboxFv
show__8ztalkboxFv:
/* 80132BAC 0012F9AC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132BB0 0012F9B0  7C 08 02 A6 */	mflr r0
/* 80132BB4 0012F9B4  38 80 00 01 */	li r4, 1
/* 80132BB8 0012F9B8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132BBC 0012F9BC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132BC0 0012F9C0  7C 7F 1B 78 */	mr r31, r3
/* 80132BC4 0012F9C4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132BC8 0012F9C8  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80132BCC 0012F9CC  50 80 3E 30 */	rlwimi r0, r4, 7, 0x18, 0x18
/* 80132BD0 0012F9D0  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132BD4 0012F9D4  98 1F 00 10 */	stb r0, 0x10(r31)
/* 80132BD8 0012F9D8  80 03 00 08 */	lwz r0, 8(r3)
/* 80132BDC 0012F9DC  7C 00 F8 40 */	cmplw r0, r31
/* 80132BE0 0012F9E0  40 82 00 48 */	bne lbl_80132C28
/* 80132BE4 0012F9E4  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80132BE8 0012F9E8  28 03 00 00 */	cmplwi r3, 0
/* 80132BEC 0012F9EC  41 82 00 08 */	beq lbl_80132BF4
/* 80132BF0 0012F9F0  48 00 19 B1 */	bl activate__8ztextboxFv
lbl_80132BF4:
/* 80132BF4 0012F9F4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132BF8 0012F9F8  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132BFC 0012F9FC  3C 63 00 01 */	addis r3, r3, 1
/* 80132C00 0012FA00  88 03 8D 78 */	lbz r0, -0x7288(r3)
/* 80132C04 0012FA04  28 00 00 00 */	cmplwi r0, 0
/* 80132C08 0012FA08  41 82 00 20 */	beq lbl_80132C28
/* 80132C0C 0012FA0C  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 80132C10 0012FA10  28 00 00 00 */	cmplwi r0, 0
/* 80132C14 0012FA14  41 82 00 14 */	beq lbl_80132C28
/* 80132C18 0012FA18  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80132C1C 0012FA1C  28 03 00 00 */	cmplwi r3, 0
/* 80132C20 0012FA20  41 82 00 08 */	beq lbl_80132C28
/* 80132C24 0012FA24  48 00 19 7D */	bl activate__8ztextboxFv
lbl_80132C28:
/* 80132C28 0012FA28  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132C2C 0012FA2C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132C30 0012FA30  7C 08 03 A6 */	mtlr r0
/* 80132C34 0012FA34  38 21 00 10 */	addi r1, r1, 0x10
/* 80132C38 0012FA38  4E 80 00 20 */	blr 

.global hide__8ztalkboxFv
hide__8ztalkboxFv:
/* 80132C3C 0012FA3C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132C40 0012FA40  7C 08 02 A6 */	mflr r0
/* 80132C44 0012FA44  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132C48 0012FA48  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132C4C 0012FA4C  7C 7F 1B 78 */	mr r31, r3
/* 80132C50 0012FA50  38 60 00 00 */	li r3, 0
/* 80132C54 0012FA54  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80132C58 0012FA58  50 60 3E 30 */	rlwimi r0, r3, 7, 0x18, 0x18
/* 80132C5C 0012FA5C  98 1F 00 10 */	stb r0, 0x10(r31)
/* 80132C60 0012FA60  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80132C64 0012FA64  28 03 00 00 */	cmplwi r3, 0
/* 80132C68 0012FA68  41 82 00 08 */	beq lbl_80132C70
/* 80132C6C 0012FA6C  48 00 19 81 */	bl deactivate__8ztextboxFv
lbl_80132C70:
/* 80132C70 0012FA70  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80132C74 0012FA74  28 03 00 00 */	cmplwi r3, 0
/* 80132C78 0012FA78  41 82 00 08 */	beq lbl_80132C80
/* 80132C7C 0012FA7C  48 00 19 71 */	bl deactivate__8ztextboxFv
lbl_80132C80:
/* 80132C80 0012FA80  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132C84 0012FA84  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132C88 0012FA88  7C 08 03 A6 */	mtlr r0
/* 80132C8C 0012FA8C  38 21 00 10 */	addi r1, r1, 0x10
/* 80132C90 0012FA90  4E 80 00 20 */	blr 

.global MasterTellSlaves__8ztalkboxFi
MasterTellSlaves__8ztalkboxFi:
/* 80132C94 0012FA94  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132C98 0012FA98  7C 08 02 A6 */	mflr r0
/* 80132C9C 0012FA9C  3C A0 80 3C */	lis r5, globals@ha
/* 80132CA0 0012FAA0  90 01 00 24 */	stw r0, 0x24(r1)
/* 80132CA4 0012FAA4  BF 41 00 08 */	stmw r26, 8(r1)
/* 80132CA8 0012FAA8  7C 7A 1B 78 */	mr r26, r3
/* 80132CAC 0012FAAC  7C 9B 23 78 */	mr r27, r4
/* 80132CB0 0012FAB0  3B A0 00 00 */	li r29, 0
/* 80132CB4 0012FAB4  3B E5 05 58 */	addi r31, r5, globals@l
/* 80132CB8 0012FAB8  3B C0 00 00 */	li r30, 0
/* 80132CBC 0012FABC  48 00 00 54 */	b lbl_80132D10
lbl_80132CC0:
/* 80132CC0 0012FAC0  80 1A 00 08 */	lwz r0, 8(r26)
/* 80132CC4 0012FAC4  7F 80 F2 14 */	add r28, r0, r30
/* 80132CC8 0012FAC8  A0 1C 00 02 */	lhz r0, 2(r28)
/* 80132CCC 0012FACC  28 00 01 33 */	cmplwi r0, 0x133
/* 80132CD0 0012FAD0  40 82 00 38 */	bne lbl_80132D08
/* 80132CD4 0012FAD4  80 7F 1F C0 */	lwz r3, 0x1fc0(r31)
/* 80132CD8 0012FAD8  80 9A 00 00 */	lwz r4, 0(r26)
/* 80132CDC 0012FADC  4B F0 C9 49 */	bl xSceneID2Name__FP6xSceneUi
/* 80132CE0 0012FAE0  80 7F 1F C0 */	lwz r3, 0x1fc0(r31)
/* 80132CE4 0012FAE4  80 9C 00 04 */	lwz r4, 4(r28)
/* 80132CE8 0012FAE8  4B F0 C9 3D */	bl xSceneID2Name__FP6xSceneUi
/* 80132CEC 0012FAEC  80 7C 00 04 */	lwz r3, 4(r28)
/* 80132CF0 0012FAF0  4B F8 1D 4D */	bl zSceneFindObject__FUi
/* 80132CF4 0012FAF4  7C 64 1B 79 */	or. r4, r3, r3
/* 80132CF8 0012FAF8  41 82 00 10 */	beq lbl_80132D08
/* 80132CFC 0012FAFC  7F 43 D3 78 */	mr r3, r26
/* 80132D00 0012FB00  7F 65 DB 78 */	mr r5, r27
/* 80132D04 0012FB04  48 00 00 2D */	bl MasterLoveSlave__8ztalkboxFP5xBasei
lbl_80132D08:
/* 80132D08 0012FB08  3B DE 00 20 */	addi r30, r30, 0x20
/* 80132D0C 0012FB0C  3B BD 00 01 */	addi r29, r29, 1
lbl_80132D10:
/* 80132D10 0012FB10  88 1A 00 05 */	lbz r0, 5(r26)
/* 80132D14 0012FB14  7C 1D 00 00 */	cmpw r29, r0
/* 80132D18 0012FB18  41 80 FF A8 */	blt lbl_80132CC0
/* 80132D1C 0012FB1C  BB 41 00 08 */	lmw r26, 8(r1)
/* 80132D20 0012FB20  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80132D24 0012FB24  7C 08 03 A6 */	mtlr r0
/* 80132D28 0012FB28  38 21 00 20 */	addi r1, r1, 0x20
/* 80132D2C 0012FB2C  4E 80 00 20 */	blr 

.global MasterLoveSlave__8ztalkboxFP5xBasei
MasterLoveSlave__8ztalkboxFP5xBasei:
/* 80132D30 0012FB30  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80132D34 0012FB34  7C 08 02 A6 */	mflr r0
/* 80132D38 0012FB38  90 01 00 24 */	stw r0, 0x24(r1)
/* 80132D3C 0012FB3C  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 80132D40 0012FB40  7C 7B 1B 78 */	mr r27, r3
/* 80132D44 0012FB44  7C BC 2B 78 */	mr r28, r5
/* 80132D48 0012FB48  88 04 00 04 */	lbz r0, 4(r4)
/* 80132D4C 0012FB4C  2C 00 00 2B */	cmpwi r0, 0x2b
/* 80132D50 0012FB50  41 82 00 5C */	beq lbl_80132DAC
/* 80132D54 0012FB54  40 80 00 8C */	bge lbl_80132DE0
/* 80132D58 0012FB58  2C 00 00 11 */	cmpwi r0, 0x11
/* 80132D5C 0012FB5C  41 82 00 08 */	beq lbl_80132D64
/* 80132D60 0012FB60  48 00 00 80 */	b lbl_80132DE0
lbl_80132D64:
/* 80132D64 0012FB64  7C 9E 23 78 */	mr r30, r4
/* 80132D68 0012FB68  7F C3 F3 78 */	mr r3, r30
/* 80132D6C 0012FB6C  4B EF A1 11 */	bl xGroupGetCount__FP6xGroup
/* 80132D70 0012FB70  7C 7F 1B 78 */	mr r31, r3
/* 80132D74 0012FB74  3B A0 00 00 */	li r29, 0
/* 80132D78 0012FB78  48 00 00 28 */	b lbl_80132DA0
lbl_80132D7C:
/* 80132D7C 0012FB7C  7F C3 F3 78 */	mr r3, r30
/* 80132D80 0012FB80  7F A4 EB 78 */	mr r4, r29
/* 80132D84 0012FB84  4B EF A1 05 */	bl xGroupGetItemPtr__FP6xGroupUi
/* 80132D88 0012FB88  7C 64 1B 79 */	or. r4, r3, r3
/* 80132D8C 0012FB8C  41 82 00 10 */	beq lbl_80132D9C
/* 80132D90 0012FB90  7F 63 DB 78 */	mr r3, r27
/* 80132D94 0012FB94  7F 85 E3 78 */	mr r5, r28
/* 80132D98 0012FB98  4B FF FF 99 */	bl MasterLoveSlave__8ztalkboxFP5xBasei
lbl_80132D9C:
/* 80132D9C 0012FB9C  3B BD 00 01 */	addi r29, r29, 1
lbl_80132DA0:
/* 80132DA0 0012FBA0  7C 1D F8 00 */	cmpw r29, r31
/* 80132DA4 0012FBA4  41 80 FF D8 */	blt lbl_80132D7C
/* 80132DA8 0012FBA8  48 00 00 38 */	b lbl_80132DE0
lbl_80132DAC:
/* 80132DAC 0012FBAC  2C 1C 00 00 */	cmpwi r28, 0
/* 80132DB0 0012FBB0  41 82 00 1C */	beq lbl_80132DCC
/* 80132DB4 0012FBB4  7C 83 23 78 */	mr r3, r4
/* 80132DB8 0012FBB8  81 84 01 B8 */	lwz r12, 0x1b8(r4)
/* 80132DBC 0012FBBC  81 8C 00 A0 */	lwz r12, 0xa0(r12)
/* 80132DC0 0012FBC0  7D 89 03 A6 */	mtctr r12
/* 80132DC4 0012FBC4  4E 80 04 21 */	bctrl 
/* 80132DC8 0012FBC8  48 00 00 18 */	b lbl_80132DE0
lbl_80132DCC:
/* 80132DCC 0012FBCC  7C 83 23 78 */	mr r3, r4
/* 80132DD0 0012FBD0  81 84 01 B8 */	lwz r12, 0x1b8(r4)
/* 80132DD4 0012FBD4  81 8C 00 A4 */	lwz r12, 0xa4(r12)
/* 80132DD8 0012FBD8  7D 89 03 A6 */	mtctr r12
/* 80132DDC 0012FBDC  4E 80 04 21 */	bctrl 
lbl_80132DE0:
/* 80132DE0 0012FBE0  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 80132DE4 0012FBE4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80132DE8 0012FBE8  7C 08 03 A6 */	mtlr r0
/* 80132DEC 0012FBEC  38 21 00 20 */	addi r1, r1, 0x20
/* 80132DF0 0012FBF0  4E 80 00 20 */	blr 

.global load_settings__8ztalkboxFR8xIniFile
load_settings__8ztalkboxFR8xIniFile:
/* 80132DF4 0012FBF4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132DF8 0012FBF8  7C 08 02 A6 */	mflr r0
/* 80132DFC 0012FBFC  3C 80 80 27 */	lis r4, lbl_8026C920@ha
/* 80132E00 0012FC00  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132E04 0012FC04  38 84 C9 20 */	addi r4, r4, lbl_8026C920@l
/* 80132E08 0012FC08  38 84 00 EA */	addi r4, r4, 0xea
/* 80132E0C 0012FC0C  C0 22 A3 38 */	lfs f1, lbl_803CECB8-_SDA2_BASE_(r2)
/* 80132E10 0012FC10  4B EF DD 35 */	bl xIniGetFloat__FP8xIniFilePcf
/* 80132E14 0012FC14  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80132E18 0012FC18  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80132E1C 0012FC1C  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80132E20 0012FC20  38 A0 00 00 */	li r5, 0
/* 80132E24 0012FC24  3C 84 00 01 */	addis r4, r4, 1
/* 80132E28 0012FC28  D4 24 8E 90 */	stfsu f1, -0x7170(r4)
/* 80132E2C 0012FC2C  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80132E30 0012FC30  38 C0 00 00 */	li r6, 0
/* 80132E34 0012FC34  C0 22 A3 28 */	lfs f1, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80132E38 0012FC38  38 63 00 FA */	addi r3, r3, 0xfa
/* 80132E3C 0012FC3C  C0 42 A3 34 */	lfs f2, lbl_803CECB4-_SDA2_BASE_(r2)
/* 80132E40 0012FC40  38 E0 00 00 */	li r7, 0
/* 80132E44 0012FC44  4B EF D7 E9 */	bl xDebugAddTweak__FPCcPfffPC14tweak_callbackPvUi
/* 80132E48 0012FC48  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132E4C 0012FC4C  7C 08 03 A6 */	mtlr r0
/* 80132E50 0012FC50  38 21 00 10 */	addi r1, r1, 0x10
/* 80132E54 0012FC54  4E 80 00 20 */	blr 

.global init__8ztalkboxFv
init__8ztalkboxFv:
/* 80132E58 0012FC58  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132E5C 0012FC5C  7C 08 02 A6 */	mflr r0
/* 80132E60 0012FC60  3C 60 80 2A */	lis r3, lbl_80298E68@ha
/* 80132E64 0012FC64  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132E68 0012FC68  38 63 8E 68 */	addi r3, r3, lbl_80298E68@l
/* 80132E6C 0012FC6C  80 8D 84 68 */	lwz r4, lbl_803CAD68-_SDA_BASE_(r13)
/* 80132E70 0012FC70  4B EF 2D 25 */	bl register_tags__8xtextboxFPCQ28xtextbox8tag_typeUl
/* 80132E74 0012FC74  88 0D 95 FE */	lbz r0, lbl_803CBEFE-_SDA_BASE_(r13)
/* 80132E78 0012FC78  7C 00 07 75 */	extsb. r0, r0
/* 80132E7C 0012FC7C  40 82 00 14 */	bne lbl_80132E90
/* 80132E80 0012FC80  38 6D 96 00 */	addi r3, r13, lbl_803CBF00-_SDA_BASE_
/* 80132E84 0012FC84  48 00 01 99 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_typeFv
/* 80132E88 0012FC88  38 00 00 01 */	li r0, 1
/* 80132E8C 0012FC8C  98 0D 95 FE */	stb r0, lbl_803CBEFE-_SDA_BASE_(r13)
lbl_80132E90:
/* 80132E90 0012FC90  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132E94 0012FC94  38 0D 96 00 */	addi r0, r13, lbl_803CBF00-_SDA_BASE_
/* 80132E98 0012FC98  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132E9C 0012FC9C  90 03 00 14 */	stw r0, 0x14(r3)
/* 80132EA0 0012FCA0  88 0D 96 08 */	lbz r0, lbl_803CBF08-_SDA_BASE_(r13)
/* 80132EA4 0012FCA4  7C 00 07 75 */	extsb. r0, r0
/* 80132EA8 0012FCA8  40 82 00 18 */	bne lbl_80132EC0
/* 80132EAC 0012FCAC  3C 60 80 32 */	lis r3, lbl_8032423C@ha
/* 80132EB0 0012FCB0  38 63 42 3C */	addi r3, r3, lbl_8032423C@l
/* 80132EB4 0012FCB4  48 00 01 29 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_typeFv
/* 80132EB8 0012FCB8  38 00 00 01 */	li r0, 1
/* 80132EBC 0012FCBC  98 0D 96 08 */	stb r0, lbl_803CBF08-_SDA_BASE_(r13)
lbl_80132EC0:
/* 80132EC0 0012FCC0  3C 80 80 32 */	lis r4, lbl_8032423C@ha
/* 80132EC4 0012FCC4  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132EC8 0012FCC8  38 04 42 3C */	addi r0, r4, lbl_8032423C@l
/* 80132ECC 0012FCCC  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132ED0 0012FCD0  90 03 00 18 */	stw r0, 0x18(r3)
/* 80132ED4 0012FCD4  88 0D 96 09 */	lbz r0, lbl_803CBF09-_SDA_BASE_(r13)
/* 80132ED8 0012FCD8  7C 00 07 75 */	extsb. r0, r0
/* 80132EDC 0012FCDC  40 82 00 18 */	bne lbl_80132EF4
/* 80132EE0 0012FCE0  3C 60 80 32 */	lis r3, lbl_80324248@ha
/* 80132EE4 0012FCE4  38 63 42 48 */	addi r3, r3, lbl_80324248@l
/* 80132EE8 0012FCE8  48 00 00 B5 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_typeFv
/* 80132EEC 0012FCEC  38 00 00 01 */	li r0, 1
/* 80132EF0 0012FCF0  98 0D 96 09 */	stb r0, lbl_803CBF09-_SDA_BASE_(r13)
lbl_80132EF4:
/* 80132EF4 0012FCF4  3C 80 80 32 */	lis r4, lbl_80324248@ha
/* 80132EF8 0012FCF8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132EFC 0012FCFC  38 04 42 48 */	addi r0, r4, lbl_80324248@l
/* 80132F00 0012FD00  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132F04 0012FD04  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80132F08 0012FD08  88 0D 96 0A */	lbz r0, lbl_803CBF0A-_SDA_BASE_(r13)
/* 80132F0C 0012FD0C  7C 00 07 75 */	extsb. r0, r0
/* 80132F10 0012FD10  40 82 00 14 */	bne lbl_80132F24
/* 80132F14 0012FD14  38 6D 96 0C */	addi r3, r13, lbl_803CBF0C-_SDA_BASE_
/* 80132F18 0012FD18  48 00 00 31 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_typeFv
/* 80132F1C 0012FD1C  38 00 00 01 */	li r0, 1
/* 80132F20 0012FD20  98 0D 96 0A */	stb r0, lbl_803CBF0A-_SDA_BASE_(r13)
lbl_80132F24:
/* 80132F24 0012FD24  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80132F28 0012FD28  38 0D 96 0C */	addi r0, r13, lbl_803CBF0C-_SDA_BASE_
/* 80132F2C 0012FD2C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80132F30 0012FD30  90 03 00 20 */	stw r0, 0x20(r3)
/* 80132F34 0012FD34  48 00 03 95 */	bl reset_all__8ztalkboxFv
/* 80132F38 0012FD38  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132F3C 0012FD3C  7C 08 03 A6 */	mtlr r0
/* 80132F40 0012FD40  38 21 00 10 */	addi r1, r1, 0x10
/* 80132F44 0012FD44  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@15stop_state_typeFv */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_typeFv:
/* 80132F48 0012FD48  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132F4C 0012FD4C  7C 08 02 A6 */	mflr r0
/* 80132F50 0012FD50  38 80 00 04 */	li r4, 4
/* 80132F54 0012FD54  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132F58 0012FD58  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132F5C 0012FD5C  7C 7F 1B 78 */	mr r31, r3
/* 80132F60 0012FD60  48 00 00 29 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_enum
/* 80132F64 0012FD64  3C 80 80 2A */	lis r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_type@ha
/* 80132F68 0012FD68  7F E3 FB 78 */	mr r3, r31
/* 80132F6C 0012FD6C  38 04 8F 6C */	addi r0, r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_type@l
/* 80132F70 0012FD70  90 1F 00 04 */	stw r0, 4(r31)
/* 80132F74 0012FD74  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132F78 0012FD78  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132F7C 0012FD7C  7C 08 03 A6 */	mtlr r0
/* 80132F80 0012FD80  38 21 00 10 */	addi r1, r1, 0x10
/* 80132F84 0012FD84  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@10state_typeFQ222@unnamed@zTalkBox_cpp@10state_enum */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_enum:
/* 80132F88 0012FD88  3C A0 80 2A */	lis r5, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_type@ha
/* 80132F8C 0012FD8C  38 05 8F 58 */	addi r0, r5, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_type@l
/* 80132F90 0012FD90  90 03 00 04 */	stw r0, 4(r3)
/* 80132F94 0012FD94  90 83 00 00 */	stw r4, 0(r3)
/* 80132F98 0012FD98  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@15wait_state_typeFv */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_typeFv:
/* 80132F9C 0012FD9C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132FA0 0012FDA0  7C 08 02 A6 */	mflr r0
/* 80132FA4 0012FDA4  38 80 00 03 */	li r4, 3
/* 80132FA8 0012FDA8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132FAC 0012FDAC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132FB0 0012FDB0  7C 7F 1B 78 */	mr r31, r3
/* 80132FB4 0012FDB4  4B FF FF D5 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_enum
/* 80132FB8 0012FDB8  3C 80 80 2A */	lis r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_type@ha
/* 80132FBC 0012FDBC  7F E3 FB 78 */	mr r3, r31
/* 80132FC0 0012FDC0  38 04 8F 44 */	addi r0, r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_type@l
/* 80132FC4 0012FDC4  90 1F 00 04 */	stw r0, 4(r31)
/* 80132FC8 0012FDC8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80132FCC 0012FDCC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80132FD0 0012FDD0  7C 08 03 A6 */	mtlr r0
/* 80132FD4 0012FDD4  38 21 00 10 */	addi r1, r1, 0x10
/* 80132FD8 0012FDD8  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@15next_state_typeFv */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_typeFv:
/* 80132FDC 0012FDDC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80132FE0 0012FDE0  7C 08 02 A6 */	mflr r0
/* 80132FE4 0012FDE4  38 80 00 02 */	li r4, 2
/* 80132FE8 0012FDE8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80132FEC 0012FDEC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80132FF0 0012FDF0  7C 7F 1B 78 */	mr r31, r3
/* 80132FF4 0012FDF4  4B FF FF 95 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_enum
/* 80132FF8 0012FDF8  3C 80 80 2A */	lis r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_type@ha
/* 80132FFC 0012FDFC  7F E3 FB 78 */	mr r3, r31
/* 80133000 0012FE00  38 04 8F 30 */	addi r0, r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_type@l
/* 80133004 0012FE04  90 1F 00 04 */	stw r0, 4(r31)
/* 80133008 0012FE08  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013300C 0012FE0C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133010 0012FE10  7C 08 03 A6 */	mtlr r0
/* 80133014 0012FE14  38 21 00 10 */	addi r1, r1, 0x10
/* 80133018 0012FE18  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@16start_state_typeFv */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_typeFv:
/* 8013301C 0012FE1C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133020 0012FE20  7C 08 02 A6 */	mflr r0
/* 80133024 0012FE24  38 80 00 01 */	li r4, 1
/* 80133028 0012FE28  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013302C 0012FE2C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133030 0012FE30  7C 7F 1B 78 */	mr r31, r3
/* 80133034 0012FE34  4B FF FF 55 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_typeFQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_enum
/* 80133038 0012FE38  3C 80 80 2A */	lis r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_type@ha
/* 8013303C 0012FE3C  7F E3 FB 78 */	mr r3, r31
/* 80133040 0012FE40  38 04 8F 1C */	addi r0, r4, __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_type@l
/* 80133044 0012FE44  90 1F 00 04 */	stw r0, 4(r31)
/* 80133048 0012FE48  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013304C 0012FE4C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133050 0012FE50  7C 08 03 A6 */	mtlr r0
/* 80133054 0012FE54  38 21 00 10 */	addi r1, r1, 0x10
/* 80133058 0012FE58  4E 80 00 20 */	blr 

load__8ztalkboxFR5xBaseR9xDynAssetUl:
/* 8013305C 0012FE5C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133060 0012FE60  7C 08 02 A6 */	mflr r0
/* 80133064 0012FE64  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133068 0012FE68  4B FF F4 E1 */	bl load__8ztalkboxFRCQ28ztalkbox10asset_type
/* 8013306C 0012FE6C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133070 0012FE70  7C 08 03 A6 */	mtlr r0
/* 80133074 0012FE74  38 21 00 10 */	addi r1, r1, 0x10
/* 80133078 0012FE78  4E 80 00 20 */	blr 

.global update_all__8ztalkboxFR6xScenef
update_all__8ztalkboxFR6xScenef:
/* 8013307C 0012FE7C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80133080 0012FE80  7C 08 02 A6 */	mflr r0
/* 80133084 0012FE84  90 01 00 24 */	stw r0, 0x24(r1)
/* 80133088 0012FE88  DB E1 00 18 */	stfd f31, 0x18(r1)
/* 8013308C 0012FE8C  FF E0 08 90 */	fmr f31, f1
/* 80133090 0012FE90  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80133094 0012FE94  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80133098 0012FE98  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8013309C 0012FE9C  93 81 00 08 */	stw r28, 8(r1)
/* 801330A0 0012FEA0  7C 7C 1B 78 */	mr r28, r3
/* 801330A4 0012FEA4  4B F6 50 D9 */	bl zGameIsPaused__Fv
/* 801330A8 0012FEA8  2C 03 00 00 */	cmpwi r3, 0
/* 801330AC 0012FEAC  40 82 01 20 */	bne lbl_801331CC
/* 801330B0 0012FEB0  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801330B4 0012FEB4  3B A3 B3 20 */	addi r29, r3, lbl_8031B320@l
/* 801330B8 0012FEB8  3F FD 00 01 */	addis r31, r29, 1
/* 801330BC 0012FEBC  48 00 00 8C */	b lbl_80133148
lbl_801330C0:
/* 801330C0 0012FEC0  38 00 00 01 */	li r0, 1
/* 801330C4 0012FEC4  FC 20 F8 90 */	fmr f1, f31
/* 801330C8 0012FEC8  98 1F 8D 7A */	stb r0, -0x7286(r31)
/* 801330CC 0012FECC  7F 84 E3 78 */	mr r4, r28
/* 801330D0 0012FED0  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 801330D4 0012FED4  81 83 00 04 */	lwz r12, 4(r3)
/* 801330D8 0012FED8  81 8C 00 10 */	lwz r12, 0x10(r12)
/* 801330DC 0012FEDC  7D 89 03 A6 */	mtctr r12
/* 801330E0 0012FEE0  4E 80 04 21 */	bctrl 
/* 801330E4 0012FEE4  80 9D 00 0C */	lwz r4, 0xc(r29)
/* 801330E8 0012FEE8  7C 7E 1B 78 */	mr r30, r3
/* 801330EC 0012FEEC  80 04 00 00 */	lwz r0, 0(r4)
/* 801330F0 0012FEF0  7C 1E 00 00 */	cmpw r30, r0
/* 801330F4 0012FEF4  41 82 00 60 */	beq lbl_80133154
/* 801330F8 0012FEF8  7C 83 23 78 */	mr r3, r4
/* 801330FC 0012FEFC  81 84 00 04 */	lwz r12, 4(r4)
/* 80133100 0012FF00  81 8C 00 0C */	lwz r12, 0xc(r12)
/* 80133104 0012FF04  7D 89 03 A6 */	mtctr r12
/* 80133108 0012FF08  4E 80 04 21 */	bctrl 
/* 8013310C 0012FF0C  2C 1E FF FF */	cmpwi r30, -1
/* 80133110 0012FF10  40 82 00 0C */	bne lbl_8013311C
/* 80133114 0012FF14  4B FF F9 B1 */	bl stop__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80133118 0012FF18  48 00 00 3C */	b lbl_80133154
lbl_8013311C:
/* 8013311C 0012FF1C  57 C0 10 3A */	slwi r0, r30, 2
/* 80133120 0012FF20  7C 7D 02 14 */	add r3, r29, r0
/* 80133124 0012FF24  80 63 00 10 */	lwz r3, 0x10(r3)
/* 80133128 0012FF28  90 7D 00 0C */	stw r3, 0xc(r29)
/* 8013312C 0012FF2C  81 83 00 04 */	lwz r12, 4(r3)
/* 80133130 0012FF30  81 8C 00 08 */	lwz r12, 8(r12)
/* 80133134 0012FF34  7D 89 03 A6 */	mtctr r12
/* 80133138 0012FF38  4E 80 04 21 */	bctrl 
/* 8013313C 0012FF3C  38 00 00 00 */	li r0, 0
/* 80133140 0012FF40  98 1F 8D 7A */	stb r0, -0x7286(r31)
/* 80133144 0012FF44  4B FF D6 BD */	bl flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_80133148:
/* 80133148 0012FF48  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8013314C 0012FF4C  28 00 00 00 */	cmplwi r0, 0
/* 80133150 0012FF50  40 82 FF 70 */	bne lbl_801330C0
lbl_80133154:
/* 80133154 0012FF54  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 80133158 0012FF58  28 00 00 00 */	cmplwi r0, 0
/* 8013315C 0012FF5C  41 82 00 64 */	beq lbl_801331C0
/* 80133160 0012FF60  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133164 0012FF64  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133168 0012FF68  80 63 00 08 */	lwz r3, 8(r3)
/* 8013316C 0012FF6C  28 03 00 00 */	cmplwi r3, 0
/* 80133170 0012FF70  41 82 00 50 */	beq lbl_801331C0
/* 80133174 0012FF74  80 63 00 14 */	lwz r3, 0x14(r3)
/* 80133178 0012FF78  88 83 00 1F */	lbz r4, 0x1f(r3)
/* 8013317C 0012FF7C  2C 04 00 02 */	cmpwi r4, 2
/* 80133180 0012FF80  40 82 00 18 */	bne lbl_80133198
/* 80133184 0012FF84  3C 60 80 3C */	lis r3, globals@ha
/* 80133188 0012FF88  38 63 05 58 */	addi r3, r3, globals@l
/* 8013318C 0012FF8C  80 03 17 88 */	lwz r0, 0x1788(r3)
/* 80133190 0012FF90  28 00 00 00 */	cmplwi r0, 0
/* 80133194 0012FF94  41 82 00 20 */	beq lbl_801331B4
lbl_80133198:
/* 80133198 0012FF98  2C 04 00 01 */	cmpwi r4, 1
/* 8013319C 0012FF9C  40 82 00 24 */	bne lbl_801331C0
/* 801331A0 0012FFA0  3C 60 80 3C */	lis r3, globals@ha
/* 801331A4 0012FFA4  38 63 05 58 */	addi r3, r3, globals@l
/* 801331A8 0012FFA8  80 03 17 88 */	lwz r0, 0x1788(r3)
/* 801331AC 0012FFAC  28 00 00 00 */	cmplwi r0, 0
/* 801331B0 0012FFB0  41 82 00 10 */	beq lbl_801331C0
lbl_801331B4:
/* 801331B4 0012FFB4  48 00 00 3D */	bl pad_pressed__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801331B8 0012FFB8  80 63 00 00 */	lwz r3, 0(r3)
/* 801331BC 0012FFBC  4B FF D5 3D */	bl trigger_pads__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_801331C0:
/* 801331C0 0012FFC0  38 00 00 00 */	li r0, 0
/* 801331C4 0012FFC4  98 1F 8D 7A */	stb r0, -0x7286(r31)
/* 801331C8 0012FFC8  4B FF D6 39 */	bl flush_triggered__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
lbl_801331CC:
/* 801331CC 0012FFCC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801331D0 0012FFD0  CB E1 00 18 */	lfd f31, 0x18(r1)
/* 801331D4 0012FFD4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 801331D8 0012FFD8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 801331DC 0012FFDC  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 801331E0 0012FFE0  83 81 00 08 */	lwz r28, 8(r1)
/* 801331E4 0012FFE4  7C 08 03 A6 */	mtlr r0
/* 801331E8 0012FFE8  38 21 00 20 */	addi r1, r1, 0x20
/* 801331EC 0012FFEC  4E 80 00 20 */	blr 

/* pad_pressed__22@unnamed@zTalkBox_cpp@Fv */
pad_pressed__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv:
/* 801331F0 0012FFF0  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801331F4 0012FFF4  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801331F8 0012FFF8  80 03 00 04 */	lwz r0, 4(r3)
/* 801331FC 0012FFFC  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 80133200 00130000  41 82 00 18 */	beq lbl_80133218
/* 80133204 00130004  3C 60 80 3C */	lis r3, globals@ha
/* 80133208 00130008  38 63 05 58 */	addi r3, r3, globals@l
/* 8013320C 0013000C  80 63 03 1C */	lwz r3, 0x31c(r3)
/* 80133210 00130010  38 63 00 30 */	addi r3, r3, 0x30
/* 80133214 00130014  4E 80 00 20 */	blr 
lbl_80133218:
/* 80133218 00130018  38 00 00 00 */	li r0, 0
/* 8013321C 0013001C  38 6D 95 F8 */	addi r3, r13, lbl_803CBEF8-_SDA_BASE_
/* 80133220 00130020  90 0D 95 F8 */	stw r0, lbl_803CBEF8-_SDA_BASE_(r13)
/* 80133224 00130024  4E 80 00 20 */	blr 

.global render_all__8ztalkboxFv
render_all__8ztalkboxFv:
/* 80133228 00130028  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013322C 0013002C  7C 08 02 A6 */	mflr r0
/* 80133230 00130030  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133234 00130034  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133238 00130038  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 8013323C 0013003C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133240 00130040  80 03 00 04 */	lwz r0, 4(r3)
/* 80133244 00130044  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80133248 00130048  41 82 00 6C */	beq lbl_801332B4
/* 8013324C 0013004C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 80133250 00130050  28 00 00 00 */	cmplwi r0, 0
/* 80133254 00130054  41 82 00 60 */	beq lbl_801332B4
/* 80133258 00130058  80 63 00 08 */	lwz r3, 8(r3)
/* 8013325C 0013005C  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80133260 00130060  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80133264 00130064  41 82 00 50 */	beq lbl_801332B4
/* 80133268 00130068  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 8013326C 0013006C  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80133270 00130070  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 80133274 00130074  41 82 00 0C */	beq lbl_80133280
/* 80133278 00130078  7F E3 FB 78 */	mr r3, r31
/* 8013327C 0013007C  48 00 13 71 */	bl deactivate__8ztextboxFv
lbl_80133280:
/* 80133280 00130080  88 1F 00 10 */	lbz r0, 0x10(r31)
/* 80133284 00130084  54 00 DF FF */	rlwinm. r0, r0, 0x1b, 0x1f, 0x1f
/* 80133288 00130088  41 82 00 0C */	beq lbl_80133294
/* 8013328C 0013008C  7F E3 FB 78 */	mr r3, r31
/* 80133290 00130090  48 00 12 CD */	bl render_backdrop__8ztextboxFv
lbl_80133294:
/* 80133294 00130094  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80133298 00130098  38 7F 00 18 */	addi r3, r31, 0x18
/* 8013329C 0013009C  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 801332A0 001300A0  3C C4 00 01 */	addis r6, r4, 1
/* 801332A4 001300A4  80 A6 8D 1C */	lwz r5, -0x72e4(r6)
/* 801332A8 001300A8  38 84 00 24 */	addi r4, r4, 0x24
/* 801332AC 001300AC  80 C6 8D 20 */	lwz r6, -0x72e0(r6)
/* 801332B0 001300B0  4B EE F6 01 */	bl render__8xtextboxCFRQ28xtextbox6layoutii
lbl_801332B4:
/* 801332B4 001300B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801332B8 001300B8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801332BC 001300BC  7C 08 03 A6 */	mtlr r0
/* 801332C0 001300C0  38 21 00 10 */	addi r1, r1, 0x10
/* 801332C4 001300C4  4E 80 00 20 */	blr 

.global reset_all__8ztalkboxFv
reset_all__8ztalkboxFv:
/* 801332C8 001300C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801332CC 001300CC  7C 08 02 A6 */	mflr r0
/* 801332D0 001300D0  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801332D4 001300D4  38 A0 00 00 */	li r5, 0
/* 801332D8 001300D8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801332DC 001300DC  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 801332E0 001300E0  38 00 FF FF */	li r0, -1
/* 801332E4 001300E4  90 A4 00 00 */	stw r5, 0(r4)
/* 801332E8 001300E8  3C 64 00 01 */	addis r3, r4, 1
/* 801332EC 001300EC  90 04 00 04 */	stw r0, 4(r4)
/* 801332F0 001300F0  90 A4 00 08 */	stw r5, 8(r4)
/* 801332F4 001300F4  90 A4 00 0C */	stw r5, 0xc(r4)
/* 801332F8 001300F8  90 A3 8D 7C */	stw r5, -0x7284(r3)
/* 801332FC 001300FC  98 A3 8D 7A */	stb r5, -0x7286(r3)
/* 80133300 00130100  90 A3 8E 94 */	stw r5, -0x716c(r3)
/* 80133304 00130104  38 63 8D 80 */	addi r3, r3, -29312
/* 80133308 00130108  48 00 09 1D */	bl reset__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 8013330C 0013010C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133310 00130110  38 00 00 00 */	li r0, 0
/* 80133314 00130114  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133318 00130118  3C 83 00 01 */	addis r4, r3, 1
/* 8013331C 0013011C  98 04 8D 55 */	stb r0, -0x72ab(r4)
/* 80133320 00130120  38 63 00 24 */	addi r3, r3, 0x24
/* 80133324 00130124  98 04 8D 54 */	stb r0, -0x72ac(r4)
/* 80133328 00130128  90 04 8D 58 */	stw r0, -0x72a8(r4)
/* 8013332C 0013012C  98 04 8D 57 */	stb r0, -0x72a9(r4)
/* 80133330 00130130  98 04 8D 56 */	stb r0, -0x72aa(r4)
/* 80133334 00130134  4B EE FA 59 */	bl clear__Q28xtextbox6layoutFv
/* 80133338 00130138  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013333C 0013013C  7C 08 03 A6 */	mtlr r0
/* 80133340 00130140  38 21 00 10 */	addi r1, r1, 0x10
/* 80133344 00130144  4E 80 00 20 */	blr 

.global get_active__8ztalkboxFv
get_active__8ztalkboxFv:
/* 80133348 00130148  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013334C 0013014C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133350 00130150  80 63 00 08 */	lwz r3, 8(r3)
/* 80133354 00130154  4E 80 00 20 */	blr 

.global permit__8ztalkboxFUiUi
permit__8ztalkboxFUiUi:
/* 80133358 00130158  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 8013335C 0013015C  38 A5 B3 20 */	addi r5, r5, lbl_8031B320@l
/* 80133360 00130160  80 05 00 04 */	lwz r0, 4(r5)
/* 80133364 00130164  7C 00 20 78 */	andc r0, r0, r4
/* 80133368 00130168  90 05 00 04 */	stw r0, 4(r5)
/* 8013336C 0013016C  7C 00 1B 78 */	or r0, r0, r3
/* 80133370 00130170  90 05 00 04 */	stw r0, 4(r5)
/* 80133374 00130174  4E 80 00 20 */	blr 

start__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_typeFv:
/* 80133378 00130178  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013337C 0013017C  7C 08 02 A6 */	mflr r0
/* 80133380 00130180  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133384 00130184  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133388 00130188  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 8013338C 0013018C  38 00 00 00 */	li r0, 0
/* 80133390 00130190  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133394 00130194  3C 83 00 01 */	addis r4, r3, 1
/* 80133398 00130198  3B E4 8D 28 */	addi r31, r4, -29400
/* 8013339C 0013019C  90 04 8D 24 */	stw r0, -0x72dc(r4)
/* 801333A0 001301A0  7F E3 FB 78 */	mr r3, r31
/* 801333A4 001301A4  90 04 8D 20 */	stw r0, -0x72e0(r4)
/* 801333A8 001301A8  90 04 8D 1C */	stw r0, -0x72e4(r4)
/* 801333AC 001301AC  4B FF D8 E5 */	bl reset_type__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFv
/* 801333B0 001301B0  88 1F 00 00 */	lbz r0, 0(r31)
/* 801333B4 001301B4  38 60 00 01 */	li r3, 1
/* 801333B8 001301B8  50 60 3E 30 */	rlwimi r0, r3, 7, 0x18, 0x18
/* 801333BC 001301BC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801333C0 001301C0  98 1F 00 00 */	stb r0, 0(r31)
/* 801333C4 001301C4  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801333C8 001301C8  3C 63 00 01 */	addis r3, r3, 1
/* 801333CC 001301CC  38 00 00 00 */	li r0, 0
/* 801333D0 001301D0  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 801333D4 001301D4  D0 03 8D 2C */	stfs f0, -0x72d4(r3)
/* 801333D8 001301D8  C0 02 A3 3C */	lfs f0, lbl_803CECBC-_SDA2_BASE_(r2)
/* 801333DC 001301DC  D0 03 8D 50 */	stfs f0, -0x72b0(r3)
/* 801333E0 001301E0  D0 03 8D 4C */	stfs f0, -0x72b4(r3)
/* 801333E4 001301E4  98 03 8D 55 */	stb r0, -0x72ab(r3)
/* 801333E8 001301E8  98 03 8D 54 */	stb r0, -0x72ac(r3)
/* 801333EC 001301EC  4B FF EC 29 */	bl refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801333F0 001301F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801333F4 001301F4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801333F8 001301F8  7C 08 03 A6 */	mtlr r0
/* 801333FC 001301FC  38 21 00 10 */	addi r1, r1, 0x10
/* 80133400 00130200  4E 80 00 20 */	blr 

stop__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_typeFv:
/* 80133404 00130204  4E 80 00 20 */	blr 

update__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_typeFR6xScenef:
/* 80133408 00130208  38 60 00 02 */	li r3, 2
/* 8013340C 0013020C  4E 80 00 20 */	blr 

start__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_typeFv:
/* 80133410 00130210  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80133414 00130214  7C 08 02 A6 */	mflr r0
/* 80133418 00130218  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013341C 0013021C  90 01 00 34 */	stw r0, 0x34(r1)
/* 80133420 00130220  38 A3 B3 20 */	addi r5, r3, lbl_8031B320@l
/* 80133424 00130224  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 80133428 00130228  3F E5 00 01 */	addis r31, r5, 1
/* 8013342C 0013022C  80 7F 8D 20 */	lwz r3, -0x72e0(r31)
/* 80133430 00130230  80 1F 8D 24 */	lwz r0, -0x72dc(r31)
/* 80133434 00130234  7C 03 00 00 */	cmpw r3, r0
/* 80133438 00130238  40 82 00 A4 */	bne lbl_801334DC
/* 8013343C 0013023C  80 85 00 08 */	lwz r4, 8(r5)
/* 80133440 00130240  3B A5 00 24 */	addi r29, r5, 0x24
/* 80133444 00130244  7F A3 EB 78 */	mr r3, r29
/* 80133448 00130248  80 84 00 18 */	lwz r4, 0x18(r4)
/* 8013344C 0013024C  3B 64 00 18 */	addi r27, r4, 0x18
/* 80133450 00130250  4B EF 31 65 */	bl jots_size__Q28xtextbox6layoutCFv
/* 80133454 00130254  7C 7E 1B 78 */	mr r30, r3
/* 80133458 00130258  7F A3 EB 78 */	mr r3, r29
/* 8013345C 0013025C  48 00 09 D5 */	bl jots__Q28xtextbox6layoutCFv
/* 80133460 00130260  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133464 00130264  80 1F 8D 20 */	lwz r0, -0x72e0(r31)
/* 80133468 00130268  38 83 B3 20 */	addi r4, r3, lbl_8031B320@l
/* 8013346C 0013026C  7F 63 DB 78 */	mr r3, r27
/* 80133470 00130270  3F 84 00 01 */	addis r28, r4, 1
/* 80133474 00130274  7F A5 EB 78 */	mr r5, r29
/* 80133478 00130278  90 1C 8D 1C */	stw r0, -0x72e4(r28)
/* 8013347C 0013027C  38 81 00 08 */	addi r4, r1, 8
/* 80133480 00130280  38 E0 FF FF */	li r7, -1
/* 80133484 00130284  C0 3B 00 30 */	lfs f1, 0x30(r27)
/* 80133488 00130288  80 DC 8D 1C */	lwz r6, -0x72e4(r28)
/* 8013348C 0013028C  4B EE F4 51 */	bl yextent__8xtextboxCFfRiRCQ28xtextbox6layoutii
/* 80133490 00130290  80 01 00 08 */	lwz r0, 8(r1)
/* 80133494 00130294  2C 00 00 00 */	cmpwi r0, 0
/* 80133498 00130298  40 82 00 18 */	bne lbl_801334B0
/* 8013349C 0013029C  80 1C 8D 1C */	lwz r0, -0x72e4(r28)
/* 801334A0 001302A0  7C 1E 00 00 */	cmpw r30, r0
/* 801334A4 001302A4  40 81 00 0C */	ble lbl_801334B0
/* 801334A8 001302A8  38 00 00 01 */	li r0, 1
/* 801334AC 001302AC  90 01 00 08 */	stw r0, 8(r1)
lbl_801334B0:
/* 801334B0 001302B0  80 7C 8D 1C */	lwz r3, -0x72e4(r28)
/* 801334B4 001302B4  80 01 00 08 */	lwz r0, 8(r1)
/* 801334B8 001302B8  7C 03 02 14 */	add r0, r3, r0
/* 801334BC 001302BC  90 1F 8D 24 */	stw r0, -0x72dc(r31)
/* 801334C0 001302C0  48 00 00 1C */	b lbl_801334DC
lbl_801334C4:
/* 801334C4 001302C4  80 7F 8D 20 */	lwz r3, -0x72e0(r31)
/* 801334C8 001302C8  38 03 00 01 */	addi r0, r3, 1
/* 801334CC 001302CC  90 1F 8D 20 */	stw r0, -0x72e0(r31)
/* 801334D0 001302D0  48 00 00 C1 */	bl trigger_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fi
/* 801334D4 001302D4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801334D8 001302D8  41 82 00 14 */	beq lbl_801334EC
lbl_801334DC:
/* 801334DC 001302DC  80 7F 8D 20 */	lwz r3, -0x72e0(r31)
/* 801334E0 001302E0  80 1F 8D 24 */	lwz r0, -0x72dc(r31)
/* 801334E4 001302E4  7C 03 00 00 */	cmpw r3, r0
/* 801334E8 001302E8  41 80 FF DC */	blt lbl_801334C4
lbl_801334EC:
/* 801334EC 001302EC  80 7F 8D 20 */	lwz r3, -0x72e0(r31)
/* 801334F0 001302F0  80 1F 8D 24 */	lwz r0, -0x72dc(r31)
/* 801334F4 001302F4  7C 03 00 00 */	cmpw r3, r0
/* 801334F8 001302F8  40 82 00 84 */	bne lbl_8013357C
/* 801334FC 001302FC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133500 00130300  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133504 00130304  38 63 00 24 */	addi r3, r3, 0x24
/* 80133508 00130308  48 00 09 29 */	bl jots__Q28xtextbox6layoutCFv
/* 8013350C 0013030C  80 BF 8D 20 */	lwz r5, -0x72e0(r31)
/* 80133510 00130310  1C 85 00 3C */	mulli r4, r5, 0x3c
/* 80133514 00130314  38 C4 FF C4 */	addi r6, r4, -60
/* 80133518 00130318  7C C3 32 14 */	add r6, r3, r6
/* 8013351C 0013031C  88 06 00 09 */	lbz r0, 9(r6)
/* 80133520 00130320  54 00 DF FF */	rlwinm. r0, r0, 0x1b, 0x1f, 0x1f
/* 80133524 00130324  41 82 00 24 */	beq lbl_80133548
/* 80133528 00130328  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013352C 0013032C  38 85 FF FF */	addi r4, r5, -1
/* 80133530 00130330  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133534 00130334  3C 63 00 01 */	addis r3, r3, 1
/* 80133538 00130338  80 03 8D 1C */	lwz r0, -0x72e4(r3)
/* 8013353C 0013033C  7C 04 00 00 */	cmpw r4, r0
/* 80133540 00130340  40 81 00 08 */	ble lbl_80133548
/* 80133544 00130344  38 C6 FF C4 */	addi r6, r6, -60
lbl_80133548:
/* 80133548 00130348  7C C3 33 78 */	mr r3, r6
/* 8013354C 0013034C  4B FF E9 05 */	bl is_wait_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot
/* 80133550 00130350  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80133554 00130354  40 82 00 28 */	bne lbl_8013357C
/* 80133558 00130358  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013355C 0013035C  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133560 00130360  3C 63 00 01 */	addis r3, r3, 1
/* 80133564 00130364  7C 64 1B 78 */	mr r4, r3
/* 80133568 00130368  38 84 8D 38 */	addi r4, r4, -29384
/* 8013356C 0013036C  38 63 8D 28 */	addi r3, r3, -29400
/* 80133570 00130370  4B FF D8 0D */	bl __as__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFRCQ222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_context
/* 80133574 00130374  48 00 00 08 */	b lbl_8013357C
/* 80133578 00130378  4B FF FF 64 */	b lbl_801334DC
lbl_8013357C:
/* 8013357C 0013037C  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 80133580 00130380  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80133584 00130384  7C 08 03 A6 */	mtlr r0
/* 80133588 00130388  38 21 00 30 */	addi r1, r1, 0x30
/* 8013358C 0013038C  4E 80 00 20 */	blr 

/* trigger_jot__22@unnamed@zTalkBox_cpp@Fi */
trigger_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fi:
/* 80133590 00130390  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133594 00130394  7C 08 02 A6 */	mflr r0
/* 80133598 00130398  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 8013359C 0013039C  90 01 00 14 */	stw r0, 0x14(r1)
/* 801335A0 001303A0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801335A4 001303A4  7C 7F 1B 78 */	mr r31, r3
/* 801335A8 001303A8  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 801335AC 001303AC  38 63 00 24 */	addi r3, r3, 0x24
/* 801335B0 001303B0  48 00 08 81 */	bl jots__Q28xtextbox6layoutCFv
/* 801335B4 001303B4  1C 1F 00 3C */	mulli r0, r31, 0x3c
/* 801335B8 001303B8  7C 63 02 14 */	add r3, r3, r0
/* 801335BC 001303BC  48 00 00 19 */	bl trigger_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot
/* 801335C0 001303C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801335C4 001303C4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801335C8 001303C8  7C 08 03 A6 */	mtlr r0
/* 801335CC 001303CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801335D0 001303D0  4E 80 00 20 */	blr 

/* trigger_jot__22@unnamed@zTalkBox_cpp@FRCQ28xtextbox3jot */
trigger_jot__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FRCQ28xtextbox3jot:
/* 801335D4 001303D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801335D8 001303D8  7C 08 02 A6 */	mflr r0
/* 801335DC 001303DC  80 83 00 38 */	lwz r4, 0x38(r3)
/* 801335E0 001303E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801335E4 001303E4  28 04 00 00 */	cmplwi r4, 0
/* 801335E8 001303E8  40 82 00 0C */	bne lbl_801335F4
/* 801335EC 001303EC  38 60 00 01 */	li r3, 1
/* 801335F0 001303F0  48 00 00 20 */	b lbl_80133610
lbl_801335F4:
/* 801335F4 001303F4  81 84 00 10 */	lwz r12, 0x10(r4)
/* 801335F8 001303F8  28 0C 00 00 */	cmplwi r12, 0
/* 801335FC 001303FC  41 82 00 10 */	beq lbl_8013360C
/* 80133600 00130400  7D 89 03 A6 */	mtctr r12
/* 80133604 00130404  4E 80 04 21 */	bctrl 
/* 80133608 00130408  48 00 00 08 */	b lbl_80133610
lbl_8013360C:
/* 8013360C 0013040C  38 60 00 01 */	li r3, 1
lbl_80133610:
/* 80133610 00130410  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133614 00130414  7C 08 03 A6 */	mtlr r0
/* 80133618 00130418  38 21 00 10 */	addi r1, r1, 0x10
/* 8013361C 0013041C  4E 80 00 20 */	blr 

stop__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_typeFv:
/* 80133620 00130420  4E 80 00 20 */	blr 

update__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_typeFR6xScenef:
/* 80133624 00130424  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80133628 00130428  38 60 00 03 */	li r3, 3
/* 8013362C 0013042C  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 80133630 00130430  3C A4 00 01 */	addis r5, r4, 1
/* 80133634 00130434  80 85 8D 1C */	lwz r4, -0x72e4(r5)
/* 80133638 00130438  80 05 8D 24 */	lwz r0, -0x72dc(r5)
/* 8013363C 0013043C  7C 04 00 00 */	cmpw r4, r0
/* 80133640 00130440  4C 82 00 20 */	bnelr 
/* 80133644 00130444  38 60 00 04 */	li r3, 4
/* 80133648 00130448  4E 80 00 20 */	blr 

start__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_typeFv:
/* 8013364C 0013044C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133650 00130450  7C 08 02 A6 */	mflr r0
/* 80133654 00130454  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133658 00130458  38 00 00 00 */	li r0, 0
/* 8013365C 0013045C  98 03 00 08 */	stb r0, 8(r3)
/* 80133660 00130460  4B FF E9 B5 */	bl refresh_prompts__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 80133664 00130464  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133668 00130468  7C 08 03 A6 */	mtlr r0
/* 8013366C 0013046C  38 21 00 10 */	addi r1, r1, 0x10
/* 80133670 00130470  4E 80 00 20 */	blr 

stop__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_typeFv:
/* 80133674 00130474  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133678 00130478  7C 08 02 A6 */	mflr r0
/* 8013367C 0013047C  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 80133680 00130480  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133684 00130484  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133688 00130488  93 C1 00 08 */	stw r30, 8(r1)
/* 8013368C 0013048C  7C 7E 1B 78 */	mr r30, r3
/* 80133690 00130490  38 64 B3 20 */	addi r3, r4, lbl_8031B320@l
/* 80133694 00130494  3F E3 00 01 */	addis r31, r3, 1
/* 80133698 00130498  8C 1F 8D 28 */	lbzu r0, -0x72d8(r31)
/* 8013369C 0013049C  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 801336A0 001304A0  41 82 00 10 */	beq lbl_801336B0
/* 801336A4 001304A4  88 1F 00 00 */	lbz r0, 0(r31)
/* 801336A8 001304A8  54 00 D7 FF */	rlwinm. r0, r0, 0x1a, 0x1f, 0x1f
/* 801336AC 001304AC  41 82 00 20 */	beq lbl_801336CC
lbl_801336B0:
/* 801336B0 001304B0  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801336B4 001304B4  C0 02 A3 40 */	lfs f0, lbl_803CECC0-_SDA2_BASE_(r2)
/* 801336B8 001304B8  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801336BC 001304BC  38 00 00 00 */	li r0, 0
/* 801336C0 001304C0  3C 63 00 01 */	addis r3, r3, 1
/* 801336C4 001304C4  D0 03 8D 4C */	stfs f0, -0x72b4(r3)
/* 801336C8 001304C8  98 03 8D 54 */	stb r0, -0x72ac(r3)
lbl_801336CC:
/* 801336CC 001304CC  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801336D0 001304D0  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 801336D4 001304D4  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801336D8 001304D8  38 A0 00 01 */	li r5, 1
/* 801336DC 001304DC  3C 63 00 01 */	addis r3, r3, 1
/* 801336E0 001304E0  D0 03 8D 50 */	stfs f0, -0x72b0(r3)
/* 801336E4 001304E4  98 A3 8D 55 */	stb r5, -0x72ab(r3)
/* 801336E8 001304E8  88 1F 00 00 */	lbz r0, 0(r31)
/* 801336EC 001304EC  54 00 D7 FF */	rlwinm. r0, r0, 0x1a, 0x1f, 0x1f
/* 801336F0 001304F0  41 82 00 58 */	beq lbl_80133748
/* 801336F4 001304F4  80 03 8D 34 */	lwz r0, -0x72cc(r3)
/* 801336F8 001304F8  2C 00 00 01 */	cmpwi r0, 1
/* 801336FC 001304FC  40 82 00 4C */	bne lbl_80133748
/* 80133700 00130500  80 63 8D 7C */	lwz r3, -0x7284(r3)
/* 80133704 00130504  28 03 00 00 */	cmplwi r3, 0
/* 80133708 00130508  41 82 00 28 */	beq lbl_80133730
/* 8013370C 0013050C  88 1E 00 08 */	lbz r0, 8(r30)
/* 80133710 00130510  38 80 00 02 */	li r4, 2
/* 80133714 00130514  28 00 00 00 */	cmplwi r0, 0
/* 80133718 00130518  41 82 00 08 */	beq lbl_80133720
/* 8013371C 0013051C  7C A4 2B 78 */	mr r4, r5
lbl_80133720:
/* 80133720 00130520  81 83 00 00 */	lwz r12, 0(r3)
/* 80133724 00130524  81 8C 00 14 */	lwz r12, 0x14(r12)
/* 80133728 00130528  7D 89 03 A6 */	mtctr r12
/* 8013372C 0013052C  4E 80 04 21 */	bctrl 
lbl_80133730:
/* 80133730 00130530  88 1E 00 08 */	lbz r0, 8(r30)
/* 80133734 00130534  38 60 01 C6 */	li r3, 0x1c6
/* 80133738 00130538  28 00 00 00 */	cmplwi r0, 0
/* 8013373C 0013053C  41 82 00 08 */	beq lbl_80133744
/* 80133740 00130540  38 60 01 C5 */	li r3, 0x1c5
lbl_80133744:
/* 80133744 00130544  4B FF CF 31 */	bl trigger__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_FUi
lbl_80133748:
/* 80133748 00130548  7F E3 FB 78 */	mr r3, r31
/* 8013374C 0013054C  4B FF D5 45 */	bl reset_type__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12wait_contextFv
/* 80133750 00130550  88 1F 00 00 */	lbz r0, 0(r31)
/* 80133754 00130554  38 60 00 01 */	li r3, 1
/* 80133758 00130558  50 60 3E 30 */	rlwimi r0, r3, 7, 0x18, 0x18
/* 8013375C 0013055C  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133760 00130560  98 1F 00 00 */	stb r0, 0(r31)
/* 80133764 00130564  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133768 00130568  3C 63 00 01 */	addis r3, r3, 1
/* 8013376C 0013056C  38 00 00 00 */	li r0, 0
/* 80133770 00130570  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80133774 00130574  D0 03 8D 2C */	stfs f0, -0x72d4(r3)
/* 80133778 00130578  98 03 8D 2A */	stb r0, -0x72d6(r3)
/* 8013377C 0013057C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80133780 00130580  83 C1 00 08 */	lwz r30, 8(r1)
/* 80133784 00130584  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133788 00130588  7C 08 03 A6 */	mtlr r0
/* 8013378C 0013058C  38 21 00 10 */	addi r1, r1, 0x10
/* 80133790 00130590  4E 80 00 20 */	blr 

update__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_typeFR6xScenef:
/* 80133794 00130594  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80133798 00130598  7C 08 02 A6 */	mflr r0
/* 8013379C 0013059C  90 01 00 24 */	stw r0, 0x24(r1)
/* 801337A0 001305A0  DB E1 00 10 */	stfd f31, 0x10(r1)
/* 801337A4 001305A4  F3 E1 00 18 */	psq_st f31, 24(r1), 0, qr0
/* 801337A8 001305A8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801337AC 001305AC  93 C1 00 08 */	stw r30, 8(r1)
/* 801337B0 001305B0  7C 7E 1B 78 */	mr r30, r3
/* 801337B4 001305B4  FF E0 08 90 */	fmr f31, f1
/* 801337B8 001305B8  4B FF E9 BD */	bl update_prompt_status__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff
/* 801337BC 001305BC  FC 20 F8 90 */	fmr f1, f31
/* 801337C0 001305C0  4B FF EA 51 */	bl update_quit_status__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Ff
/* 801337C4 001305C4  4B FF FA 2D */	bl pad_pressed__22_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_Fv
/* 801337C8 001305C8  3C 80 80 32 */	lis r4, lbl_8031B320@ha
/* 801337CC 001305CC  38 84 B3 20 */	addi r4, r4, lbl_8031B320@l
/* 801337D0 001305D0  3C 84 00 01 */	addis r4, r4, 1
/* 801337D4 001305D4  88 04 8D 79 */	lbz r0, -0x7287(r4)
/* 801337D8 001305D8  28 00 00 00 */	cmplwi r0, 0
/* 801337DC 001305DC  41 82 00 2C */	beq lbl_80133808
/* 801337E0 001305E0  88 04 8D 78 */	lbz r0, -0x7288(r4)
/* 801337E4 001305E4  28 00 00 00 */	cmplwi r0, 0
/* 801337E8 001305E8  41 82 00 18 */	beq lbl_80133800
/* 801337EC 001305EC  88 04 8D 2A */	lbz r0, -0x72d6(r4)
/* 801337F0 001305F0  28 00 00 00 */	cmplwi r0, 0
/* 801337F4 001305F4  40 82 00 0C */	bne lbl_80133800
/* 801337F8 001305F8  38 60 00 02 */	li r3, 2
/* 801337FC 001305FC  48 00 01 A4 */	b lbl_801339A0
lbl_80133800:
/* 80133800 00130600  38 00 00 00 */	li r0, 0
/* 80133804 00130604  98 04 8D 79 */	stb r0, -0x7287(r4)
lbl_80133808:
/* 80133808 00130608  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 8013380C 0013060C  38 A5 B3 20 */	addi r5, r5, lbl_8031B320@l
/* 80133810 00130610  3F E5 00 01 */	addis r31, r5, 1
/* 80133814 00130614  88 1F 8D 28 */	lbz r0, -0x72d8(r31)
/* 80133818 00130618  54 00 CF FF */	rlwinm. r0, r0, 0x19, 0x1f, 0x1f
/* 8013381C 0013061C  41 82 00 2C */	beq lbl_80133848
/* 80133820 00130620  C0 1F 8D 2C */	lfs f0, -0x72d4(r31)
/* 80133824 00130624  EC 00 F8 28 */	fsubs f0, f0, f31
/* 80133828 00130628  D0 1F 8D 2C */	stfs f0, -0x72d4(r31)
/* 8013382C 0013062C  C0 3F 8D 2C */	lfs f1, -0x72d4(r31)
/* 80133830 00130630  C0 02 A3 28 */	lfs f0, lbl_803CECA8-_SDA2_BASE_(r2)
/* 80133834 00130634  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80133838 00130638  4C 40 13 82 */	cror 2, 0, 2
/* 8013383C 0013063C  40 82 00 0C */	bne lbl_80133848
/* 80133840 00130640  38 60 00 02 */	li r3, 2
/* 80133844 00130644  48 00 01 5C */	b lbl_801339A0
lbl_80133848:
/* 80133848 00130648  88 1F 8D 28 */	lbz r0, -0x72d8(r31)
/* 8013384C 0013064C  54 00 D7 FF */	rlwinm. r0, r0, 0x1a, 0x1f, 0x1f
/* 80133850 00130650  41 82 00 88 */	beq lbl_801338D8
/* 80133854 00130654  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 80133858 00130658  38 A5 B3 20 */	addi r5, r5, lbl_8031B320@l
/* 8013385C 0013065C  3C A5 00 01 */	addis r5, r5, 1
/* 80133860 00130660  88 05 8D 54 */	lbz r0, -0x72ac(r5)
/* 80133864 00130664  28 00 00 00 */	cmplwi r0, 0
/* 80133868 00130668  41 82 00 70 */	beq lbl_801338D8
/* 8013386C 0013066C  80 05 8D 34 */	lwz r0, -0x72cc(r5)
/* 80133870 00130670  2C 00 00 01 */	cmpwi r0, 1
/* 80133874 00130674  41 82 00 0C */	beq lbl_80133880
/* 80133878 00130678  40 80 00 44 */	bge lbl_801338BC
/* 8013387C 0013067C  48 00 00 40 */	b lbl_801338BC
lbl_80133880:
/* 80133880 00130680  80 A3 00 00 */	lwz r5, 0(r3)
/* 80133884 00130684  54 A0 03 DF */	rlwinm. r0, r5, 0, 0xf, 0xf
/* 80133888 00130688  41 82 00 1C */	beq lbl_801338A4
/* 8013388C 0013068C  54 A4 04 1C */	rlwinm r4, r5, 0, 0x10, 0xe
/* 80133890 00130690  38 00 00 01 */	li r0, 1
/* 80133894 00130694  90 83 00 00 */	stw r4, 0(r3)
/* 80133898 00130698  38 60 00 02 */	li r3, 2
/* 8013389C 0013069C  98 1E 00 08 */	stb r0, 8(r30)
/* 801338A0 001306A0  48 00 01 00 */	b lbl_801339A0
lbl_801338A4:
/* 801338A4 001306A4  54 A0 03 5B */	rlwinm. r0, r5, 0, 0xd, 0xd
/* 801338A8 001306A8  41 82 00 30 */	beq lbl_801338D8
/* 801338AC 001306AC  54 A0 03 98 */	rlwinm r0, r5, 0, 0xe, 0xc
/* 801338B0 001306B0  90 03 00 00 */	stw r0, 0(r3)
/* 801338B4 001306B4  38 60 00 02 */	li r3, 2
/* 801338B8 001306B8  48 00 00 E8 */	b lbl_801339A0
lbl_801338BC:
/* 801338BC 001306BC  80 A3 00 00 */	lwz r5, 0(r3)
/* 801338C0 001306C0  54 A0 03 DF */	rlwinm. r0, r5, 0, 0xf, 0xf
/* 801338C4 001306C4  41 82 00 14 */	beq lbl_801338D8
/* 801338C8 001306C8  54 A0 04 1C */	rlwinm r0, r5, 0, 0x10, 0xe
/* 801338CC 001306CC  90 03 00 00 */	stw r0, 0(r3)
/* 801338D0 001306D0  38 60 00 02 */	li r3, 2
/* 801338D4 001306D4  48 00 00 CC */	b lbl_801339A0
lbl_801338D8:
/* 801338D8 001306D8  3C A0 80 32 */	lis r5, lbl_8031B320@ha
/* 801338DC 001306DC  38 A5 B3 20 */	addi r5, r5, lbl_8031B320@l
/* 801338E0 001306E0  3C A5 00 01 */	addis r5, r5, 1
/* 801338E4 001306E4  88 05 8D 78 */	lbz r0, -0x7288(r5)
/* 801338E8 001306E8  28 00 00 00 */	cmplwi r0, 0
/* 801338EC 001306EC  41 82 00 40 */	beq lbl_8013392C
/* 801338F0 001306F0  80 03 00 00 */	lwz r0, 0(r3)
/* 801338F4 001306F4  54 06 03 19 */	rlwinm. r6, r0, 0, 0xc, 0xc
/* 801338F8 001306F8  41 82 00 34 */	beq lbl_8013392C
/* 801338FC 001306FC  88 05 8D 55 */	lbz r0, -0x72ab(r5)
/* 80133900 00130700  28 00 00 00 */	cmplwi r0, 0
/* 80133904 00130704  41 82 00 28 */	beq lbl_8013392C
/* 80133908 00130708  28 06 00 00 */	cmplwi r6, 0
/* 8013390C 0013070C  41 82 00 20 */	beq lbl_8013392C
/* 80133910 00130710  38 00 00 01 */	li r0, 1
/* 80133914 00130714  98 04 8D 79 */	stb r0, -0x7287(r4)
/* 80133918 00130718  80 03 00 00 */	lwz r0, 0(r3)
/* 8013391C 0013071C  54 00 03 56 */	rlwinm r0, r0, 0, 0xd, 0xb
/* 80133920 00130720  90 03 00 00 */	stw r0, 0(r3)
/* 80133924 00130724  38 60 00 02 */	li r3, 2
/* 80133928 00130728  48 00 00 78 */	b lbl_801339A0
lbl_8013392C:
/* 8013392C 0013072C  88 1F 8D 28 */	lbz r0, -0x72d8(r31)
/* 80133930 00130730  54 00 DF FF */	rlwinm. r0, r0, 0x1b, 0x1f, 0x1f
/* 80133934 00130734  41 82 00 30 */	beq lbl_80133964
/* 80133938 00130738  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 8013393C 0013073C  38 80 FF FF */	li r4, -1
/* 80133940 00130740  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133944 00130744  38 A0 00 01 */	li r5, 1
/* 80133948 00130748  3C 63 00 01 */	addis r3, r3, 1
/* 8013394C 0013074C  38 63 8D 5C */	addi r3, r3, -29348
/* 80133950 00130750  48 00 03 CD */	bl playing__14sound_queue_esc__0_4_esc__1_CFib
/* 80133954 00130754  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80133958 00130758  40 82 00 0C */	bne lbl_80133964
/* 8013395C 0013075C  38 60 00 02 */	li r3, 2
/* 80133960 00130760  48 00 00 40 */	b lbl_801339A0
lbl_80133964:
/* 80133964 00130764  88 1F 8D 28 */	lbz r0, -0x72d8(r31)
/* 80133968 00130768  54 00 E7 FF */	rlwinm. r0, r0, 0x1c, 0x1f, 0x1f
/* 8013396C 0013076C  41 82 00 30 */	beq lbl_8013399C
/* 80133970 00130770  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 80133974 00130774  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 80133978 00130778  3C A3 00 01 */	addis r5, r3, 1
/* 8013397C 0013077C  80 65 8D 48 */	lwz r3, -0x72b8(r5)
/* 80133980 00130780  80 85 8D 30 */	lwz r4, -0x72d0(r5)
/* 80133984 00130784  7C 60 20 39 */	and. r0, r3, r4
/* 80133988 00130788  41 82 00 14 */	beq lbl_8013399C
/* 8013398C 0013078C  7C 60 20 78 */	andc r0, r3, r4
/* 80133990 00130790  38 60 00 02 */	li r3, 2
/* 80133994 00130794  90 05 8D 48 */	stw r0, -0x72b8(r5)
/* 80133998 00130798  48 00 00 08 */	b lbl_801339A0
lbl_8013399C:
/* 8013399C 0013079C  38 60 00 03 */	li r3, 3
lbl_801339A0:
/* 801339A0 001307A0  E3 E1 00 18 */	psq_l f31, 24(r1), 0, qr0
/* 801339A4 001307A4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801339A8 001307A8  CB E1 00 10 */	lfd f31, 0x10(r1)
/* 801339AC 001307AC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801339B0 001307B0  83 C1 00 08 */	lwz r30, 8(r1)
/* 801339B4 001307B4  7C 08 03 A6 */	mtlr r0
/* 801339B8 001307B8  38 21 00 20 */	addi r1, r1, 0x20
/* 801339BC 001307BC  4E 80 00 20 */	blr 

start__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_typeFv:
/* 801339C0 001307C0  4E 80 00 20 */	blr 

stop__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_typeFv:
/* 801339C4 001307C4  4E 80 00 20 */	blr 

update__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_typeFR6xScenef:
/* 801339C8 001307C8  38 60 FF FF */	li r3, -1
/* 801339CC 001307CC  4E 80 00 20 */	blr 

__sinit_zTalkBox_cpp:
/* 801339D0 001307D0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801339D4 001307D4  7C 08 02 A6 */	mflr r0
/* 801339D8 001307D8  3C 60 80 32 */	lis r3, lbl_8031B320@ha
/* 801339DC 001307DC  90 01 00 14 */	stw r0, 0x14(r1)
/* 801339E0 001307E0  38 63 B3 20 */	addi r3, r3, lbl_8031B320@l
/* 801339E4 001307E4  48 00 00 15 */	bl __ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_11shared_typeFv
/* 801339E8 001307E8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801339EC 001307EC  7C 08 03 A6 */	mtlr r0
/* 801339F0 001307F0  38 21 00 10 */	addi r1, r1, 0x10
/* 801339F4 001307F4  4E 80 00 20 */	blr 

/* __ct__Q222@unnamed@zTalkBox_cpp@11shared_typeFv */
__ct__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_11shared_typeFv:
/* 801339F8 001307F8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801339FC 001307FC  7C 08 02 A6 */	mflr r0
/* 80133A00 00130800  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133A04 00130804  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133A08 00130808  7C 7F 1B 78 */	mr r31, r3
/* 80133A0C 0013080C  3C 7F 00 01 */	addis r3, r31, 1
/* 80133A10 00130810  38 63 8D 5C */	addi r3, r3, -29348
/* 80133A14 00130814  4B EF C0 DD */	bl __ct__14sound_queue_esc__0_4_esc__1_Fv
/* 80133A18 00130818  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133A1C 0013081C  7F E3 FB 78 */	mr r3, r31
/* 80133A20 00130820  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80133A24 00130824  7C 08 03 A6 */	mtlr r0
/* 80133A28 00130828  38 21 00 10 */	addi r1, r1, 0x10
/* 80133A2C 0013082C  4E 80 00 20 */	blr 

/* back__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133A30 00130830  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80133A34 00130834  7C 08 02 A6 */	mflr r0
/* 80133A38 00130838  90 01 00 24 */	stw r0, 0x24(r1)
/* 80133A3C 0013083C  48 00 00 E9 */	bl end__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
/* 80133A40 00130840  90 81 00 0C */	stw r4, 0xc(r1)
/* 80133A44 00130844  38 80 00 01 */	li r4, 1
/* 80133A48 00130848  90 61 00 08 */	stw r3, 8(r1)
/* 80133A4C 0013084C  38 61 00 08 */	addi r3, r1, 8
/* 80133A50 00130850  48 00 00 3D */	bl __mi__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFi
/* 80133A54 00130854  90 61 00 10 */	stw r3, 0x10(r1)
/* 80133A58 00130858  38 61 00 10 */	addi r3, r1, 0x10
/* 80133A5C 0013085C  90 81 00 14 */	stw r4, 0x14(r1)
/* 80133A60 00130860  48 00 00 15 */	bl __ml__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFv
/* 80133A64 00130864  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80133A68 00130868  7C 08 03 A6 */	mtlr r0
/* 80133A6C 0013086C  38 21 00 20 */	addi r1, r1, 0x20
/* 80133A70 00130870  4E 80 00 20 */	blr 

/* __ml__Q256fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>8iteratorCFv */
.global __ml__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFv
__ml__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFv:
/* 80133A74 00130874  80 03 00 00 */	lwz r0, 0(r3)
/* 80133A78 00130878  80 83 00 04 */	lwz r4, 4(r3)
/* 80133A7C 0013087C  54 03 18 38 */	slwi r3, r0, 3
/* 80133A80 00130880  38 63 00 08 */	addi r3, r3, 8
/* 80133A84 00130884  7C 64 1A 14 */	add r3, r4, r3
/* 80133A88 00130888  4E 80 00 20 */	blr 

/* __mi__Q256fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>8iteratorCFi */
.global __mi__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFi
__mi__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFi:
/* 80133A8C 0013088C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133A90 00130890  7C 08 02 A6 */	mflr r0
/* 80133A94 00130894  80 A3 00 00 */	lwz r5, 0(r3)
/* 80133A98 00130898  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133A9C 0013089C  80 03 00 04 */	lwz r0, 4(r3)
/* 80133AA0 001308A0  38 61 00 08 */	addi r3, r1, 8
/* 80133AA4 001308A4  90 A1 00 08 */	stw r5, 8(r1)
/* 80133AA8 001308A8  90 01 00 0C */	stw r0, 0xc(r1)
/* 80133AAC 001308AC  48 00 00 1D */	bl __ami__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi
/* 80133AB0 001308B0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133AB4 001308B4  80 61 00 08 */	lwz r3, 8(r1)
/* 80133AB8 001308B8  80 81 00 0C */	lwz r4, 0xc(r1)
/* 80133ABC 001308BC  7C 08 03 A6 */	mtlr r0
/* 80133AC0 001308C0  38 21 00 10 */	addi r1, r1, 0x10
/* 80133AC4 001308C4  4E 80 00 20 */	blr 

/* __ami__Q256fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>8iteratorFi */
.global __ami__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi
__ami__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi:
/* 80133AC8 001308C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133ACC 001308CC  7C 08 02 A6 */	mflr r0
/* 80133AD0 001308D0  7C 84 00 D0 */	neg r4, r4
/* 80133AD4 001308D4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133AD8 001308D8  48 00 00 21 */	bl __apl__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi
/* 80133ADC 001308DC  7C 64 1B 78 */	mr r4, r3
/* 80133AE0 001308E0  80 63 00 00 */	lwz r3, 0(r3)
/* 80133AE4 001308E4  80 84 00 04 */	lwz r4, 4(r4)
/* 80133AE8 001308E8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133AEC 001308EC  7C 08 03 A6 */	mtlr r0
/* 80133AF0 001308F0  38 21 00 10 */	addi r1, r1, 0x10
/* 80133AF4 001308F4  4E 80 00 20 */	blr 

/* __apl__Q256fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>8iteratorFi */
.global __apl__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi
__apl__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorFi:
/* 80133AF8 001308F8  80 C3 00 00 */	lwz r6, 0(r3)
/* 80133AFC 001308FC  3C A0 3E 10 */	lis r5, 0x3E0F83E1@ha
/* 80133B00 00130900  38 05 83 E1 */	addi r0, r5, 0x3E0F83E1@l
/* 80133B04 00130904  7C 86 22 14 */	add r4, r6, r4
/* 80133B08 00130908  38 84 00 21 */	addi r4, r4, 0x21
/* 80133B0C 0013090C  7C 00 20 16 */	mulhwu r0, r0, r4
/* 80133B10 00130910  54 00 E8 FE */	srwi r0, r0, 3
/* 80133B14 00130914  1C 00 00 21 */	mulli r0, r0, 0x21
/* 80133B18 00130918  7C 00 20 50 */	subf r0, r0, r4
/* 80133B1C 0013091C  90 03 00 00 */	stw r0, 0(r3)
/* 80133B20 00130920  4E 80 00 20 */	blr 

/* end__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>CFv */
.global end__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
end__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv:
/* 80133B24 00130924  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133B28 00130928  7C 08 02 A6 */	mflr r0
/* 80133B2C 0013092C  80 83 00 04 */	lwz r4, 4(r3)
/* 80133B30 00130930  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133B34 00130934  48 00 00 15 */	bl create_iterator__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFUl
/* 80133B38 00130938  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133B3C 0013093C  7C 08 03 A6 */	mtlr r0
/* 80133B40 00130940  38 21 00 10 */	addi r1, r1, 0x10
/* 80133B44 00130944  4E 80 00 20 */	blr 

/* create_iterator__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>CFUl */
.global create_iterator__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFUl
create_iterator__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFUl:
/* 80133B48 00130948  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133B4C 0013094C  7C 60 1B 78 */	mr r0, r3
/* 80133B50 00130950  7C 83 23 78 */	mr r3, r4
/* 80133B54 00130954  90 81 00 08 */	stw r4, 8(r1)
/* 80133B58 00130958  7C 04 03 78 */	mr r4, r0
/* 80133B5C 0013095C  90 01 00 0C */	stw r0, 0xc(r1)
/* 80133B60 00130960  38 21 00 10 */	addi r1, r1, 0x10
/* 80133B64 00130964  4E 80 00 20 */	blr 

/* push_back__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global push_back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
push_back__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133B68 00130968  80 A3 00 04 */	lwz r5, 4(r3)
/* 80133B6C 0013096C  3C 80 3E 10 */	lis r4, 0x3E0F83E1@ha
/* 80133B70 00130970  38 04 83 E1 */	addi r0, r4, 0x3E0F83E1@l
/* 80133B74 00130974  38 85 00 01 */	addi r4, r5, 1
/* 80133B78 00130978  7C 00 20 16 */	mulhwu r0, r0, r4
/* 80133B7C 0013097C  54 00 E8 FE */	srwi r0, r0, 3
/* 80133B80 00130980  1C 00 00 21 */	mulli r0, r0, 0x21
/* 80133B84 00130984  7C 00 20 50 */	subf r0, r0, r4
/* 80133B88 00130988  90 03 00 04 */	stw r0, 4(r3)
/* 80133B8C 0013098C  4E 80 00 20 */	blr 

/* empty__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>CFv */
.global empty__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
empty__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv:
/* 80133B90 00130990  80 83 00 04 */	lwz r4, 4(r3)
/* 80133B94 00130994  80 03 00 00 */	lwz r0, 0(r3)
/* 80133B98 00130998  7C 04 00 50 */	subf r0, r4, r0
/* 80133B9C 0013099C  7C 00 00 34 */	cntlzw r0, r0
/* 80133BA0 001309A0  54 03 D9 7E */	srwi r3, r0, 5
/* 80133BA4 001309A4  4E 80 00 20 */	blr 

/* pop_front__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global pop_front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
pop_front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133BA8 001309A8  80 A3 00 00 */	lwz r5, 0(r3)
/* 80133BAC 001309AC  3C 80 3E 10 */	lis r4, 0x3E0F83E1@ha
/* 80133BB0 001309B0  38 04 83 E1 */	addi r0, r4, 0x3E0F83E1@l
/* 80133BB4 001309B4  38 85 00 01 */	addi r4, r5, 1
/* 80133BB8 001309B8  7C 00 20 16 */	mulhwu r0, r0, r4
/* 80133BBC 001309BC  54 00 E8 FE */	srwi r0, r0, 3
/* 80133BC0 001309C0  1C 00 00 21 */	mulli r0, r0, 0x21
/* 80133BC4 001309C4  7C 00 20 50 */	subf r0, r0, r4
/* 80133BC8 001309C8  90 03 00 00 */	stw r0, 0(r3)
/* 80133BCC 001309CC  4E 80 00 20 */	blr 

/* front__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
front__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133BD0 001309D0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133BD4 001309D4  7C 08 02 A6 */	mflr r0
/* 80133BD8 001309D8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133BDC 001309DC  48 00 00 25 */	bl begin__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
/* 80133BE0 001309E0  90 61 00 08 */	stw r3, 8(r1)
/* 80133BE4 001309E4  38 61 00 08 */	addi r3, r1, 8
/* 80133BE8 001309E8  90 81 00 0C */	stw r4, 0xc(r1)
/* 80133BEC 001309EC  4B FF FE 89 */	bl __ml__Q256fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_8iteratorCFv
/* 80133BF0 001309F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133BF4 001309F4  7C 08 03 A6 */	mtlr r0
/* 80133BF8 001309F8  38 21 00 10 */	addi r1, r1, 0x10
/* 80133BFC 001309FC  4E 80 00 20 */	blr 

/* begin__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>CFv */
.global begin__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv
begin__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFv:
/* 80133C00 00130A00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133C04 00130A04  7C 08 02 A6 */	mflr r0
/* 80133C08 00130A08  80 83 00 00 */	lwz r4, 0(r3)
/* 80133C0C 00130A0C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133C10 00130A10  4B FF FF 39 */	bl create_iterator__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_CFUl
/* 80133C14 00130A14  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133C18 00130A18  7C 08 03 A6 */	mtlr r0
/* 80133C1C 00130A1C  38 21 00 10 */	addi r1, r1, 0x10
/* 80133C20 00130A20  4E 80 00 20 */	blr 

/* reset__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global reset__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
reset__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133C24 00130A24  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133C28 00130A28  7C 08 02 A6 */	mflr r0
/* 80133C2C 00130A2C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133C30 00130A30  48 00 00 15 */	bl clear__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
/* 80133C34 00130A34  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133C38 00130A38  7C 08 03 A6 */	mtlr r0
/* 80133C3C 00130A3C  38 21 00 10 */	addi r1, r1, 0x10
/* 80133C40 00130A40  4E 80 00 20 */	blr 

/* clear__56fixed_queue<Q222@unnamed@zTalkBox_cpp@12trigger_pair,32>Fv */
.global clear__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv
clear__56fixed_queue_esc__0_Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_12trigger_pair_esc__4_32_esc__1_Fv:
/* 80133C44 00130A44  38 00 00 00 */	li r0, 0
/* 80133C48 00130A48  90 03 00 04 */	stw r0, 4(r3)
/* 80133C4C 00130A4C  90 03 00 00 */	stw r0, 0(r3)
/* 80133C50 00130A50  4E 80 00 20 */	blr 

/* pop__14sound_queue<4>Fv */
.global pop__14sound_queue_esc__0_4_esc__1_Fv
pop__14sound_queue_esc__0_4_esc__1_Fv:
/* 80133C54 00130A54  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133C58 00130A58  7C 08 02 A6 */	mflr r0
/* 80133C5C 00130A5C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133C60 00130A60  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133C64 00130A64  7C 7F 1B 78 */	mr r31, r3
/* 80133C68 00130A68  80 03 00 14 */	lwz r0, 0x14(r3)
/* 80133C6C 00130A6C  54 00 10 3A */	slwi r0, r0, 2
/* 80133C70 00130A70  7C 7F 00 2E */	lwzx r3, r31, r0
/* 80133C74 00130A74  4B F1 55 8D */	bl xSndStop__FUi
/* 80133C78 00130A78  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 80133C7C 00130A7C  3C 60 66 66 */	lis r3, 0x66666667@ha
/* 80133C80 00130A80  38 03 66 67 */	addi r0, r3, 0x66666667@l
/* 80133C84 00130A84  38 84 00 01 */	addi r4, r4, 1
/* 80133C88 00130A88  7C 00 20 96 */	mulhw r0, r0, r4
/* 80133C8C 00130A8C  7C 00 0E 70 */	srawi r0, r0, 1
/* 80133C90 00130A90  54 03 0F FE */	srwi r3, r0, 0x1f
/* 80133C94 00130A94  7C 00 1A 14 */	add r0, r0, r3
/* 80133C98 00130A98  1C 00 00 05 */	mulli r0, r0, 5
/* 80133C9C 00130A9C  7C 00 20 50 */	subf r0, r0, r4
/* 80133CA0 00130AA0  90 1F 00 14 */	stw r0, 0x14(r31)
/* 80133CA4 00130AA4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80133CA8 00130AA8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133CAC 00130AAC  7C 08 03 A6 */	mtlr r0
/* 80133CB0 00130AB0  38 21 00 10 */	addi r1, r1, 0x10
/* 80133CB4 00130AB4  4E 80 00 20 */	blr 

/* size__14sound_queue<4>CFv */
.global size__14sound_queue_esc__0_4_esc__1_CFv
size__14sound_queue_esc__0_4_esc__1_CFv:
/* 80133CB8 00130AB8  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 80133CBC 00130ABC  80 83 00 14 */	lwz r4, 0x14(r3)
/* 80133CC0 00130AC0  7C 05 20 00 */	cmpw r5, r4
/* 80133CC4 00130AC4  7C 64 28 50 */	subf r3, r4, r5
/* 80133CC8 00130AC8  4C 80 00 20 */	bgelr 
/* 80133CCC 00130ACC  38 05 00 05 */	addi r0, r5, 5
/* 80133CD0 00130AD0  7C 64 00 50 */	subf r3, r4, r0
/* 80133CD4 00130AD4  4E 80 00 20 */	blr 

/* clear__14sound_queue<4>Fv */
.global clear__14sound_queue_esc__0_4_esc__1_Fv
clear__14sound_queue_esc__0_4_esc__1_Fv:
/* 80133CD8 00130AD8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80133CDC 00130ADC  7C 08 02 A6 */	mflr r0
/* 80133CE0 00130AE0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80133CE4 00130AE4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80133CE8 00130AE8  7C 7F 1B 78 */	mr r31, r3
/* 80133CEC 00130AEC  48 00 00 0C */	b lbl_80133CF8
lbl_80133CF0:
/* 80133CF0 00130AF0  7F E3 FB 78 */	mr r3, r31
/* 80133CF4 00130AF4  4B FF FF 61 */	bl pop__14sound_queue_esc__0_4_esc__1_Fv
lbl_80133CF8:
/* 80133CF8 00130AF8  7F E3 FB 78 */	mr r3, r31
/* 80133CFC 00130AFC  4B FF FF BD */	bl size__14sound_queue_esc__0_4_esc__1_CFv
/* 80133D00 00130B00  2C 03 00 00 */	cmpwi r3, 0
/* 80133D04 00130B04  41 81 FF EC */	bgt lbl_80133CF0
/* 80133D08 00130B08  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80133D0C 00130B0C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80133D10 00130B10  7C 08 03 A6 */	mtlr r0
/* 80133D14 00130B14  38 21 00 10 */	addi r1, r1, 0x10
/* 80133D18 00130B18  4E 80 00 20 */	blr 

/* playing__14sound_queue<4>CFib */
.global playing__14sound_queue_esc__0_4_esc__1_CFib
playing__14sound_queue_esc__0_4_esc__1_CFib:
/* 80133D1C 00130B1C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80133D20 00130B20  7C 08 02 A6 */	mflr r0
/* 80133D24 00130B24  90 01 00 24 */	stw r0, 0x24(r1)
/* 80133D28 00130B28  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80133D2C 00130B2C  7C BF 2B 78 */	mr r31, r5
/* 80133D30 00130B30  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80133D34 00130B34  7C 9E 23 78 */	mr r30, r4
/* 80133D38 00130B38  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80133D3C 00130B3C  7C 7D 1B 78 */	mr r29, r3
/* 80133D40 00130B40  4B FF FF 79 */	bl size__14sound_queue_esc__0_4_esc__1_CFv
/* 80133D44 00130B44  2C 1E 00 00 */	cmpwi r30, 0
/* 80133D48 00130B48  41 80 00 0C */	blt lbl_80133D54
/* 80133D4C 00130B4C  7C 1E 18 00 */	cmpw r30, r3
/* 80133D50 00130B50  40 81 00 08 */	ble lbl_80133D58
lbl_80133D54:
/* 80133D54 00130B54  7C 7E 1B 78 */	mr r30, r3
lbl_80133D58:
/* 80133D58 00130B58  57 E0 06 3F */	clrlwi. r0, r31, 0x18
/* 80133D5C 00130B5C  41 82 00 40 */	beq lbl_80133D9C
/* 80133D60 00130B60  3B E0 00 00 */	li r31, 0
/* 80133D64 00130B64  48 00 00 28 */	b lbl_80133D8C
lbl_80133D68:
/* 80133D68 00130B68  7F A3 EB 78 */	mr r3, r29
/* 80133D6C 00130B6C  7F E4 FB 78 */	mr r4, r31
/* 80133D70 00130B70  48 00 00 81 */	bl recent__14sound_queue_esc__0_4_esc__1_CFi
/* 80133D74 00130B74  4B F4 EF B9 */	bl xSndIsPlayingByHandle__FUi
/* 80133D78 00130B78  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80133D7C 00130B7C  40 82 00 0C */	bne lbl_80133D88
/* 80133D80 00130B80  38 60 00 00 */	li r3, 0
/* 80133D84 00130B84  48 00 00 50 */	b lbl_80133DD4
lbl_80133D88:
/* 80133D88 00130B88  3B FF 00 01 */	addi r31, r31, 1
lbl_80133D8C:
/* 80133D8C 00130B8C  7C 1F F0 00 */	cmpw r31, r30
/* 80133D90 00130B90  41 80 FF D8 */	blt lbl_80133D68
/* 80133D94 00130B94  38 60 00 01 */	li r3, 1
/* 80133D98 00130B98  48 00 00 3C */	b lbl_80133DD4
lbl_80133D9C:
/* 80133D9C 00130B9C  3B E0 00 00 */	li r31, 0
/* 80133DA0 00130BA0  48 00 00 28 */	b lbl_80133DC8
lbl_80133DA4:
/* 80133DA4 00130BA4  7F A3 EB 78 */	mr r3, r29
/* 80133DA8 00130BA8  7F E4 FB 78 */	mr r4, r31
/* 80133DAC 00130BAC  48 00 00 45 */	bl recent__14sound_queue_esc__0_4_esc__1_CFi
/* 80133DB0 00130BB0  4B F4 EF 7D */	bl xSndIsPlayingByHandle__FUi
/* 80133DB4 00130BB4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80133DB8 00130BB8  41 82 00 0C */	beq lbl_80133DC4
/* 80133DBC 00130BBC  38 60 00 01 */	li r3, 1
/* 80133DC0 00130BC0  48 00 00 14 */	b lbl_80133DD4
lbl_80133DC4:
/* 80133DC4 00130BC4  3B FF 00 01 */	addi r31, r31, 1
lbl_80133DC8:
/* 80133DC8 00130BC8  7C 1F F0 00 */	cmpw r31, r30
/* 80133DCC 00130BCC  41 80 FF D8 */	blt lbl_80133DA4
/* 80133DD0 00130BD0  38 60 00 00 */	li r3, 0
lbl_80133DD4:
/* 80133DD4 00130BD4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80133DD8 00130BD8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80133DDC 00130BDC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80133DE0 00130BE0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80133DE4 00130BE4  7C 08 03 A6 */	mtlr r0
/* 80133DE8 00130BE8  38 21 00 20 */	addi r1, r1, 0x20
/* 80133DEC 00130BEC  4E 80 00 20 */	blr 

/* recent__14sound_queue<4>CFi */
.global recent__14sound_queue_esc__0_4_esc__1_CFi
recent__14sound_queue_esc__0_4_esc__1_CFi:
/* 80133DF0 00130BF0  80 03 00 18 */	lwz r0, 0x18(r3)
/* 80133DF4 00130BF4  7C 84 00 50 */	subf r4, r4, r0
/* 80133DF8 00130BF8  34 84 FF FF */	addic. r4, r4, -1
/* 80133DFC 00130BFC  40 80 00 08 */	bge lbl_80133E04
/* 80133E00 00130C00  38 84 00 05 */	addi r4, r4, 5
lbl_80133E04:
/* 80133E04 00130C04  54 80 10 3A */	slwi r0, r4, 2
/* 80133E08 00130C08  7C 63 00 2E */	lwzx r3, r3, r0
/* 80133E0C 00130C0C  4E 80 00 20 */	blr 

.global type_name__13pointer_assetFv
type_name__13pointer_assetFv:
/* 80133E10 00130C10  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80133E14 00130C14  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80133E18 00130C18  38 63 00 76 */	addi r3, r3, 0x76
/* 80133E1C 00130C1C  4E 80 00 20 */	blr 

.global type_name__14location_assetFv
type_name__14location_assetFv:
/* 80133E20 00130C20  3C 60 80 27 */	lis r3, lbl_8026C920@ha
/* 80133E24 00130C24  38 63 C9 20 */	addi r3, r3, lbl_8026C920@l
/* 80133E28 00130C28  38 63 00 7E */	addi r3, r3, 0x7e
/* 80133E2C 00130C2C  4E 80 00 20 */	blr 

.global jots__Q28xtextbox6layoutCFv
jots__Q28xtextbox6layoutCFv:
/* 80133E30 00130C30  38 63 00 68 */	addi r3, r3, 0x68
/* 80133E34 00130C34  4E 80 00 20 */	blr 

.endif

.section .rodata
lbl_8026C870:
	.incbin "baserom.dol", 0x269850, 0x30
lbl_8026C8A0:
	.incbin "baserom.dol", 0x269880, 0x30
lbl_8026C8D0:
	.incbin "baserom.dol", 0x2698B0, 0x50
lbl_8026C920:
	.incbin "baserom.dol", 0x269900, 0x118

.section .data
lbl_80298E68:
	.incbin "baserom.dol", 0x295E48, 0xB4
/* SPECULATION: link order */
.global __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_type
__vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_16start_state_type:
	.incbin "baserom.dol", 0x295EFC, 0x14
/* SPECULATION: link order */
.global __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_type
__vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15next_state_type:
	.incbin "baserom.dol", 0x295F10, 0x14
/* SPECULATION: link order */
.global __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_type
__vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15wait_state_type:
	.incbin "baserom.dol", 0x295F24, 0x14
/* SPECULATION: link order */
.global __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_type
__vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_10state_type:
	.incbin "baserom.dol", 0x295F38, 0x14
/* SPECULATION: link order */
.global __vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_type
__vt__Q222_esc__2_unnamed_esc__2_zTalkBox_cpp_esc__2_15stop_state_type:
	.incbin "baserom.dol", 0x295F4C, 0x14

.section .bss
lbl_8031B320:
	.skip 0x8E9C
lbl_803241BC:
	.skip 0x80
lbl_8032423C:
	.skip 0xC
lbl_80324248:
	.skip 0x10

.section .sbss
lbl_803CBEF8:
	.skip 0x4
lbl_803CBEFC:
	.skip 0x1
lbl_803CBEFD:
	.skip 0x1
lbl_803CBEFE:
	.skip 0x2
lbl_803CBF00:
	.skip 0x8
lbl_803CBF08:
	.skip 0x1
lbl_803CBF09:
	.skip 0x1
lbl_803CBF0A:
	.skip 0x2
lbl_803CBF0C:
	.skip 0xC

.section .sbss2
lbl_803D08E8:
	.skip 0x4
/* SPECULATION: link order */
.global lbl_803D08EC
lbl_803D08EC:
	.skip 0x4

.section .sdata
lbl_803CAD68:
	.incbin "baserom.dol", 0x2B5E28, 0x4
lbl_803CAD6C:
	.incbin "baserom.dol", 0x2B5E2C, 0x4
lbl_803CAD70:
	.incbin "baserom.dol", 0x2B5E30, 0x8

.section .sdata2
lbl_803CECA8:
	.incbin "baserom.dol", 0x2B8548, 0x4
lbl_803CECAC:
	.incbin "baserom.dol", 0x2B854C, 0x4
lbl_803CECB0:
	.incbin "baserom.dol", 0x2B8550, 0x4
lbl_803CECB4:
	.incbin "baserom.dol", 0x2B8554, 0x4
lbl_803CECB8:
	.incbin "baserom.dol", 0x2B8558, 0x4
lbl_803CECBC:
	.incbin "baserom.dol", 0x2B855C, 0x4
lbl_803CECC0:
	.incbin "baserom.dol", 0x2B8560, 0x8
