for i in {1..100}
do
mkdir bs$i
cp $PREFIX.txt bs$i"/"
cd bs$i
cat ../header > $PREFIX.bs.$i.vcf
for r in {1..100}
do
cat `shuf -n1 -e ../$PREFIX.sites.*` >> ${PREFIX}.bs.$i.vcf
done
.easySFS.py -i ${PREFIX}.bs.$i.vcf -p $PREFIX.txt --proj 20,22 -a
cd output
cd fastsimcoal2
cp ${PREFIX}_jointMAFpop1_0.obs  ${PREFIX}.bs.${i}_oneevent_jointMAFpop1_0.obs
echo bs$i" ready"
cd ..
cd ..
cd ..
done

for i in {1..100}
do
mkdir bs$i
cp $PREFIX.txt bs$i"/"
cd bs$i
cat ../header > $PREFIX.bs.$i.vcf
for r in {1..100}
do
cat `shuf -n1 -e ../$PREFIX.sites.*` >> ${PREFIX}.bs.$i.vcf
done
./easySFS.py -i ${PREFIX}.bs.$i.vcf -p $PREFIX.txt --proj 22,16 -a
cd output
cd fastsimcoal2
cp ${PREFIX}_jointMAFpop1_0.obs  ${PREFIX}.bs.${i}_oneevent_jointMAFpop1_0.obs
echo bs$i" ready"
cd ..
cd ..
cd ..
done


for bs in {1..100}
do
cd bs$bs
cp output/fastsimcoal2/${PREFIX}.bs.${bs}_oneevent_jointMAFpop1_0.obs ${PREFIX}.bs.${bs}_oneevent_jointMAFpop1_0.obs
cp ../${PREFIX}.est ${PREFIX}.bs.${bs}_oneevent.est
cp ../${PREFIX}.tpl ${PREFIX}.bs.${bs}_oneevent.tpl
cd ..
done


####PUT "-c" AS 12 FOR MAKING IT FASTER

for bs in {1..100}
do
cd bs$bs
for i in {1..100}
do 
mkdir run$i
cp ${PREFIX}.bs.${bs}_oneevent_jointMAFpop1_0.obs ${PREFIX}.bs.${bs}_oneevent.est ${PREFIX}.bs.${bs}_oneevent.tpl run$i"/"
cd run$i
./fsc28_linux64/fsc28 -t ${PREFIX}.bs.${bs}_oneevent.tpl -e ${PREFIX}.bs.${bs}_oneevent.est -m -C 10 -n 200000 -L 50 -s0 -M -c 12
cd ..
done
cd ..
done
