
test_read.o:     file format elf32-tradlittlemips


Disassembly of section .text:

80000000 <__start>:
80000000:	3c1d8800 	lui	$29,0x8800
80000004:	0411019a 	bgezal	$0,80000670 <main>
80000008:	00000000 	sll	$0,$0,0x0

8000000c <boot>:
8000000c:	3c158000 	lui	$21,0x8000
80000010:	02a00008 	jr	$21
80000014:	00000000 	sll	$0,$0,0x0
	...

80000380 <end>:
80000380:	1000ffff 	beqz	$0,80000380 <end>
80000384:	00000000 	sll	$0,$0,0x0
	...

80000390 <_Z12write_serialh>:
80000390:	27bdffe8 	addiu	$29,$29,-24
80000394:	afbe0014 	sw	$30,20($29)
80000398:	03a0f025 	or	$30,$29,$0
8000039c:	00801025 	or	$2,$4,$0
800003a0:	a3c20018 	sb	$2,24($30)
800003a4:	3c02bfd0 	lui	$2,0xbfd0
800003a8:	344203fc 	ori	$2,$2,0x3fc
800003ac:	afc20008 	sw	$2,8($30)
800003b0:	8fc20008 	lw	$2,8($30)
800003b4:	90420000 	lbu	$2,0($2)
800003b8:	30420001 	andi	$2,$2,0x1
800003bc:	14400003 	bnez	$2,800003cc <_Z12write_serialh+0x3c>
800003c0:	00000000 	sll	$0,$0,0x0
800003c4:	1000fff7 	beqz	$0,800003a4 <_Z12write_serialh+0x14>
800003c8:	00000000 	sll	$0,$0,0x0
800003cc:	00000000 	sll	$0,$0,0x0
800003d0:	3c02bfd0 	lui	$2,0xbfd0
800003d4:	344203f8 	ori	$2,$2,0x3f8
800003d8:	afc2000c 	sw	$2,12($30)
800003dc:	8fc2000c 	lw	$2,12($30)
800003e0:	93c30018 	lbu	$3,24($30)
800003e4:	a0430000 	sb	$3,0($2)
800003e8:	00000000 	sll	$0,$0,0x0
800003ec:	03c0e825 	or	$29,$30,$0
800003f0:	8fbe0014 	lw	$30,20($29)
800003f4:	27bd0018 	addiu	$29,$29,24
800003f8:	03e00008 	jr	$31
800003fc:	00000000 	sll	$0,$0,0x0

80000400 <_Z7putchari>:
80000400:	27bdffe0 	addiu	$29,$29,-32
80000404:	afbf001c 	sw	$31,28($29)
80000408:	afbe0018 	sw	$30,24($29)
8000040c:	03a0f025 	or	$30,$29,$0
80000410:	afc40020 	sw	$4,32($30)
80000414:	8fc20020 	lw	$2,32($30)
80000418:	304200ff 	andi	$2,$2,0xff
8000041c:	00402025 	or	$4,$2,$0
80000420:	0c0000e4 	jal	80000390 <_Z12write_serialh>
80000424:	00000000 	sll	$0,$0,0x0
80000428:	8fc20020 	lw	$2,32($30)
8000042c:	03c0e825 	or	$29,$30,$0
80000430:	8fbf001c 	lw	$31,28($29)
80000434:	8fbe0018 	lw	$30,24($29)
80000438:	27bd0020 	addiu	$29,$29,32
8000043c:	03e00008 	jr	$31
80000440:	00000000 	sll	$0,$0,0x0

