{ config, pkgs, ... }:
{
	networking = {
		wireless = {
      userControlled.enable = true;
			networks."NETGEAR92".pskRaw = "2dc9c8963a51980679a8244ef2effac784e5013005a13da4731b380e773cfdc4";
			networks."Fios-ZbCW2".pskRaw = "5a0bb3e4647b5e5f7c93a73f021d25186d41dca3b786d0fd58a3427fe527a2be";
		};
	};
}



