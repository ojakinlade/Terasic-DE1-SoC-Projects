/* Quartus Prime Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("/home/ojakinlade/Documents/terasic-de1-soc-projects/Projects/P7_VGA/output_files/") File("vga_top.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