80000444 <_Z9putstringPKc>:
80000444:	27bdffd8 	addiu	$29,$29,-40
80000448:	afbf0024 	sw	$31,36($29)
8000044c:	afbe0020 	sw	$30,32($29)
80000450:	03a0f025 	or	$30,$29,$0
80000454:	afc40028 	sw	$4,40($30)
80000458:	8fc20028 	lw	$2,40($30)
8000045c:	90420000 	lbu	$2,0($2)
80000460:	a3c20018 	sb	$2,24($30)
80000464:	83c20018 	lb	$2,24($30)
80000468:	0002102b 	sltu	$2,$0,$2
8000046c:	304200ff 	andi	$2,$2,0xff
80000470:	10400011 	beqz	$2,800004b8 <_Z9putstringPKc+0x74>
80000474:	00000000 	sll	$0,$0,0x0
80000478:	83c30018 	lb	$3,24($30)
8000047c:	2402000a 	addiu	$2,$0,10
80000480:	14620004 	bne	$3,$2,80000494 <_Z9putstringPKc+0x50>
80000484:	00000000 	sll	$0,$0,0x0
80000488:	2404000d 	addiu	$4,$0,13
8000048c:	0c000100 	jal	80000400 <_Z7putchari>
80000490:	00000000 	sll	$0,$0,0x0
80000494:	83c20018 	lb	$2,24($30)
80000498:	00402025 	or	$4,$2,$0
8000049c:	0c000100 	jal	80000400 <_Z7putchari>
800004a0:	00000000 	sll	$0,$0,0x0
800004a4:	8fc20028 	lw	$2,40($30)
800004a8:	24420001 	addiu	$2,$2,1
800004ac:	afc20028 	sw	$2,40($30)
800004b0:	1000ffe9 	beqz	$0,80000458 <_Z9putstringPKc+0x14>
800004b4:	00000000 	sll	$0,$0,0x0
800004b8:	00001025 	or	$2,$0,$0
800004bc:	03c0e825 	or	$29,$30,$0
800004c0:	8fbf0024 	lw	$31,36($29)
800004c4:	8fbe0020 	lw	$30,32($29)
800004c8:	27bd0028 	addiu	$29,$29,40
800004cc:	03e00008 	jr	$31
800004d0:	00000000 	sll	$0,$0,0x0

