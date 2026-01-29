PREFIX="*INSERT MODEL HERE*"

 for i in {1..100}
 do
   mkdir run$i
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_jointMAFpop1_0.obs run$i"/"
   cd run$i
    fsc28_linux64/fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -C 10 -n 200000 -L 50 -s0 -M -c 4
   cd ..
 done

CHANGE PARAMETERS OTHER MODELS

cp ${PREFIX}_jointMAFpop1_0.obs ${PREFIX}_maxL_jointMAFpop1_0.obs 

for iter in {1..100}
do
fsc28_linux64/fsc28 -i ${PREFIX}_maxL.par -n 1000000 -m -c 4
 sed -n '2,3p' ${PREFIX}_maxL/${PREFIX}_maxL.lhoods  >> ${PREFIX}.lhoods
done


 for i in {1..100}
 do
   mkdir run$i
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_jointMAFpop1_0.obs run$i"/"
   cd run$i
    /home/eocps010/devivo/fsc/fsctest/fsc28_linux64/fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -C 10 -n 200000 -L 50 -s0 -M -c 4
   cd ..
 done


 for i in {1..100}
 do
   mkdir run$i
   cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_jointMAFpop1_0.obs run$i"/"
   cd run$i
    fsc28_linux64/fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -C 10 -n 200000 -L 50 -s0 -M -c 4
   cd ..
 done


cp ${PREFIX}_jointMAFpop1_0.obs ${PREFIX}_maxL_jointMAFpop1_0.obs

for iter in {1..100}
do
 fsc28_linux64/fsc28  -i ${PREFIX}_maxL.par -n 1000000 -m -c 4
 sed -n '2,3p' ${PREFIX}_maxL/${PREFIX}_maxL.lhoods  >> ${PREFIX}.lhoods
done



