#!/usr/bin/perl -w
#$Id: mksamplecsv.pl,v 1.17 2007/06/07 14:26:02 hoi Exp $

# Perl modules
use strict;
use Getopt::Long;

# init
my $sname  = "sample";
my $suid   = "11025";
my $sgid   = "11025";
my $sgname = "samples";
my $spass  = "passwd";
my $sshell = "/bin/bash";
my $ssrv   =  `/bin/hostname -s`;
my $sroot   =  "home";
my $num    = 5;
my $min_uid = 502;
my $max_uid = 2147483648;
my ( $help, $debug, $name, $gname, $shell, $rn, $fn, $max_num,
	$realname, $i,  $uid, $real, @realusername, @realaccount,
	@realgroup, @realgid, @realgroupname, @realgroupid,
);

chomp $ssrv;

# optons
GetOptions (	
		"user:s"  => \$sname,  # Sample account
		"uid:i"   => \$suid,   # Sample uid
		"gid:i"   => \$sgid,   # Sample gid
		"group:s" => \$sgname, # Sample group name
		"num=i"   => \$num,    # Sample number
		"passwd:s"   => \$spass,    # Sample passwd
		"homesrv:s"   => \$ssrv,  # Sample home server
		"homeroot:s"   => \$sroot,  # Sample home root dir
		"shell:s"   => \$sshell,  # Sample user login shell
		"help!"    => \$help,   # Request help
		"debug!"   => \$debug,  # Request debug
		"real!"   => \$real,  # Request real user sample
);

if ($help){ &usage($ssrv); exit 0; }

$name	= lc $sname ;
$gname	= lc $sgname ;
$shell	= lc $sshell ;
$realname = (ucfirst $name) . " User" ;

$suid = $min_uid if ( $suid < $min_uid);
$suid = $max_uid if ( $suid > $max_uid) ;
$sgid = $min_uid if ( $sgid < $min_uid);
$sgid = $max_uid if ( $sgid > $max_uid) ;
$max_num = $max_uid - $suid + 1;
$num = $max_num if ($num > $max_num);
$num = 1 if ($num < 1);
if ( $real ){
	$spass  = "apple";
	@realgroupname = ( "actress", "rakugo", "moviestar", "cx" );
	@realgroupid = ( 9100, 9110, 9120, 9130 );
	$sgid = 9100; 
	$suid = 9101; 

	$realusername[1] = "新垣 結衣";	$realaccount[1] = "yui"; $realgroup[1] = $realgroupname[0]; $realgid[1] = $realgroupid[0];
	$realusername[2] = "戸田 恵梨香";	$realaccount[2] = "toda"; $realgroup[2] = $realgroupname[0]; $realgid[2] = $realgroupid[0];
	$realusername[3] = "上戸 彩";	$realaccount[3] = "aya"; $realgroup[3] = $realgroupname[0]; $realgid[3] = $realgroupid[0];
	$realusername[4] = "佐々木 希";	$realaccount[4] = "nozomi"; $realgroup[4] = $realgroupname[0]; $realgid[4] = $realgroupid[0];
	$realusername[5] = "上野 樹里";	$realaccount[5] = "jyuri"; $realgroup[5] = $realgroupname[0]; $realgid[5] = $realgroupid[0];
	$realusername[6] = "菅野 美穂";	$realaccount[6] = "miho"; $realgroup[6] = $realgroupname[0]; $realgid[6] = $realgroupid[0];
	$realusername[7] = "深津 絵里";	$realaccount[7] = "eri"; $realgroup[7] = $realgroupname[0]; $realgid[7] = $realgroupid[0];
	$realusername[8] = "水川 あさみ";	$realaccount[8] = "asami";  $realgroup[8] = $realgroupname[0]; $realgid[8] = $realgroupid[0];
	$realusername[9] = "本仮屋 ユイカ";	$realaccount[9] = "yuika"; $realgroup[9] = $realgroupname[0]; $realgid[9] = $realgroupid[0];
	$realusername[10] = "優木 まおみ";	$realaccount[10] = "maomi";$realgroup[10] = $realgroupname[0]; $realgid[10] = $realgroupid[0];
	$realusername[11] = "笑福亭 鶴瓶";	$realaccount[11] = "tsurube";$realgroup[11] = $realgroupname[1]; $realgid[11] = $realgroupid[1];
	$realusername[12] = "桂 米朝";    $realaccount[12] = "beichou";$realgroup[12] = $realgroupname[1]; $realgid[12] = $realgroupid[1];
	$realusername[13] = "桂 ざこば";    $realaccount[13] = "zakoba";$realgroup[13] = $realgroupname[1]; $realgid[13] = $realgroupid[1];
	$realusername[14] = "桂 文珍";    $realaccount[14] = "bunchin";$realgroup[14] = $realgroupname[1]; $realgid[14] = $realgroupid[1];
	$realusername[15] = "月亭 八方";    $realaccount[15] = "happou";$realgroup[15] = $realgroupname[1]; $realgid[15] = $realgroupid[1];
	$realusername[16] = "渡辺 謙";    $realaccount[16] = "ken"; $realgroup[16] = $realgroupname[2]; $realgid[16] = $realgroupid[2];
	$realusername[17] = "伊武 雅刀";  $realaccount[17] = "ibu"; $realgroup[17] = $realgroupname[2]; $realgid[17] = $realgroupid[2];
	$realusername[18] = "藤田 まこと";   $realaccount[18] = "fujita"; $realgroup[18] = $realgroupname[2]; $realgid[18] = $realgroupid[2];
	$realusername[19] = "佐野 史郎";    $realaccount[19] = "sano"; $realgroup[19] = $realgroupname[2]; $realgid[19] = $realgroupid[2];
	$realusername[20] = "真田 広之";   $realaccount[20] = "sanada"; $realgroup[20] = $realgroupname[2]; $realgid[20] = $realgroupid[2];
	$realusername[21] = "軽部 真一";   $realaccount[21] = "karube"; $realgroup[21] = $realgroupname[3]; $realgid[21] = $realgroupid[3];
	$realusername[22] = "高島 彩";   $realaccount[22] = "aya"; $realgroup[22] = $realgroupname[3]; $realgid[22] = $realgroupid[3];
	$realusername[23] = "皆藤 愛子";   $realaccount[23] = "ai"; $realgroup[23] = $realgroupname[3]; $realgid[23] = $realgroupid[3];
	$realusername[24] = "大塚 範一";   $realaccount[24] = "otsuka"; $realgroup[24] = $realgroupname[3]; $realgid[24] = $realgroupid[3];
	$realusername[25] = "伊藤 利尋";   $realaccount[25] = "toshihiro"; $realgroup[25] = $realgroupname[3]; $realgid[25] = $realgroupid[3];
	$realusername[26] = "生野 陽子";   $realaccount[26] = "shouno"; $realgroup[26] = $realgroupname[3]; $realgid[26] = $realgroupid[3];
	$realusername[27] = "中野 美奈子";   $realaccount[27] = "nakano"; $realgroup[27] = $realgroupname[3]; $realgid[27] = $realgroupid[3];
	$realusername[28] = "井上 真央";   $realaccount[28] = "inoue"; $realgroup[28] = $realgroupname[2]; $realgid[28] = $realgroupid[2];
	$realusername[29] = "深田 恭子";   $realaccount[29] = "fukada"; $realgroup[29] = $realgroupname[2]; $realgid[29] = $realgroupid[2];
	$realusername[30] = "蒼井 優";   $realaccount[30] = "aoi"; $realgroup[30] = $realgroupname[2]; $realgid[30] = $realgroupid[2];
	$realusername[31] = "上野 樹里";   $realaccount[31] = "juri"; $realgroup[31] = $realgroupname[2]; $realgid[31] = $realgroupid[2];
	$realusername[32] = "多岐川 華子";   $realaccount[32] = "hana"; $realgroup[32] = $realgroupname[3]; $realgid[32] = $realgroupid[3];
	$realusername[33] = "生瀬 勝久";   $realaccount[33] = "namase"; $realgroup[33] = $realgroupname[2]; $realgid[33] = $realgroupid[2];
	$realusername[34] = "ケンドー コバヤシ";   $realaccount[34] = "kenkoba"; $realgroup[34] = $realgroupname[2]; $realgid[34] = $realgroupid[2];

	$num = $#realusername if ($num > $#realusername);
 }