800004d4 <_Z9printbaseliii>:
800004d4:	27bdff90 	addiu	$29,$29,-112
800004d8:	afbf006c 	sw	$31,108($29)
800004dc:	afbe0068 	sw	$30,104($29)
800004e0:	03a0f025 	or	$30,$29,$0
800004e4:	afc40070 	sw	$4,112($30)
800004e8:	afc50074 	sw	$5,116($30)
800004ec:	afc60078 	sw	$6,120($30)
800004f0:	afc7007c 	sw	$7,124($30)
800004f4:	8fc2007c 	lw	$2,124($30)
800004f8:	1040000c 	beqz	$2,8000052c <_Z9printbaseliii+0x58>
800004fc:	00000000 	sll	$0,$0,0x0
80000500:	8fc20070 	lw	$2,112($30)
80000504:	04410009 	bgez	$2,8000052c <_Z9printbaseliii+0x58>
80000508:	00000000 	sll	$0,$0,0x0
8000050c:	8fc20070 	lw	$2,112($30)
80000510:	00021023 	negu	$2,$2
80000514:	afc2001c 	sw	$2,28($30)
80000518:	2404002d 	addiu	$4,$0,45
8000051c:	0c000100 	jal	80000400 <_Z7putchari>
80000520:	00000000 	sll	$0,$0,0x0
80000524:	10000003 	beqz	$0,80000534 <_Z9printbaseliii+0x60>
80000528:	00000000 	sll	$0,$0,0x0
8000052c:	8fc20070 	lw	$2,112($30)
80000530:	afc2001c 	sw	$2,28($30)
80000534:	afc00024 	sw	$0,36($30)
80000538:	8fc2001c 	lw	$2,28($30)
8000053c:	10400018 	beqz	$2,800005a0 <_Z9printbaseliii+0xcc>
80000540:	00000000 	sll	$0,$0,0x0
80000544:	8fc20078 	lw	$2,120($30)
80000548:	8fc3001c 	lw	$3,28($30)
8000054c:	004001f4 	teq	$2,$0,0x7
80000550:	0062001b 	divu	$0,$3,$2
80000554:	00001010 	mfhi	$2
80000558:	00401825 	or	$3,$2,$0
8000055c:	8fc20024 	lw	$2,36($30)
80000560:	7c031c20 	seb	$3,$3
80000564:	27c40018 	addiu	$4,$30,24
80000568:	00821021 	addu	$2,$4,$2
8000056c:	a0430010 	sb	$3,16($2)
80000570:	8fc20078 	lw	$2,120($30)
80000574:	8fc3001c 	lw	$3,28($30)
80000578:	004001f4 	teq	$2,$0,0x7
8000057c:	0062001b 	divu	$0,$3,$2
80000580:	00001010 	mfhi	$2
80000584:	00001012 	mflo	$2
80000588:	afc2001c 	sw	$2,28($30)
8000058c:	8fc20024 	lw	$2,36($30)
80000590:	24420001 	addiu	$2,$2,1
80000594:	afc20024 	sw	$2,36($30)
80000598:	1000ffe7 	beqz	$0,80000538 <_Z9printbaseliii+0x64>
8000059c:	00000000 	sll	$0,$0,0x0
800005a0:	8fc30074 	lw	$3,116($30)
800005a4:	8fc20024 	lw	$2,36($30)
800005a8:	0043102a 	slt	$2,$2,$3
800005ac:	10400004 	beqz	$2,800005c0 <_Z9printbaseliii+0xec>
800005b0:	00000000 	sll	$0,$0,0x0
800005b4:	8fc20074 	lw	$2,116($30)
800005b8:	10000002 	beqz	$0,800005c4 <_Z9printbaseliii+0xf0>
800005bc:	00000000 	sll	$0,$0,0x0
800005c0:	8fc20024 	lw	$2,36($30)
800005c4:	afc20018 	sw	$2,24($30)
800005c8:	8fc20018 	lw	$2,24($30)
800005cc:	18400021 	blez	$2,80000654 <_Z9printbaseliii+0x180>
800005d0:	00000000 	sll	$0,$0,0x0
800005d4:	8fc20024 	lw	$2,36($30)
800005d8:	8fc30018 	lw	$3,24($30)
800005dc:	0043102a 	slt	$2,$2,$3
800005e0:	14400008 	bnez	$2,80000604 <_Z9printbaseliii+0x130>
800005e4:	00000000 	sll	$0,$0,0x0
800005e8:	8fc20018 	lw	$2,24($30)
800005ec:	2442ffff 	addiu	$2,$2,-1
800005f0:	27c30018 	addiu	$3,$30,24
800005f4:	00621021 	addu	$2,$3,$2
800005f8:	80420010 	lb	$2,16($2)
800005fc:	10000002 	beqz	$0,80000608 <_Z9printbaseliii+0x134>
80000600:	00000000 	sll	$0,$0,0x0
80000604:	00001025 	or	$2,$0,$0
80000608:	afc20020 	sw	$2,32($30)
8000060c:	8fc20020 	lw	$2,32($30)
80000610:	2842000a 	slti	$2,$2,10
80000614:	10400005 	beqz	$2,8000062c <_Z9printbaseliii+0x158>
80000618:	00000000 	sll	$0,$0,0x0
8000061c:	8fc20020 	lw	$2,32($30)
80000620:	24420030 	addiu	$2,$2,48
80000624:	10000003 	beqz	$0,80000634 <_Z9printbaseliii+0x160>
80000628:	00000000 	sll	$0,$0,0x0
8000062c:	8fc20020 	lw	$2,32($30)
80000630:	24420057 	addiu	$2,$2,87
80000634:	00402025 	or	$4,$2,$0
80000638:	0c000100 	jal	80000400 <_Z7putchari>
8000063c:	00000000 	sll	$0,$0,0x0
80000640:	8fc20018 	lw	$2,24($30)
80000644:	2442ffff 	addiu	$2,$2,-1
80000648:	afc20018 	sw	$2,24($30)
8000064c:	1000ffde 	beqz	$0,800005c8 <_Z9printbaseliii+0xf4>
80000650:	00000000 	sll	$0,$0,0x0
80000654:	00001025 	or	$2,$0,$0
80000658:	03c0e825 	or	$29,$30,$0
8000065c:	8fbf006c 	lw	$31,108($29)
80000660:	8fbe0068 	lw	$30,104($29)
80000664:	27bd0070 	addiu	$29,$29,112
80000668:	03e00008 	jr	$31
8000066c:	00000000 	sll	$0,$0,0x0

