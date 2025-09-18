{ pkgs }:

pkgs.stdenv.mkDerivation {
	pname = "dconf-watch-dump";
	version = "1.0.0";

	src = ./.;

	installPhase = ''
		mkdir -p $out/bin
		cp $src/dconf-watch-dump.sh $out/bin/dconf-watch-dump
		chmod +x $out/bin/dconf-watch-dump
	'';
}