print "#";
print "Full name,";
print "account,";
print "password,";
print "UID,";
print "2nd Group,";
print "2nd GID,";
print "home server,";
print "home root,";
print "shell";
print "\n";

for ($i = 1; $i <= $num ; $i++ ){
	$uid = $suid + $i -1;
	printf ("%03d; ", $i) if ( $debug );
	if ($real){
		# ($rn,$fn)=split " ", $realusername[$i];
		# printf ("%s %s," ,ucfirst($rn),uc($fn));
		print ( "$realusername[$i],");
		printf ("%s," ,lc($realaccount[$i]));
	}else{
		printf ("%s%03d," ,$realname,$i);
		printf ("%s%03d," ,$name,$i);
	}
	print  ("$spass,");
	print  ("$uid,");
	if ( $real ) {
		print ( "$realgroup[$i],$realgid[$i]," );
	}else{
		print  ("$gname,");
		print  ("$sgid,");
	}
	print  ("$ssrv,");
	print  ("$sroot,");
	print  ("$shell");
	print "\n";
}

exit 0;

# -----------------------------------------
#         S U B R O U T I N E S
# -----------------------------------------
sub usage()
{
	my $thisScript = `basename $0`;
	my ($SRV)= @_ ;
	chomp $SRV;
	chomp $thisScript;
	print <<__USE__

#####################################
              U S A G E
#####################################

Hi $ENV{USER}.
 
$thisScript has many switches.
	--user=sample   ; sample account name.
	--uid=11025     ; start acount uid number. ( 501 < uid < 2,147,483,649)
	--gid=11025     ; group id.
	--group=samples ; sample group name
	--num=5         ; limit of sample line ( n > 0 ).
	--passwd=plain_password   ; sample password       
	--homeroot=home ; samaple home root (It's share point not user's home).
	--homesrv=$SRV  ; samaple home server
	--shell         ; users shell
	--help          ; show this message.
	--debug         ; for debug.
	--real          ; make users using real user names. 
			; maximum number of sample is 20.


                             Thanks.
#####################################
__USE__
;
print ("Output example: $0 --num=3\n");
system ( "$0 --num=3") ;
print ("\nOutput example: $0 --num=3 --real\n");
system ( "$0 --num=3 --real ") ;
}
__END__