80000670 <main>:
80000670:	27bdffd8 	addiu	$29,$29,-40
80000674:	afbf0024 	sw	$31,36($29)
80000678:	afbe0020 	sw	$30,32($29)
8000067c:	03a0f025 	or	$30,$29,$0
80000680:	3c028000 	lui	$2,0x8000
80000684:	24440790 	addiu	$4,$2,1936
80000688:	0c000111 	jal	80000444 <_Z9putstringPKc>
8000068c:	00000000 	sll	$0,$0,0x0
80000690:	3c02bb00 	lui	$2,0xbb00
80000694:	344207ff 	ori	$2,$2,0x7ff
80000698:	afc2001c 	sw	$2,28($30)
8000069c:	8fc2001c 	lw	$2,28($30)
800006a0:	a0400000 	sb	$0,0($2)
800006a4:	8fc2001c 	lw	$2,28($30)
800006a8:	90420000 	lbu	$2,0($2)
800006ac:	304200ff 	andi	$2,$2,0xff
800006b0:	00003825 	or	$7,$0,$0
800006b4:	2406000a 	addiu	$6,$0,10
800006b8:	24050001 	addiu	$5,$0,1
800006bc:	00402025 	or	$4,$2,$0
800006c0:	0c000135 	jal	800004d4 <_Z9printbaseliii>
800006c4:	00000000 	sll	$0,$0,0x0
800006c8:	3c028000 	lui	$2,0x8000
800006cc:	244407a4 	addiu	$4,$2,1956
800006d0:	0c000111 	jal	80000444 <_Z9putstringPKc>
800006d4:	00000000 	sll	$0,$0,0x0
800006d8:	8fc2001c 	lw	$2,28($30)
800006dc:	90420000 	lbu	$2,0($2)
800006e0:	a3c20018 	sb	$2,24($30)
800006e4:	93c20018 	lbu	$2,24($30)
800006e8:	00003825 	or	$7,$0,$0
800006ec:	2406000a 	addiu	$6,$0,10
800006f0:	24050001 	addiu	$5,$0,1
800006f4:	00402025 	or	$4,$2,$0
800006f8:	0c000135 	jal	800004d4 <_Z9printbaseliii>
800006fc:	00000000 	sll	$0,$0,0x0
80000700:	3c028000 	lui	$2,0x8000
80000704:	244407c8 	addiu	$4,$2,1992
80000708:	0c000111 	jal	80000444 <_Z9putstringPKc>
8000070c:	00000000 	sll	$0,$0,0x0
80000710:	93c20018 	lbu	$2,24($30)
80000714:	14400006 	bnez	$2,80000730 <main+0xc0>
80000718:	00000000 	sll	$0,$0,0x0
8000071c:	8fc2001c 	lw	$2,28($30)
80000720:	90420000 	lbu	$2,0($2)
80000724:	a3c20018 	sb	$2,24($30)
80000728:	1000fff9 	beqz	$0,80000710 <main+0xa0>
8000072c:	00000000 	sll	$0,$0,0x0
80000730:	3c028000 	lui	$2,0x8000
80000734:	244407cc 	addiu	$4,$2,1996
80000738:	0c000111 	jal	80000444 <_Z9putstringPKc>
8000073c:	00000000 	sll	$0,$0,0x0
80000740:	8fc2001c 	lw	$2,28($30)
80000744:	90420000 	lbu	$2,0($2)
80000748:	a3c20018 	sb	$2,24($30)
8000074c:	93c20018 	lbu	$2,24($30)
80000750:	00003825 	or	$7,$0,$0
80000754:	2406000a 	addiu	$6,$0,10
80000758:	24050001 	addiu	$5,$0,1
8000075c:	00402025 	or	$4,$2,$0
80000760:	0c000135 	jal	800004d4 <_Z9printbaseliii>
80000764:	00000000 	sll	$0,$0,0x0
80000768:	3c028000 	lui	$2,0x8000
8000076c:	244407dc 	addiu	$4,$2,2012
80000770:	0c000111 	jal	80000444 <_Z9putstringPKc>
80000774:	00000000 	sll	$0,$0,0x0
80000778:	8fc2001c 	lw	$2,28($30)
8000077c:	a0400000 	sb	$0,0($2)
80000780:	1000ffd1 	beqz	$0,800006c8 <main+0x58>
80000784:	00000000 	sll	$0,$0,0x0
	...

