set -xv

+ set -xv
#  ADD_PSD_CORRECTED
#
# Imports are: CASEDIR CASE STAGE SV YR DATA LOCALDSK
#

#if [ `expr $#` -lt 5 ]; then
#   echo "Usage: ADD_PSD_CORRECTED ARC "
#   exit 101
#fi

#echo " # "
#echo " #  ADD_PSD_CORRECTED $* "
#echo " # "

# date '+DATE: %m/%d/%y%nTIME: %H:%M:%S'

SCR_NAME=ADD_PSD_CORRECTED
+ SCR_NAME=ADD_PSD_CORRECTED
SCR_PARM=1
+ SCR_PARM=1
SCR_LIST="ARC "
+ SCR_LIST='ARC '
SCR_VERS=151204.0
+ SCR_VERS=151204.0
#ARC=o10701



ARC=w21204
+ ARC=w21204
CASE=WEEKLY
+ CASE=WEEKLY
    SNX_VER=415

+ SNX_VER=415
mkdir  /tmp/magda/ADD_PSD_MID_$$_$ARC
+ mkdir /tmp/magda/ADD_PSD_MID_83636_w21204
cd  /tmp/magda/ADD_PSD_MID_$$_$ARC
+ cd /tmp/magda/ADD_PSD_MID_83636_w21204
disk=/nobackup/mkuzmicz/MISSIONS
+ disk=/nobackup/mkuzmicz/MISSIONS
MAIN_PATH=/nobackup/mkuzmicz
+ MAIN_PATH=/nobackup/mkuzmicz
diskC=$MAIN_PATH

+ diskC=/nobackup/mkuzmicz
 ### PROPGATE to mid arc


cat $MAIN_PATH/INFILES/INF_OPS_ITRF2020/MID-ARC_INFO.${CASE}_v${SNX_VER} > ftn05

+ cat /nobackup/mkuzmicz/INFILES/INF_OPS_ITRF2020/MID-ARC_INFO.WEEKLY_v415
+ 1> ftn05
#  post-Arequipa quake positions:

   zcat /${disk}/d_base/site/DAILY/SLRF2020/w30101_230214_UF.adj.gz > ftn10


+ zcat //nobackup/mkuzmicz/MISSIONS/d_base/site/DAILY/SLRF2020/w30101_230214_UF.adj.gz
+ 1> ftn10
/${diskC}/EXECUTABLES/stapropgt.x        < ftn05 > PGT.$ARC

+ //nobackup/mkuzmicz/EXECUTABLES/stapropgt.x
+ 0< ftn05 1> PGT.w21204
STOP  Finished Direct Propagation
#/bin/grep -v SIGVEL ftn11 > s1 
cat  ftn11 > s1
+ cat ftn11
+ 1> s1
cp /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/*.ITRF2020 .


+ cp /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/21611S001.7237.A.2.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/21704M001.7328.A.3.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/21704S002.7308.A.3.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/21726S001.7838.A.4.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/21749S001.7358.A.4.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/40497M001.7110.A.4.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/41719M001.7405.A.5.ITRF2020 /nobackup/mkuzmicz/MISSIONS/d_base/site/ITRF2020_PSD/IMPLEMENT_PSD_2022_DAILY/PSD_CORRECTED_STAPOS/42202M003.7403.A.7.ITRF2020 .
rm ARC_4* 
+ rm 'ARC_4*'
rm: cannot remove 'ARC_4*': No such file or directory
cat *.ITRF2020 > ALL_ARC



+ cat 21611S001.7237.A.2.ITRF2020 21704M001.7328.A.3.ITRF2020 21704S002.7308.A.3.ITRF2020 21726S001.7838.A.4.ITRF2020 21749S001.7358.A.4.ITRF2020 40497M001.7110.A.4.ITRF2020 41719M001.7405.A.5.ITRF2020 42202M003.7403.A.7.ITRF2020
+ 1> ALL_ARC
grep "^$ARC" ALL_ARC > temp_arc
+ grep ^w21204 ALL_ARC
+ 1> temp_arc
cut -c8-122 temp_arc > replace_STAPOS
+ cut -c8-122 temp_arc
+ 1> replace_STAPOS
grep -v  CONST replace_STAPOS > replace_STAPOS2

+ grep -v CONST replace_STAPOS
+ 1> replace_STAPOS2
while read  STAT1 STAT2
do

echo $STAT1 $STAT2
grep $STAT1 replace_STAPOS > replace_STAPOS_1
grep $STAT1 s1 > s1_1
grep $STAT2 replace_STAPOS > replace_STAPOS_2
cp replace_STAPOS_2 replace_STAPOS_$STAT2
grep $STAT2 s1 > s1_2
cp s1_2 s1_2_$STAT2
 

if [ -s "replace_STAPOS_$STAT2" ] && [ -s "s1_2_$STAT2" ]
then

arcline1=`sed -n "/$STAT1/=" s1 `
echo $arcline1 > ppp1
arcline11=`awk ' {print $1} ' ppp1`
arcline12=` expr $arcline11 - 1 `
sed -n "${arcline12}p" s1 > s2_1
cat s2_1 > s2_3
cat replace_STAPOS_1 >> s2_3
arcline21=` expr $arcline11 - 1 `
arcline22=` expr $arcline11 - 2 `

arcline1=`sed -n "/$STAT2/=" s1 `
echo $arcline1 > ppp1
arcline11=`awk ' {print $1} ' ppp1`
arcline12=` expr $arcline11 - 1 `
sed -n "${arcline12}p" s1 > s2_2
cat s2_2 > s2_4
cat replace_STAPOS_2 >> s2_4
echo "CONSTADJ" > A1
cat s2_3 >> A1
cat s2_4 >> A1
echo "CONSTEND" >> A1
arcline33=` expr $arcline11 + 4 `
if  [ "${STAT1}" = "74050000" ]; then
sed -e "s/74057904/74057914/" s2_4 > s2_5
echo "CONSTADJ" > A1
cat s2_3 >> A1
cat s2_4 >> A1
echo "INSTRMNT 3     0                           0.84700                    SLRF2020 018037001 41719M001 " >> A1
grep -v "INSTRMNT 3" s2_5 > s2_6
cat s2_6 >> A1
echo "CONSTEND" >> A1
fi
# sed "${arcline22},${arcline21}d" s1 > s11
# sed "${arcline12}d" s11 > s22
# sed "${arcline33}d" s22 > s33

 sed -e "${arcline22},${arcline21}d" -e   "${arcline12}d" -e "${arcline33}d" s1 > s33
 if  [ "${STAT1}" = "74050000" ]; then
    grep -v -e $STAT2 -e $STAT1 -e "41719M001"  s33 > s44
elif  [ "${STAT1}" = "74030000" ]; then
   grep -v -e $STAT2 -e $STAT1 -e "42202M003"  s33 > s44

	   else
	    grep -v -e $STAT2 -e $STAT1 s33 > s44
		 fi
 cp s44 s44_$STAT1
cat A1 >> s44
mv A1 s1_$STAT1
#cp s44 s1
#rm s33 s44 s11 s11 ppp1 s?_? A1 replace_STAPOS_?
   else
   echo "$file not found."
#rm s33 s44 s11 s11 ppp1 s?_? A1 replace_STAPOS_?

				                fi
done < /$MAIN_PATH/INFILES/STATIONS_PSD_CORR_2

+ 0< //nobackup/mkuzmicz/INFILES/STATIONS_PSD_CORR_2
+ read STAT1 STAT2
+ echo 71100000 71100412
71100000 71100412
+ grep 71100000 replace_STAPOS
+ 1> replace_STAPOS_1
+ grep 71100000 s1
+ 1> s1_1
+ grep 71100412 replace_STAPOS
+ 1> replace_STAPOS_2
+ cp replace_STAPOS_2 replace_STAPOS_71100412
+ grep 71100412 s1
+ 1> s1_2
+ cp s1_2 s1_2_71100412
+ [ -s replace_STAPOS_71100412 ]
+ [ -s s1_2_71100412 ]
sed -n "/$STAT1/=" s1 
+ sed -n '/71100000/=' s1
+ arcline1=$'183\n184\n185\n186'
+ echo 183 184 185 186
+ 1> ppp1
awk ' {print $1} ' ppp1
+ awk ' {print $1} ' ppp1
+ arcline11=183
 expr $arcline11 - 1 
+ expr 183 - 1
+ arcline12=182
+ sed -n 182p s1
+ 1> s2_1
+ cat s2_1
+ 1> s2_3
+ cat replace_STAPOS_1
+ 1>> s2_3
 expr $arcline11 - 1 
+ expr 183 - 1
+ arcline21=182
 expr $arcline11 - 2 
+ expr 183 - 2
+ arcline22=181
sed -n "/$STAT2/=" s1 
+ sed -n '/71100412/=' s1
+ arcline1=$'188\n189\n190\n191'
+ echo 188 189 190 191
+ 1> ppp1
awk ' {print $1} ' ppp1
+ awk ' {print $1} ' ppp1
+ arcline11=188
 expr $arcline11 - 1 
+ expr 188 - 1
+ arcline12=187
+ sed -n 187p s1
+ 1> s2_2
+ cat s2_2
+ 1> s2_4
+ cat replace_STAPOS_2
+ 1>> s2_4
+ echo CONSTADJ
+ 1> A1
+ cat s2_3
+ 1>> A1
+ cat s2_4
+ 1>> A1
+ echo CONSTEND
+ 1>> A1
 expr $arcline11 + 4 
+ expr 188 + 4
+ arcline33=192
+ [ 71100000 '=' 74050000 ]
+ sed -e 181,182d -e 187d -e 192d s1
+ 1> s33
+ [ 71100000 '=' 74050000 ]
+ [ 71100000 '=' 74030000 ]
+ grep -v -e 71100412 -e 71100000 s33
+ 1> s44
+ cp s44 s44_71100000
+ cat A1
+ 1>> s44
+ mv A1 s1_71100000
+ read STAT1 STAT2
#compress -f  s1
#gzip  -f  s1
#cp s1.gz /${disk}/d_base/site/DAILY/SLRF2020/MID-ARC_EPOCH/${ARC}.adj.gz


exit 222
+ exit 222