Disassembly of section .rodata:

80000790 <.rodata>:
80000790:	74736574 	jalx	81cd95d0 <main+0x1cd8f60>
80000794:	61657220 	0x61657220
80000798:	74732064 	jalx	81cc8190 <main+0x1cc7b20>
8000079c:	65747261 	0x65747261
800007a0:	00000a64 	0xa64
800007a4:	74696177 	jalx	81a585dc <main+0x1a57f6c>
800007a8:	20676e69 	addi	$7,$3,28265
800007ac:	20726f66 	addi	$18,$3,28518
800007b0:	61702061 	0x61702061
800007b4:	74656b63 	jalx	8195ad8c <main+0x195a71c>
800007b8:	6168202c 	0x6168202c
800007bc:	526f7473 	beql	$19,$15,8001d98c <main+0x1d31c>
800007c0:	3d646165 	0x3d646165
800007c4:	00000000 	sll	$0,$0,0x0
800007c8:	0000000a 	movz	$0,$0,$0
800007cc:	20746f67 	addi	$20,$3,28519
800007d0:	61702061 	0x61702061
800007d4:	74656b63 	jalx	8195ad8c <main+0x195a71c>
800007d8:	00000000 	sll	$0,$0,0x0
800007dc:	6365720a 	0x6365720a
800007e0:	65766965 	0x65766965
800007e4:	656c2064 	0x656c2064
800007e8:	6874676e 	0x6874676e
800007ec:	00000020 	add	$0,$0,$0

Disassembly of section .reginfo:

800007f0 <.reginfo>:
800007f0:	e00000fc 	sc	$0,252($0)
	...

Disassembly of section .MIPS.abiflags:

80000808 <.MIPS.abiflags>:
80000808:	02200000 	0x2200000
8000080c:	01000101 	0x1000101
	...
80000818:	00000001 	movf	$0,$0,$fcc0
8000081c:	00000000 	sll	$0,$0,0x0

Disassembly of section .eh_frame:

80000820 <.eh_frame>:
80000820:	00000010 	mfhi	$0
80000824:	00000000 	sll	$0,$0,0x0
80000828:	00527a01 	0x527a01
8000082c:	011f7c01 	0x11f7c01
80000830:	001d0d0b 	0x1d0d0b
80000834:	00000020 	add	$0,$0,$0
80000838:	00000018 	mult	$0,$0
8000083c:	80000390 	lb	$0,912($0)
80000840:	00000070 	tge	$0,$0,0x1
80000844:	180e4400 	0x180e4400
80000848:	44019e44 	0x44019e44
8000084c:	54021e0d 	bnel	$0,$2,80008084 <main+0x7a14>
80000850:	de481d0d 	ldc3	$8,7437($18)
80000854:	0000000e 	0xe
80000858:	00000020 	add	$0,$0,$0
8000085c:	0000003c 	0x3c
80000860:	80000400 	lb	$0,1024($0)
80000864:	00000044 	0x44
80000868:	200e4400 	addi	$14,$0,17408
8000086c:	9e019f48 	0x9e019f48
80000870:	1e0d4402 	0x1e0d4402
80000874:	4c1d0d60 	madd.s	$f21,$f0,$f1,$f29
80000878:	000edfde 	0xedfde
8000087c:	00000024 	and	$0,$0,$0
80000880:	00000060 	0x60
80000884:	80000444 	lb	$0,1092($0)
80000888:	00000090 	0x90
8000088c:	280e4400 	slti	$14,$0,17408
80000890:	9e019f48 	0x9e019f48
80000894:	1e0d4402 	0x1e0d4402
80000898:	1d0d6c02 	0x1d0d6c02
8000089c:	0edfde4c 	jal	8b7f7930 <main+0xb7f72c0>
800008a0:	00000000 	sll	$0,$0,0x0
800008a4:	00000024 	and	$0,$0,$0
800008a8:	00000088 	0x88
800008ac:	800004d4 	lb	$0,1236($0)
800008b0:	0000019c 	0x19c
800008b4:	700e4400 	0x700e4400
800008b8:	9e019f48 	0x9e019f48
800008bc:	1e0d4402 	0x1e0d4402
800008c0:	0d017803 	jal	8405e00c <main+0x405d99c>
800008c4:	dfde4c1d 	ldc3	$30,19485($30)
800008c8:	0000000e 	0xe
800008cc:	00000018 	mult	$0,$0
800008d0:	000000b0 	tge	$0,$0,0x2
800008d4:	80000670 	lb	$0,1648($0)
800008d8:	00000118 	0x118
800008dc:	280e4400 	slti	$14,$0,17408
800008e0:	9e019f48 	0x9e019f48
800008e4:	1e0d4402 	0x1e0d4402

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	80000390 	lb	$0,912($0)
   4:	40000000 	mfc0	$0,c0_index
   8:	fffffffc 	sdc3	$31,-4($31)
	...
  14:	00000018 	mult	$0,$0
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f
  20:	80000400 	lb	$0,1024($0)
  24:	c0000000 	ll	$0,0($0)
  28:	fffffffc 	sdc3	$31,-4($31)
	...
  34:	00000020 	add	$0,$0,$0
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f
  40:	80000444 	lb	$0,1092($0)
  44:	c0000000 	ll	$0,0($0)
  48:	fffffffc 	sdc3	$31,-4($31)
	...
  54:	00000028 	0x28
  58:	0000001e 	0x1e
  5c:	0000001f 	0x1f
  60:	800004d4 	lb	$0,1236($0)
  64:	c0000000 	ll	$0,0($0)
  68:	fffffffc 	sdc3	$31,-4($31)
	...
  74:	00000070 	tge	$0,$0,0x1
  78:	0000001e 	0x1e
  7c:	0000001f 	0x1f
  80:	80000670 	lb	$0,1648($0)
  84:	c0000000 	ll	$0,0($0)
  88:	fffffffc 	sdc3	$31,-4($31)
	...
  94:	00000028 	0x28
  98:	0000001e 	0x1e
  9c:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	$3,$18,0x4347
   4:	62552820 	0x62552820
   8:	75746e75 	jalx	5d1b9d4 <__start-0x7a2e462c>
   c:	342e3720 	ori	$14,$1,0x3720
  10:	312d302e 	andi	$13,$9,0x302e
  14:	6e756275 	0x6e756275
  18:	7e317574 	0x7e317574
  1c:	302e3831 	andi	$14,$1,0x3831
  20:	29312e34 	slti	$17,$9,11828
  24:	342e3720 	ori	$14,$1,0x3720
  28:	Address 0x0000000000000028 is out of bounds.


Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <__start-0x7a466400>
   8:	00070100 	sll	$0,$7,0x4
   c:	01040000 	0x1040000
